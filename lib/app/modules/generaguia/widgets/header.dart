import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/controllers/menu_controller.dart';
import 'package:globalpaq_app/app/utils/responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: Get.find<MenuController>().controlMenu),
        if (!Responsive.isMobile(context))
          Text(
            "Dashboard",
            style: Theme.of(context).textTheme.headline6,
          ),
      ],
    );
  }
}
