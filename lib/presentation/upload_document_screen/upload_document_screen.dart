import 'dart:io';

import 'package:bdc/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      Uri.parse('http://192.168.1.6:4444/bloodcare/images/'),
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
          SnackBar(content: Text('Picture updated successfully')),
        );
      } else {
        final responseString = await response.stream.bytesToString();
        print('Response Status Code: ${response.statusCode}');
        print('Response Body: $responseString');
        // Show an error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update picture')),
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
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 44.h,
            vertical: 58.v,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Text(
                    "Upload here",
                    style: CustomTextStyles.titleLargePrimary,
                  ),
                ),
              ),
              SizedBox(height: 77.v),
              GestureDetector(
                onTap: showOptions,
                child: CustomImageView(
                  imagePath: ImageConstant.imgWhiteCloudWith,
                  height: 277.v,
                  width: 287.h,
                ),
              ),
              SizedBox(height: 61.v),
              Text(
                "It may take some time to verify your document.Please be patient",
                style: CustomTextStyles.titleSmallPrimaryMedium,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
