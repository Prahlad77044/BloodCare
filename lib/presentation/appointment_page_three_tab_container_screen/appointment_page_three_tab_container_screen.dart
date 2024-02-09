import 'package:bdc/core/app_export.dart';
import 'package:bdc/presentation/appointment_page_five_page/appointment_page_five_page.dart';
import 'package:bdc/presentation/appointment_page_three_page/appointment_page_three_page.dart';
import 'package:flutter/material.dart';

class AppointmentPageThreeTabContainerScreen extends StatefulWidget {
  const AppointmentPageThreeTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppointmentPageThreeTabContainerScreenState createState() =>
      AppointmentPageThreeTabContainerScreenState();
}

class AppointmentPageThreeTabContainerScreenState
    extends State<AppointmentPageThreeTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Container(
            decoration: AppDecoration.fillOnPrimary.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL30,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 99.v),
                Container(
                  height: 17.v,
                  width: 297.h,
                  child: TabBar(
                    controller: tabviewController,
                    labelPadding: EdgeInsets.zero,
                    labelColor: theme.colorScheme.primary,
                    labelStyle: TextStyle(
                      fontSize: 12.fSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedLabelColor: appTheme.gray900,
                    unselectedLabelStyle: TextStyle(
                      fontSize: 12.fSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                    indicatorColor: theme.colorScheme.primary,
                    tabs: [
                      Tab(
                        child: Text(
                          "New",
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Upcoming",
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Previous",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 695.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      AppointmentPageThreePage(),
                      AppointmentPageFivePage(),
                      AppointmentPageThreePage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
