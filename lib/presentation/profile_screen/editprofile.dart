import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;

class EditProfile extends StatefulWidget {
  String name, phone, address, email, bloodgroup;
  EditProfile({
    required this.name,
    required this.address,
    required this.bloodgroup,
    required this.email,
    required this.phone,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  final picker = ImagePicker();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  bool _editable = true;

  File? _image;
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

//Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('User didnt pick any image.');
      }
    });
  }

  Future<void> imageSubmit1() async {
    // Get the access token from secure storage
    String? accessToken = await secureStorage.read(key: 'access_token');
    String yourToken = "$accessToken";
    Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);
    print('$decodedToken');

    // Extract user ID from the decoded token
    var userid = decodedToken['user_id'];

    // Create a multipart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.1.4:4444/api/user/profilepictures/'),
    );

    request.headers['Authorization'] = 'Bearer $yourToken';
    request.headers['Content-Type'] = 'application/json; charset=UTF-8';

    // Add the image file to the request
    if (_image != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'profilepic', // Field name on the backend
          _image!.path,
        ),
      );
    }

    try {
      // Send the request and get the response
      final response = await request.send();

      // Check if the response is successful
      if (response.statusCode == 200) {
        // Read and print the response
        final responseString = await response.stream.bytesToString();
        print('Response: $responseString');

        // Show a success message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profle Info updated successfully')),
        );
      } else {
        final responseString = await response.stream.bytesToString();
        print('Response Status Code: ${response.statusCode}');
        print('Response Body: $responseString');
        // Show an error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile info')),
        );
      }
    } catch (e) {
      print('Error: $e');
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred')),
      );
    }
  }

  Future editprofile() async {
    String? accessToken = await secureStorage.read(key: 'access_token');
    String? refreshToken = await secureStorage.read(key: 'refresh_token');
    print('button pressed');
    print('$accessToken');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken!);
    print('$decodedToken');

    // Extract user ID from the decoded token
    var userid = decodedToken['user_id'];
    var url = 'http://192.168.1.4:4444/api/user/profile/';

    var response = await http.patch(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({
        'name': _controller.text.toString(),
        'phone_number': _controller2.text.toString(),
        'bloodgroup': _controller4.text.toString(),
        'address': _controller1.text.toString(),
        // 'city': cityController.text.toString(),
        // 'district': district.toString(),
        // 'dob': dateOfBirthController.text.toString(),
        // 'gender': genderController.text,
        'email': _controller3.text.toString()
      }),
    );
    if (response.statusCode == 200) {
      // print('${response.statusCode}');
      // print('Update successful');
    } else {
      // print('${response.statusCode}');
    }
    // print("${response.body}");
    return response.body;
  }

  //   var url = 'http://192.168.1.4:4444/api/user/userdetail/$userid';

  //   var response = await http.put(
  //     Uri.parse(url),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Authorization': 'Bearer $accessToken',
  //     },
  //     body: jsonEncode({
  //       'name': widget.name.toString(),
  //       'address': widget.address.toString(),
  //       'bloodgroup': widget.bloodgroup.toString(),
  //       'phone_number': widget.phone.toString(),
  //       'email': widget.email.toString()
  //     }),
  //   );
  //   if (response.statusCode == 201) {
  //     print('post successful');
  //   } else {
  //     print('${response.statusCode}');
  //   }

  //   print("${response.body}");
  //   return response.body;
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.name;
    _controller1.text = widget.address;
    _controller2.text = widget.phone;
    _controller3.text = widget.email;
    _controller4.text = widget.bloodgroup;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        title: Text(
          '',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 120,
              width: double.maxFinite,
              child: Text(''),
              decoration: BoxDecoration(
                  color: Colors.red[800],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Center(
                child: GestureDetector(
                  onTap: showOptions,
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 3.0,
                            spreadRadius: 2.0,
                          ),
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: _image == null
                          ? Image.asset(
                              'assets/images/profile1.png',
                            )
                          : Image.file(
                              _image!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 150),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(
                            0,
                            0,
                          ),
                          blurRadius: 2.0,
                          spreadRadius: 3.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              _controller.text,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'No. of Successful Donations',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red[800]),
                              ),
                            ),
                            Text(
                              '3',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red[800]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 280.0, left: 10, right: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(
                        0,
                        0,
                      ),
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, top: 25, bottom: 15, right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(
                                0,
                                0,
                              ),
                              blurRadius: 2.0,
                              spreadRadius: 3.0,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: 'Full Name',
                              labelStyle: TextStyle(color: Colors.red[800]),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                          enabled: _editable,
                          controller: _controller,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, top: 2, bottom: 15, right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(
                                0,
                                0,
                              ),
                              blurRadius: 2.0,
                              spreadRadius: 3.0,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: 'Address',
                              labelStyle: TextStyle(color: Colors.red[800]),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black45),
                          enabled: _editable,
                          controller: _controller1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, top: 2, bottom: 15, right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(
                                0,
                                0,
                              ),
                              blurRadius: 2.0,
                              spreadRadius: 3.0,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: 'Phone No.',
                              labelStyle: TextStyle(color: Colors.red[800]),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                          keyboardType: TextInputType.phone,
                          style: TextStyle(color: Colors.black45),
                          enabled: _editable,
                          controller: _controller2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, top: 2, bottom: 15, right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(
                                0,
                                0,
                              ),
                              blurRadius: 2.0,
                              spreadRadius: 3.0,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: 'Blood Group',
                              labelStyle: TextStyle(color: Colors.red[800]),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black45),
                          enabled: _editable,
                          controller: _controller4,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, top: 2, bottom: 15, right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(
                                0,
                                0,
                              ),
                              blurRadius: 2.0,
                              spreadRadius: 3.0,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: 'Email Id',
                              labelStyle: TextStyle(color: Colors.red[800]),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.black45),
                          enabled: _editable,
                          controller: _controller3,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                            onPressed: () {
                              editprofile();
                              imageSubmit1();
                            },
                            child: Text(
                              'Save',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
