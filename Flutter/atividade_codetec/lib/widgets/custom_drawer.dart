import 'package:atividadecodetec/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer(this.pageController, this.userInfo);

  final PageController pageController;
  final List userInfo;

  @override
  Widget build(BuildContext context) {

    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 152, 191, 255),
            Color.fromARGB(255, 145, 187, 255),
            Color.fromARGB(255, 127, 175, 254),

          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
    );



    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(32.0, 5.0, 16.0, 8.0),
                height: 260.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 35.0,
                      left: 45.0,
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage('images/codetec_logo.jpg'),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(80.0)),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Olá, " + userInfo[0]["nome"],
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 275.0),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              ListView(
                padding: EdgeInsets.only(left: 32.0, top: 300.0),
                children: <Widget>[
                  DrawerTile(Icons.home, "Início", pageController, 0),
                  DrawerTile(Icons.person, "Meus dados", pageController, 1),
                  DrawerTile(Icons.group, "Minha equipe", pageController, 2),
                  DrawerTile(Icons.exit_to_app, "Sair", pageController, 3),
                ],
          ),
        ],
      ),
    );
  }
}