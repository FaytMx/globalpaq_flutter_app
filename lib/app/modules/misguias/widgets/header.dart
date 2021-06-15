import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/misguias/mis_guias_controller.dart';
import 'package:globalpaq_app/app/utils/responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MisGuiasController>(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(icon: Icon(Icons.menu), onPressed: _.controlMenu),
          if (!Responsive.isMobile(context))
            Text(
              "Dashboard",
              style: Theme.of(context).textTheme.headline6,
            ),
          // if (!Responsive.isMobile(context))
          //   Spacer(
          //     flex: Responsive.isDesktop(context) ? 2 : 1,
          //   ),
            IconButton(icon: Icon(Icons.keyboard_arrow_left), onPressed: () {
              _.getDisp("");
            }),
        ],
      ),
    );
  }
}

