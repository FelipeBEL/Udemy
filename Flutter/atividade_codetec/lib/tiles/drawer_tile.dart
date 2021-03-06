import 'package:atividadecodetec/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerTile extends StatelessWidget {
  DrawerTile(this.icon, this.text, this.controller, this.page);

  final IconData icon;
  final String text;
  final PageController controller;
  final int page;
  SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          if(page == 3){
            prefs = await SharedPreferences.getInstance();
            prefs.clear();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext ctx) => LoginScreen()));
          } else {
            Navigator.of(context).pop();
            controller.jumpToPage(page);
          }
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 32.0,
                color: controller.page.round() == page
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
              SizedBox(
                width: 32.0,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 16.0,
                    color: controller.page.round() == page
                        ? Theme.of(context).primaryColor
                        : Colors.black, fontWeight: controller.page.round() == page ? FontWeight.bold : null),
              )
            ],
          ),
        ),
      ),
    );
  }
}