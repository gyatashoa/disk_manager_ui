import 'package:disk_manage_ui/ui/screens/homePage.dart';
import 'package:flutter/material.dart';

import 'package:disk_manage_ui/config/colors.dart';

class JunkCaches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size DEVSIZE = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          elevation: 0,
          backgroundColor: MAIN_BLUE_BACKGROUND,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.replay,
                  color: Colors.black,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                ),
                onPressed: () {})
          ],
        ),
        body: Container(
          color: MAIN_BLUE_BACKGROUND,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                top: DEVSIZE.height / 7.5,
                child: Container(
                  width: DEVSIZE.width,
                  // height: DEVSIZE.height / 1.5,
                  decoration: BoxDecoration(
                      color: WHITE_COLOR,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(50))),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      CustomExpansionTile(
                          title: "Backgroud app",
                          subtitle: "692MB",
                          notification: 12),
                      CustomExpansionTile(
                          title: "App junk files",
                          subtitle: "217MB",
                          notification: 11),
                      CustomExpansionTile(
                          title: "App caches",
                          subtitle: "435MB",
                          notification: 20),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              width: double.infinity,
                              child: Center(
                                  child: Text(
                                "Cleanup will not affect normal use",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                              height: 80,
                              decoration: BoxDecoration(
                                  color: ASH_COLOR,
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Cleanup(),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      )),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: (DEVSIZE.height / 7.5) - 60,
                child: Container(
                  height: 60,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(20)),
                      color: Colors.black),
                  child: Center(
                    child: Text(
                      "Junk Caches",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 40,
                top: (DEVSIZE.height / 7.5) - 40,
                child: Container(
                  height: 60,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: DEEP_BLUE),
                  child: Center(
                    child: Text(
                      "1.31 GB",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Cleanup extends StatelessWidget {
  const Cleanup({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 40,
        width: 160,
        decoration: BoxDecoration(
            color: LIGHT_BLUE, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.delete, color: DEEP_BLUE),
            SizedBox(
              width: 8,
            ),
            Text("Cleanup 1.31GB", style: TextStyle(color: DEEP_BLUE)),
          ],
        ),
      ),
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  final int notification;
  final String title;
  final String subtitle;
  CustomExpansionTile({this.notification, this.title, this.subtitle});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.expand_more,
        color: Colors.black,
      ),
      title: Row(
        children: <Widget>[
          Text("${title}"),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 20,
            width: 35,
            decoration: BoxDecoration(
              color: LIGHT_BLUE,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Center(
                child: Text(
              "${notification.toString()}",
              style: TextStyle(color: DEEP_BLUE, fontSize: 12),
            )),
          )
        ],
      ),
      subtitle: Text(subtitle),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: BoxIndicator(
          innerColor: Colors.white,
          outerColor: DEEP_BLUE,
        ),
      ),
    );
  }
}
