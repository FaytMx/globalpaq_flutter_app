import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/home/home_controller.dart';
import 'package:globalpaq_app/app/modules/home/widgets/dashboard_screen.dart';
import 'package:globalpaq_app/app/modules/home/widgets/side_menu.dart';
import 'package:globalpaq_app/app/utils/responsive.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  child: SideMenu(),
                ),
              Expanded(
                flex: 5,
                child: DashboardScreen(),
              ),
            ],
          ),
        ),
      );
    });
  }
}





//  if (_.asociado.idasociado == null) {
//         return Scaffold(
          
//           body: Center(
//             child: CircularProgressIndicator(),
//           ),
//         );
//       }
//       return Scaffold(
//         appBar: AppBar(
//             actions: [
//               IconButton(icon: Icon(Icons.exit_to_app), onPressed: _.logout)
//             ],
//           ),
//         body: Center(
//           child: Text("${_.asociado.idasociado}"),
//         ),
//       );
    