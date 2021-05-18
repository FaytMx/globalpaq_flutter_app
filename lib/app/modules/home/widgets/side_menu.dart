import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              press: () {},
            ),
            DrawerListTile(
              title: "Mis Guías",
              svgSrc: "assets/icons/label.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Movimientos",
              svgSrc: "assets/icons/acceleration.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Pedidos",
              svgSrc: "assets/icons/cart.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Mis Envios",
              svgSrc: "assets/icons/delivery.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Recolecciones",
              svgSrc: "assets/icons/package.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Tienda",
              svgSrc: "assets/icons/shopping-cart.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Cobertura",
              svgSrc: "assets/icons/telegram.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Cotizador seguro",
              svgSrc: "assets/icons/health-care.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Aclaraciones y reclamos",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Cerrar Sesion",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {},
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
