import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/home/home_controller.dart';
import 'package:globalpaq_app/app/routes/app_routes.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                "assets/images/globalpaq_logo_cuadrito.png",
                height: 100,
                width: 100,
              ),
            ),
            DrawerListTile(
              title: "Dashbord",
              svgSrc: "assets/icons/menu_dashbord.svg",
              press: () {
                Get.toNamed(AppRoutes.HOME);
              },
            ),
            DrawerListTile(
              title: "Mis Guías",
              svgSrc: "assets/icons/label.svg",
              press: () {
                Get.toNamed(AppRoutes.MIS_GUIAS);
              },
            ),
            DrawerListTile(
              title: "Movimientos",
              svgSrc: "assets/icons/acceleration.svg",
              press: () {
                Get.toNamed(AppRoutes.MOVIMIENTOS);
              },
            ),
            DrawerListTile(
              title: "Pedidos",
              svgSrc: "assets/icons/cart.svg",
              press: () {
                Get.toNamed(AppRoutes.PEDIDOS);
              },
            ),
            DrawerListTile(
              title: "Ver Pedidos",
              svgSrc: "assets/icons/cart.svg",
              press: () {
                Get.toNamed(AppRoutes.VER_PEDIDOS);
              },
            ),
            DrawerListTile(
              title: "Mis Envios",
              svgSrc: "assets/icons/delivery.svg",
              press: () {
                Get.toNamed(AppRoutes.ENVIOS);
              },
            ),
            DrawerListTile(
              title: "Recolecciones",
              svgSrc: "assets/icons/package.svg",
              press: () {
                Get.toNamed(AppRoutes.RECOLECCIONES);
              },
            ),
            DrawerListTile(
              title: "Tienda",
              svgSrc: "assets/icons/shopping-cart.svg",
              press: () {
                Get.toNamed(AppRoutes.TIENDA);
              },
            ),
            DrawerListTile(
              title: "Cobertura",
              svgSrc: "assets/icons/telegram.svg",
              press: () {
                Get.toNamed(AppRoutes.COBERTURA);
              },
            ),
            DrawerListTile(
              title: "Cotizador seguro",
              svgSrc: "assets/icons/health-care.svg",
              press: () {
                Get.toNamed(AppRoutes.SEGURO);
              },
            ),
            DrawerListTile(
              title: "Aclaraciones y reclamos",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {
                Get.toNamed(AppRoutes.ACLARACIONES);
              },
            ),
            DrawerListTile(
              title: "Cerrar Sesion",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {
                Get.find<HomeController>().logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title, svgSrc;
  final VoidCallback press;

  const DrawerListTile({
    Key key,
    @required this.title,
    @required this.svgSrc,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
