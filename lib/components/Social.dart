import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Social extends StatelessWidget {
  final String url;

  Social({@required this.url});

  @override
  Widget build(BuildContext context) {
    Widget icon = getIcon(this.url);

    if (icon == null) {
      return Container();
    }

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: GestureDetector(
            onTap: () async => {
                  if (await canLaunch(this.url)) {await launch(this.url)}
                },
            child: icon));
  }

  Widget getIcon(String url) {
    if (url.contains('facebook')) {
      return Icon(
        CommunityMaterialIcons.facebook,
        color: const Color(0xff3B5998),
        size: 50,
      );
    } else if (url.contains('instagram')) {
      return Icon(
        CommunityMaterialIcons.instagram,
        color: const Color(0xff517FA4),
        size: 50,
      );
    } else if (url.contains('twitter')) {
      return Icon(
        CommunityMaterialIcons.twitter,
        color: const Color(0xff00ACED),
        size: 50,
      );
    } else if (url.contains('youtube')) {
      return Icon(
        CommunityMaterialIcons.youtube,
        color: const Color(0xffBB0000),
        size: 50,
      );
    }

    return null;
  }
}
