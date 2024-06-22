import 'package:flutter/material.dart';
import 'package:login/compomenets/my_list_tile.dart';
import 'package:login/pages/camera.dart';
import 'package:login/pages/profile_page.dart';

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
                MaterialPageRoute(builder: (context) => MyProfilePage()));                
          },
        ),

        MyListTile(
          icon: Icons.person,
          text: 'Camera',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Mycamera()));                
          },
        ),
        
        
      ]),
    );
  }
}
