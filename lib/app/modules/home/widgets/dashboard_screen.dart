import 'package:flutter/material.dart';
import 'package:globalpaq_app/app/modules/home/widgets/header.dart';
import 'package:globalpaq_app/app/modules/home/widgets/my_fiels.dart';
import 'package:globalpaq_app/app/modules/home/widgets/recent_files.dart';
import 'package:globalpaq_app/app/modules/home/widgets/storage_details.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';

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
                      MyFiels(),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      RecentFiles(),
                    ],
                  ),
                ),
                SizedBox(
                  width: defaultPadding,
                ),
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
