import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';

class UserInfoCard extends StatelessWidget {
  final String title, svgSrc, info;

  const UserInfoCard({
    Key key,
    @required this.title,
    @required this.svgSrc,
    @required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
        borderRadius: BorderRadius.all(Radius.circular(defaultPadding)),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 35,
            width: 35,
            child: SvgPicture.asset(svgSrc),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Text(info),
        ],
      ),
    );
  }
}
