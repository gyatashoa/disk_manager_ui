import 'package:disk_manage_ui/config/colors.dart';
import 'package:disk_manage_ui/ui/screens/customwidgets/moreSymbol.dart';
import 'package:disk_manage_ui/ui/screens/junkCachesScreen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
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
              onPressed: () {}),
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
              Positioned(
                top: 0,
                child: Container(
                  width: DEVSIZE.width,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        child: Container(
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: DEEP_BLUE,
                                    offset: Offset(-14, 14),
                                    blurRadius: 0,
                                    spreadRadius: 4),
                                // BoxShadow(
                                //     color: Color.fromRGBO(38, 191, 239, 1),
                                //     offset: Offset(-14, 14),
                                //     blurRadius: 0,
                                //     spreadRadius: 6),
                              ],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40)),
                              color: WHITE_COLOR),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "1.31GB",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                ),
                              ),
                              Text(
                                "Cleanup suggested",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomProgress(size: DEVSIZE),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              RoundedIndicator(
                                outerColor: Colors.black,
                                innerColor: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text("Used 22GB")
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              RoundedIndicator(
                                outerColor: DEEP_BLUE,
                                innerColor: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text("Deletable 31GB")
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                top: DEVSIZE.height / 2.5,
                child: Container(
                  width: DEVSIZE.width,
                  // height: DEVSIZE.height / 1.5,
                  decoration: BoxDecoration(
                      color: WHITE_COLOR,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(50))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => JunkCaches()));
                          },
                          child: CustomTile(
                            isActive: true,
                            title: "Junk Caches",
                            subtitle: "1.31GB",
                            icon: Icons.brush,
                          ),
                        ),
                        CustomTile(
                          title: "App Data",
                          subtitle: "Total: 45.6MB",
                          icon: Icons.apps,
                        ),
                        CustomTile(
                          title: "Audio & video",
                          subtitle: "Total: 12.6GB",
                          icon: Icons.play_circle_outline,
                        ),
                        CustomTile(
                          title: "App Uninstall",
                          subtitle: "1.31GB",
                          icon: Icons.apps,
                        ),
                        Cleanup(),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: (DEVSIZE.height / 2.5) - 40,
                child: Container(
                  height: 40,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(20)),
                      color: Colors.black),
                  child: Center(
                    child: Text(
                      "Can be deleted",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 40,
                top: (DEVSIZE.height / 2.5) - 40,
                child: Container(
                  height: 60,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: DEEP_BLUE),
                  child: Center(
                    child: Text(
                      "31.11GB",
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

class CustomTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String subtitle;
  final bool isActive;
  const CustomTile({
    Key key,
    this.title,
    this.icon,
    this.subtitle,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Padding(
        padding: EdgeInsets.only(right: 15.0),
        child: isActive
            ? BoxIndicator(
                innerColor: Colors.white,
                outerColor: DEEP_BLUE,
              )
            : OutlineBoxIndicator(
                outerColor: ASH_COLOR,
                innerColor: Colors.black,
              ),
      ),
      leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: ASH_COLOR),
          child: Icon(
            icon,
            color: Colors.black,
          )),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}

class CustomProgress extends StatelessWidget {
  final Size size;
  CustomProgress({this.size});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            height: 25,
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            height: 25,
            width: size.width / 1.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: DEEP_BLUE),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            height: 25,
            width: size.width / 3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.black),
          ),
        )
      ],
    );
  }
}

class RoundedIndicator extends StatelessWidget {
  final Color outerColor;
  final Color innerColor;
  RoundedIndicator({this.outerColor, this.innerColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(shape: BoxShape.circle, color: outerColor),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(shape: BoxShape.circle, color: innerColor),
        ),
      ),
    );
  }
}

class BoxIndicator extends StatelessWidget {
  final Color outerColor;
  final Color innerColor;
  BoxIndicator({this.outerColor, this.innerColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: outerColor),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(shape: BoxShape.circle, color: innerColor),
        ),
      ),
    );
  }
}

class OutlineBoxIndicator extends StatelessWidget {
  final Color outerColor;
  final Color innerColor;
  OutlineBoxIndicator({this.outerColor, this.innerColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: outerColor, width: 3)),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(shape: BoxShape.circle, color: innerColor),
        ),
      ),
    );
  }
}
