import 'dart:io';

import 'package:bdc/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UploadDocumentScreen extends StatefulWidget {
  const UploadDocumentScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<UploadDocumentScreen> createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  File? _image;
  final picker = ImagePicker();

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
      Uri.parse('http://192.168.1.4:4444/api/user/documents/'),
    );

    request.headers['Authorization'] = 'Bearer $yourToken';
    request.headers['Content-Type'] = 'application/json; charset=UTF-8';

    // Add the image file to the request
    if (_image != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'documentpic', // Field name on the backend
          _image!.path,
        ),
      );
    }
    request.fields['user_id'] = '$userid';

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
          SnackBar(content: Text('Document updated successfully')),
        );
      } else {
        final responseString = await response.stream.bytesToString();
        print('Response Status Code: ${response.statusCode}');
        print('Response Body: $responseString');
        // Show an error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update document')),
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

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Upload Document', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red[800],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 44.h,
              vertical: 58.v,
            ),
            child: Column(
              children: [
                Text(
                  'Click Here',
                  style: TextStyle(
                      color: Colors.red[800],
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10.v),
                GestureDetector(
                  onTap: showOptions,
                  child: ClipRRect(
                    child: _image == null
                        ? Icon(
                            Icons.image,
                            size: 300,
                          )
                        : Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                SizedBox(height: 40.v),
                Text(
                  "It may take some time to verify your document.Your patience is appreciated.",
                  style: CustomTextStyles.titleSmallPrimaryMedium,
                ),
                SizedBox(height: 5.v),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () {
                          imageSubmit1();
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
