import 'package:bdc/core/app_export.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: 375,
        height: 812,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 85,
              child: Container(
                width: 375,
                height: 750,
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
              left: 135,
              top: 43,
              child: Text(
                'History',
                style: TextStyle(
                  color: Color(0xFFC62C2C),
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 75,
              top: 101,
              child: Text(
                'Abraham ',
                style: TextStyle(
                  color: Color(0xFF484848),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 136,
              child: Text(
                'Location',
                style: TextStyle(
                  color: Color(0xFF979494),
                  fontSize: 9,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 108,
              child: Text(
                'Name',
                style: TextStyle(
                  color: Color(0xFF979494),
                  fontSize: 9,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 75,
              top: 133,
              child: Text(
                'General Hospital, Barracks',
                style: TextStyle(
                  color: Color(0xFF484848),
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 163,
              child: Text(
                'Address',
                style: TextStyle(
                  color: Color(0xFF979494),
                  fontSize: 9,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 76,
              top: 160,
              child: Text(
                '1, Abiola Way, Akure',
                style: TextStyle(
                  color: Color(0xFF484848),
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 189,
              child: Text(
                'Date ',
                style: TextStyle(
                  color: Color(0xFF979494),
                  fontSize: 9,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 76,
              top: 187,
              child: Text(
                '9/5/23',
                style: TextStyle(
                  color: Color(0xFF484848),
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 64,
              top: 222,
              child: Container(
                width: 247,
                height: 38,
                decoration: ShapeDecoration(
                  color: Color(0xA0C8F9C4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Positioned(
              left: 158,
              top: 235,
              child: Text(
                'Accepted',
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: -27,
              top: 274,
              child: Container(
                width: 424,
                height: 192,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFC4C4C4)),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 75,
              top: 290,
              child: Text(
                'Bipin Ghimire',
                style: TextStyle(
                  color: Color(0xFF484848),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 325,
              child: Text(
                'Location',
                style: TextStyle(
                  color: Color(0xFF979494),
                  fontSize: 9,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 297,
              child: Text(
                'Name',
                style: TextStyle(
                  color: Color(0xFF979494),
                  fontSize: 9,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 75,
              top: 322,
              child: Text(
                'General Hospital, Barracks',
                style: TextStyle(
                  color: Color(0xFF484848),
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 352,
              child: Text(
                'Address',
                style: TextStyle(
                  color: Color(0xFF979494),
                  fontSize: 9,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 64,
              top: 411,
              child: Container(
                width: 247,
                height: 38,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 247,
                        height: 38,
                        decoration: ShapeDecoration(
                          color: Color(0xA0C8F9C4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 94,
                      top: 13,
                      child: Text(
                        'Accepted',
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 76,
              top: 349,
              child: Text(
                '1, Abiola Way, Akure',
                style: TextStyle(
                  color: Color(0xFF484848),
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 378,
              child: Text(
                'Date ',
                style: TextStyle(
                  color: Color(0xFF979494),
                  fontSize: 9,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 76,
              top: 376,
              child: Text(
                '3/3/23',
                style: TextStyle(
                  color: Color(0xFF484848),
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 75,
              top: 479,
              child: Text(
                'Prahlad Neupane ',
                style: TextStyle(
                  color: Color(0xFF484848),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 514,
              child: Text(
                'Location',
                style: TextStyle(
                  color: Color(0xFF979494),
                  fontSize: 9,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 486,
              child: Text(
                'Name',
                style: TextStyle(
                  color: Color(0xFF979494),
                  fontSize: 9,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 75,
              top: 511,
              child: Text(
                'General Hospital, Barracks',
                style: TextStyle(
                  color: Color(0xFF484848),
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 541,
              child: Text(
                'Address',
                style: TextStyle(
                  color: Color(0xFF979494),
                  fontSize: 9,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 76,
              top: 538,
              child: Text(
                '1, Abiola Way, Akure',
                style: TextStyle(
                  color: Color(0xFF484848),
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 567,
              child: Text(
                'Date ',
                style: TextStyle(
                  color: Color(0xFF979494),
                  fontSize: 9,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 76,
              top: 565,
              child: Text(
                '3/6/23',
                style: TextStyle(
                  color: Color(0xFF484848),
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 64,
              top: 597,
              child: Container(
                width: 247,
                height: 38,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 247,
                        height: 38,
                        decoration: ShapeDecoration(
                          color: Color(0x93F5C0C0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 96,
                      top: 13,
                      child: Text(
                        'Rejected',
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          height: 0,
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
