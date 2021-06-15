import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/home/home_controller.dart';
import 'package:globalpaq_app/app/modules/home/widgets/user_info_card.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: GetBuilder<HomeController>(
        builder: (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "User Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: defaultPadding,
            ),
            UserInfoCard(
              title: "Saldo",
              svgSrc: "assets/icons/presupuesto.svg",
              info: "\$${_.asociado.saldo} MX",
            ),
            UserInfoCard(
              title: "Saldo Prepago",
              svgSrc: "assets/icons/prepaid.svg",
              info: "\$${_.asociado.saldoPrepago} MX",
            ),
            UserInfoCard(
              title: "Credito",
              svgSrc: "assets/icons/prepaid.svg",
              info: "\$${_.asociado.credito} MX",
            ),
          ],
        ),
      ),
    );
  }
}


