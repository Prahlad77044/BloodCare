import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:bdc/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DonorListScreen extends StatefulWidget {
  const DonorListScreen({Key? key}) : super(key: key);

  @override
  State<DonorListScreen> createState() => _DonorListScreenState();
}

class _DonorListScreenState extends State<DonorListScreen> {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future getDonors() async {
    String url = "http://192.168.1.2:4444/bloodcare/donors/";
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
                title: Text('Donor\'s List',
                style:TextStyle(
                  color:Colors.white,
                )),
                backgroundColor: Colors.red[800],
              ),
              body: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.h, vertical: 23.v),
                  decoration: AppDecoration.fillOnPrimary,
                  child: Column(children: [
                    Text("Select from the list of donors to request",
                        style: CustomTextStyles.labelLargePrimary),
                    SizedBox(height: 15.v),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 1.h),
                                              child: Text(
                                                "${data[index]['name']}",
                                                style: CustomTextStyles
                                                    .titleSmallPink900,
                                              ),
                                            ),
                                            SizedBox(height: 1.v),
                                            Container(
                                              width: 110.h,
                                              margin:
                                                  EdgeInsets.only(left: 1.h),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 8.v),
                                                    child: Text(
                                                      "${data[index]['gender']}",
                                                      style: CustomTextStyles
                                                          .bodySmall10,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 21.v,
                                                    width: 45.h,
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          child: Text(
                                                            "${data[index]['bloodgrp']}",
                                                            style:
                                                                CustomTextStyles
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
                                              padding:
                                                  EdgeInsets.only(left: 1.h),
                                              child: Text(
                                                "Address",
                                              ),
                                            ),
                                            Text(
                                              "${data[index]['city']},${data[index]['district']}",
                                              style:
                                                  CustomTextStyles.bodySmall8,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Contact",
                                              ),
                                              Text(
                                                "${data[index]['phoneno']}",
                                                style: CustomTextStyles
                                                    .bodySmall10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        CustomElevatedButton(
                                          height: 34.v,
                                          width: 98.h,
                                          text: "Request",
                                          margin: EdgeInsets.only(
                                            left: 12.h,
                                            top: 8.v,
                                            bottom: 19.v,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                })))
                  ])));
        });
  }

  /// Section Widget

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
