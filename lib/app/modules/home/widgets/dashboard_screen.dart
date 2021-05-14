import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globalpaq_app/app/modules/home/models/RecentFile.dart';
import 'package:globalpaq_app/app/modules/home/widgets/header.dart';
import 'package:globalpaq_app/app/modules/home/widgets/my_fiels.dart';
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
                      Container(
                        padding: EdgeInsets.all(defaultPadding),
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Recent Files",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: DataTable(
                                columns: [
                                  DataColumn(label: Text("File Name")),
                                  DataColumn(label: Text("Date")),
                                  DataColumn(label: Text("Size")),
                                ],
                                rows: [
                                  DataRow(
                                    cells: [
                                      DataCell(
                                        Row(
                                          children: [
                                            SvgPicture.asset(demoRecentFiles[0].icon, height: 30, width: 30,),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                                              child: Text(demoRecentFiles[0].title),
                                            ),
                                          ],
                                        ),
                                      ),
                                      DataCell(Text("Text")),
                                      DataCell(Text("Text")),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
