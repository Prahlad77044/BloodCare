import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  File? _image;

//Image Picker function to get image from gallery
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _editable = true;
              });
            },
            icon: Icon(Icons.edit),
            tooltip: "Edit Info",
          ),
        ],
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
                              setState(() {
                                _editable = false;
                              });
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
