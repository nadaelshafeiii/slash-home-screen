import 'package:flutter/material.dart';
import 'package:flutter_application_2/compomenets/my_list_tile.dart';
import 'package:flutter_application_2/landingpage.dart';


class MyDrawer extends StatelessWidget {
  final void Function()? onsignout;

  const MyDrawer({super.key, required this.onsignout});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: Column(children: [
        //header
        DrawerHeader(
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: 64,
          ),
        ),

        //home list tile
        MyListTile(
          icon: Icons.home,
          text: 'H O M E',
          onTap: () => Navigator.pop(context),
        ),

        MyListTile(
          icon: Icons.logout,
          text: 'L O G O U T',
          onTap: onsignout,
        ),
        MyListTile(
          icon: Icons.person,
          text: 'profile',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => landingpage()));                
          },
        ),

        MyListTile(
          icon: Icons.person,
          text: 'Camera',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => landingpage()));                
          },
        ),
        
        
      ]),
    );
  }
}
