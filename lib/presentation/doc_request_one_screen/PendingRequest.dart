import 'package:flutter/material.dart';

class PendingRequest extends StatefulWidget {
  PendingRequest({Key? key});

  @override
  State<PendingRequest> createState() => _PendingRequestState();
}

class _PendingRequestState extends State<PendingRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 375,
        height: 656,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Color(0xFFC4C4C4)),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 375,
                height: 659,
                decoration: BoxDecoration(color: Color(0xFFC62C2C)),
              ),
            ),
            Positioned(
              left: 0,
              top: 85,
              child: Container(
                width: 375,
                height: 571,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 117,
              top: 27,
              child: Text(
                'Current Status',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 19,
              top: 117,
              child: Container(
                width: 336,
                height: 130,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 336,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 94,
                      top: 82,
                      child: SizedBox(
                        width: 136,
                        height: 19,
                        child: Text(
                          'Nepal National Hospital',
                          style: TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 10,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 5,
                      top: 82,
                      child: SizedBox(
                        width: 62,
                        height: 19,
                        child: Text(
                          'Kathmandu',
                          style: TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 10,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 247,
                      top: 82,
                      child: SizedBox(
                        width: 59,
                        height: 19.26,
                        child: Text(
                          '2080-11-01',
                          style: TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 10,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 247,
                      top: 68,
                      child: SizedBox(
                        width: 53,
                        height: 14,
                        child: Text(
                          'Required Date',
                          style: TextStyle(
                            color: Color(0xFF6C6B6B),
                            fontSize: 7,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 117,
                      top: 23,
                      child: SizedBox(
                        width: 99,
                        height: 14,
                        child: Text(
                          'Shyam Tamang',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 127,
                      top: 12,
                      child: SizedBox(
                        width: 66,
                        height: 11,
                        child: Text(
                          'Contact Person',
                          style: TextStyle(
                            color: Color(0xFF6C6B6B),
                            fontSize: 7,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 103,
                      top: 69,
                      child: SizedBox(
                        width: 32,
                        height: 14,
                        child: Text(
                          'Hospital',
                          style: TextStyle(
                            color: Color(0xFF6C6B6B),
                            fontSize: 7,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 18,
                      top: 69,
                      child: SizedBox(
                        width: 32,
                        height: 14,
                        child: Text(
                          'District',
                          style: TextStyle(
                            color: Color(0xFF6C6B6B),
                            fontSize: 7,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 9,
                      top: 106,
                      child: SizedBox(
                        width: 49,
                        height: 14,
                        child: Text(
                          'Case Details:',
                          style: TextStyle(
                            color: Color(0xFF6C6B6B),
                            fontSize: 7,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
