import 'package:africa/drawerscreens/doc.dart';
import 'package:flutter/material.dart';
class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange[600],
              ),
              child: Row(
                children: [
                  Text('at', style: TextStyle(fontSize: 100, color: Colors.white)),
                  Container(
                    width: 2,
                    height: 100,
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Africa\'s', style: TextStyle(fontSize: 50, color: Colors.white),),
                      Text('Talking', style: TextStyle(fontSize: 50, color: Colors.white),)
                    ],
                  )
                ],
              )),
          ListTile(
            leading: Icon(Icons.compare_arrows_sharp, color: Colors.orange[600]),
            title: Text('Change Number'),
            onTap: (){
              Navigator.pop(context);
            },

          ),
          ListTile(
            leading: Icon(Icons.bookmarks_outlined, color: Colors.orange[600]),
            title: Text('Documentation'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Doc()));
            },

          ),
          Divider(),
          Container(margin: EdgeInsets.all(12),
            child: Text('Talk to us'),
          ),
          ListTile(
            leading: Icon(Icons.live_help),
            title: Container(padding: EdgeInsets.only(left: 20),
              child: Text('Help & Feedback'),
            ),
          )

        ],
      ),
    );
  }
}