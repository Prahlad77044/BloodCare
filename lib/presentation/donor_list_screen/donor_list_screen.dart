import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:bdc/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class DonorListScreen extends StatefulWidget {
  const DonorListScreen({Key? key}) : super(key: key);

  @override
  State<DonorListScreen> createState() => _DonorListScreenState();
}

class _DonorListScreenState extends State<DonorListScreen> {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future getDonors() async {
    String url = "http://192.168.1.4:4444/bloodcare/donors/";
    String? accessToken = await secureStorage.read(key: 'access_token');
    print("$accessToken");
    String? refreshToken = await secureStorage.read(key: 'refresh_token');
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print("${responseData}");

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

  @override
  void initState() {
    super.initState();
    getDonors();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return FutureBuilder(
      future: getDonors(),
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
        return Scaffold(
          backgroundColor: theme.colorScheme.primary,
          appBar: AppBar(
            title: Text(
              'Donor\'s List',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red[800],
          ),
          body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 23.v),
            decoration: AppDecoration.fillOnPrimary,
            child: Column(
              children: [
                Text(
                  "Select from the list of donors to request",
                  style: CustomTextStyles.labelLargePrimary,
                ),
                SizedBox(height: 15.v),
                SizedBox(height: 10),
                Text(
                  "Please fill up this form if you're requesting blood for the first time.",
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/doc_request_one_screen');
                  },
                  child: Text(
                    'Click Here.',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.red,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 1.h),
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 7.v);
                      },
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(9.h),
                          decoration: AppDecoration.outlineBlack900,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 1.h),
                                    child: Text(
                                      "${data[index]['name']}",
                                      style: CustomTextStyles.titleSmallPink900,
                                    ),
                                  ),
                                  SizedBox(height: 1.v),
                                  Container(
                                    width: 110.h,
                                    margin: EdgeInsets.only(left: 1.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 8.v),
                                          child: Text(
                                            "${data[index]['gender']}",
                                            style: CustomTextStyles.bodySmall10,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 21.v,
                                          width: 45.h,
                                          child: Stack(
                                            alignment: Alignment.bottomLeft,
                                            children: [
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  "${data[index]['bloodgrp']}",
                                                  style: CustomTextStyles
                                                      .bodySmall10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 1.v),
                                  Padding(
                                    padding: EdgeInsets.only(left: 1.h),
                                    child: Text(
                                      "Address",
                                    ),
                                  ),
                                  Text(
                                    "${data[index]['city']},${data[index]['district']}",
                                    style: CustomTextStyles.bodySmall8,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 20.h,
                                  top: 18.v,
                                  bottom: 21.v,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Contact",
                                    ),
                                    Text(
                                      "${data[index]['phoneno']}",
                                      style: CustomTextStyles.bodySmall10,
                                    ),
                                  ],
                                ),
                              ),
                              CustomElevatedButton(
                                height: 34.v,
                                width: 98.h,
                                text: "View",
                                margin: EdgeInsets.only(
                                  left: 12.h,
                                  top: 8.v,
                                  bottom: 19.v,
                                ),
                                onPressed: () {
                                  _showDonorDetailsBottomSheet(
                                      context, data[index]);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDonorDetailsBottomSheet(
      BuildContext context, Map<String, dynamic> donorDetails) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                donorDetails['name'] ?? 'Donor Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text("Blood Group: ${donorDetails['bloodgrp']}"),
              SizedBox(height: 10),
              Text("Gender: ${donorDetails['gender']}"),
              SizedBox(height: 10),
              Text(
                  "Location: ${donorDetails['lattitude']}, ${donorDetails['longitude']}"),
              SizedBox(height: 10),
              Text("Phone No.: ${donorDetails['phoneno']}"),
              SizedBox(height: 10),
              Text("DOB: ${donorDetails['dob']}"),
              SizedBox(height: 10),
              Text("Province no.: ${donorDetails['prov_no']}"),
              SizedBox(height: 10),
              Text("City: ${donorDetails['city']}"),
              SizedBox(height: 10),
              Text("District: ${donorDetails['district']}"),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _launchDialer(donorDetails['phoneno']);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Contact',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showConfirmationDialog(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Confirm',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future _launchDialer(String phoneNumber) async {
    print('$phoneNumber');
    print('launch fxn called');
    Uri phoneno = Uri.parse('tel:+977$phoneNumber');
    if (await launchUrl(phoneno)) {
      print('dialeropened');
    } else {
      print('dialernotopened');

      //dailer is not opened
    }
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation', style: TextStyle(color: Colors.red[800])),
          content: Text(
            'Are you sure you want to confirm? Please make sure you have contacted the donor before confirming.',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add your logic here to handle confirmation
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Confirm', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        );
      },
    );
  }
}
