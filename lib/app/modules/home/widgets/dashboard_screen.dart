import 'package:flutter/material.dart';
import 'package:globalpaq_app/app/modules/home/widgets/header.dart';
import 'package:globalpaq_app/app/modules/home/widgets/my_fiels.dart';
import 'package:globalpaq_app/app/modules/home/widgets/recent_files.dart';
import 'package:globalpaq_app/app/modules/home/widgets/storage_details.dart';
import 'package:globalpaq_app/app/modules/home/widgets/user_details.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';
import 'package:globalpaq_app/app/utils/responsive.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      UserDetails(),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      MyFiels(),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      if (Responsive.isMobile(context))
                        SizedBox(
                          height: defaultPadding,
                        ),
                      if (Responsive.isMobile(context)) StorageDetails()
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(
                    width: defaultPadding,
                  ),
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: StorageDetails(),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
