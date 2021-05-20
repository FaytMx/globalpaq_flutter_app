import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalpaq_app/app/modules/misguias/mis_guias_controller.dart';
import 'package:globalpaq_app/app/modules/misguias/widgets/header.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';
import 'package:globalpaq_app/app/utils/responsive.dart';

class MisGuiasScreen extends StatelessWidget {
  final List<String> paqueterias = Get.find<MisGuiasController>().paqueterias;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Header(),
          SizedBox(
            height: defaultPadding,
          ),
          Text("Mis Guias"),
          GetBuilder<MisGuiasController>(builder: (_) {
            if (_.disponibles.length == 0) {
              return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: paqueterias.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
                    crossAxisCount: 1,
                    crossAxisSpacing: defaultPadding,
                    mainAxisSpacing: defaultPadding,
                    childAspectRatio: 5),
                itemBuilder: (context, index) => Container(
                  width: Get.width / 2.2,
                  child: ElevatedButton(
                    onPressed: () {
                      _.getDisp(paqueterias[index]);
                    },
                    child: Text(paqueterias[index]),
                  ),
                ),
              );
            }
            return SizedBox(
              height: Get.height,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _.disponibles.length,
                itemBuilder: (context, index) => ListTile(
                  leading: IconButton(icon: Icon(Icons.add), onPressed: () {}),
                  title: Text(
                      "${_.disponibles[index].descripcion} ${_.disponibles[index].peso} Kilos"),
                  subtitle: Text("${_.disponibles[index].disponibles}"),
                ),
              ),
            );
          }),
          Divider(),
        ],
      ),
    );
  }
}
