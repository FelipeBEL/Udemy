import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {

  CategoryTile(this.snapshot);

  final DocumentSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage("images/" + snapshot.data["image"]),
      ),
      title: Text(snapshot.data["title"]),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoryScreen(snapshot)));
      },
    );
  }
}