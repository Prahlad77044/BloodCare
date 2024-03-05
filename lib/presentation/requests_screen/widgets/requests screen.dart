import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:bdc/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestsWidget extends StatefulWidget {
  const RequestsWidget({Key? key}) : super(key: key);

  @override
  State<RequestsWidget> createState() => _RequestsWidgetState();
}

class _RequestsWidgetState extends State<RequestsWidget> {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future getRequest() async {
    String url = "http://192.168.1.4:4444/bloodcare/requests/";
    String? accessToken = await secureStorage.read(key: 'access_token');
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
    getRequest();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getRequest(),
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
            appBar: AppBar(
              title: Text(
                'Requests',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red[800],
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Please fill up this form if you're donating for first time.",
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/donor_detail_screen');
                    },
                    child: Text(
                      'Click Here.',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.red),
                    )),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 7.v);
                      },
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 19.h,
                            vertical: 7.v,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 7.v,
                                      bottom: 1.v,
                                    ),
                                    child: Text(
                                      "Contact Person",
                                      style: CustomTextStyles.bodySmallGray500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15.h),
                                    child: Text(
                                      "${data[index]['contact_person']}",
                                      style: theme.textTheme.titleMedium,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 13.v),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 1.v,
                                      bottom: 2.v,
                                    ),
                                    child: Text(
                                      "Location",
                                      style: CustomTextStyles.bodySmallGray500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text(
                                      "${data[index]['hospital']}",
                                      style:
                                          CustomTextStyles.bodySmallGray800_1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.v),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 1.v,
                                      bottom: 2.v,
                                    ),
                                    child: Text(
                                      "Phone No.",
                                      style: CustomTextStyles.bodySmallGray500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 7.h),
                                    child: Text(
                                      "${data[index]['phoneno']}",
                                      style:
                                          CustomTextStyles.bodySmallGray800_1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.v),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 2.v,
                                      bottom: 1.v,
                                    ),
                                    child: Text(
                                      "Date ",
                                      style: CustomTextStyles.bodySmallGray500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 22.h),
                                    child: Text(
                                      "${data[index]['req_date']}",
                                      style:
                                          CustomTextStyles.bodySmallGray800_1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.v),
                              Padding(
                                padding: EdgeInsets.only(right: 2.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: CustomElevatedButton(
                                        height: 38.v,
                                        text: "View",
                                        margin: EdgeInsets.only(right: 19.h),
                                        onPressed: () {
                                          _showUserDetailsBottomSheet(
                                              context, data[index]);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }

  void _showUserDetailsBottomSheet(
      BuildContext context, Map<String, dynamic> userDetails) {
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
                userDetails['contact_person'] ?? 'User Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text("Blood Group: ${userDetails['bloodgroup']}"),
              SizedBox(height: 10),
              Text("Patient Name: ${userDetails['pat_name']}"),
              SizedBox(height: 10),
              Text("Contact Person: ${userDetails['contact_person']}"),
              SizedBox(height: 10),
              Text("Hospital: ${userDetails['hospital']}"),
              SizedBox(height: 10),
              Text("Phone No.: ${userDetails['phoneno']}"),
              SizedBox(height: 10),
              Text("Required Date: ${userDetails['req_date']}"),
              SizedBox(height: 10),
              Text("Required Pint: ${userDetails['reqpint']}"),
              SizedBox(height: 10),
              Text("District: ${userDetails['district']}"),
              SizedBox(height: 10),
              Text("Case Details: ${userDetails['case_details']}"),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _launchDialer(userDetails['phoneno']);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Contact',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your logic here
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
}
