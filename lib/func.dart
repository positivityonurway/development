import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:device_apps/device_apps.dart';
import 'package:cached_network_image/cached_network_image.dart';

_launchURL(String packageName) async {
  
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<bool> isAppInstalled(String packageName) async {
  bool isInstalled = await DeviceApps.isAppInstalled(packageName);
  if (isInstalled) {
    DeviceApps.openApp(packageName);
    return true;
  } else {
    _launchURL(packageName);
    return false;
  }
}

Widget footer1() {
  return BottomAppBar(
    child: Text(
      "Shimano",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 20),
    ),
    color: Colors.white.withOpacity(0.5),
  );

Widget appbar1(String title) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(fontSize: 27),
    ),
    iconTheme: IconThemeData(color: Color(0xffd11b5d)),
    backgroundColor: Colors.black,
  );
}

Widget appCard({
  String appName,
  String appDisc,
  String packName,
  String imageurl,
}) {
  return Card(


    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(

        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: CachedNetworkImage(
            imageUrl: imageurl,
          ),
        ),
        title: Text(
          appName,
          style: TextStyle(fontSize: 18),
        ),
        subtitle: Text(appDisc),

        trailing: Icon(
          Icons.favorite,
          color: Colors.red,

//        onTap: _launchURL1('www.google.com'),
        ),
        onTap: () => isAppInstalled(packName),
      ),
    ),
  );
}
