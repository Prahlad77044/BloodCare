import 'dart:convert';
import 'package:bdc/presentation/profile_screen/editprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final picker = ImagePicker();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  bool _editable = false;

  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  var image;
  Future getProfileImage() async {
    String? accessToken = await secureStorage.read(key: 'access_token');
    String? refreshToken = await secureStorage.read(key: 'refresh_token');
    String yourToken = "$accessToken";

    Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);
    print('$decodedToken');

    // Extract user ID from the decoded token
    var userid = decodedToken['user_id'];

    try {
      String url = "http://192.168.1.7:4444/bloodcare/images/";

      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
      );
      print("${response.body}");

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        image = responseData[0]['profilepic'];
        // if responseData is a Map, wrap it in a list
        if (responseData is Map) {
          return [responseData];
        } else {
          return responseData;
        }
      } else {
        print('The response is not JSON.');
        return []; // return an empty list if the response is not JSON
      }
    } catch (e) {
      print('Caught error: $e');

      return [e];
    }
  }

  Future getProfile() async {
    String? accessToken = await secureStorage.read(key: 'access_token');
    String? refreshToken = await secureStorage.read(key: 'refresh_token');
    String yourToken = "$accessToken";

    Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);
    print('$decodedToken');

    // Extract user ID from the decoded token
    var userid = decodedToken['user_id'];
    try {
      String url = "http://192.168.1.7:4444/api/user/profile/$userid";

      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
      );
      print("${response.body}");

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        // if responseData is a Map, wrap it in a list
        if (responseData is Map) {
          return [responseData];
        } else {
          return responseData;
        }
      } else {
        print('The response is not JSON.');
        return []; // return an empty list if the response is not JSON
      }
    } catch (e) {
      print('Caught error: $e');

      return [e];
    }
  }

  // Future getProfile() async {
  //   String? accessToken = await secureStorage.read(key: 'access_token');
  //   String yourToken = "$accessToken";
  //   Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);

  //   var userid = decodedToken['user_id'];

  //   String url = "http://192.168.1.4:4444/api/profile/$userid";

  //   try {
  //     var response = await http.get(
  //       Uri.parse(url),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization': 'Bearer $accessToken',
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       var responseData = jsonDecode(response.body);
  //       // if responseData is a Map, wrap it in a list
  //       if (responseData is Map) {
  //         return [responseData];
  //       } else {
  //         return responseData;
  //       }
  //     } else {
  //       print('The response is not JSON.');
  //       return []; // return an empty list if the response is not JSON
  //     }
  //   } catch (e) {
  //     print('Caught error: $e');

  //     return [e];
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getProfile();
    getProfileImage();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProfile(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Column(
                  children: [
                    CircularProgressIndicator.adaptive(),
                  ],
                ),
              ),
            );
          }

          final data = snapshot.data as List;

          _controller.text = "${data[0]['name']}";
          _controller1.text = "${data[0]['address']}";
          _controller2.text = "${data[0]['phone_number']}";
          _controller4.text = "${data[0]['bloodgroup']}";
          _controller3.text = "${data[0]['email']}";
          return FutureBuilder(
              future: getProfileImage(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator.adaptive(),
                        ],
                      ),
                    ),
                  );
                }

                final data = snapshot.data as List;
                image = data[0]['profilepic'];
                return Scaffold(
                  backgroundColor: Colors.red[50],
                  appBar: AppBar(
                    backgroundColor: Colors.red[800],
                    title: Text(
                      'My Profile',
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
                              onTap: () {},
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
                                  child: image == null
                                      ? Image.asset(
                                          'assets/images/profile1.png',
                                        )
                                      : Image.network(
                                          '$image'
                                              as String, // Assuming image is a String URL
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
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
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
                          padding: EdgeInsets.only(
                              top: 280.0, left: 10, right: 10, bottom: 10),
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
                                      left: 15.0,
                                      top: 25,
                                      bottom: 15,
                                      right: 15),
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
                                          labelStyle:
                                              TextStyle(color: Colors.red[800]),
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
                                      left: 15.0,
                                      top: 2,
                                      bottom: 15,
                                      right: 15),
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
                                          labelStyle:
                                              TextStyle(color: Colors.red[800]),
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
                                      left: 15.0,
                                      top: 2,
                                      bottom: 15,
                                      right: 15),
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
                                          labelStyle:
                                              TextStyle(color: Colors.red[800]),
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
                                      left: 15.0,
                                      top: 2,
                                      bottom: 15,
                                      right: 15),
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
                                          labelStyle:
                                              TextStyle(color: Colors.red[800]),
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
                                      left: 15.0,
                                      top: 2,
                                      bottom: 15,
                                      right: 15),
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
                                          labelStyle:
                                              TextStyle(color: Colors.red[800]),
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
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditProfile(
                                                          name:
                                                              _controller.text,
                                                          phone:
                                                              _controller2.text,
                                                          address:
                                                              _controller1.text,
                                                          email:
                                                              _controller3.text,
                                                          bloodgroup:
                                                              _controller4
                                                                  .text)));
                                        },
                                        child: Text(
                                          'Edit Profile',
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
              });
        });
  }
}
