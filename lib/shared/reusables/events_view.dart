
import 'package:flutter/material.dart';

Future<void> openDialog(BuildContext context){
  return showDialog<void>(
      context: context,
      builder: (BuildContext context){
        return Dialog(
          shape: RoundedRectangleBorder(),
          elevation: 10,
          insetPadding: EdgeInsets.all(8),
          insetAnimationCurve: Curves.decelerate,
          insetAnimationDuration: Duration(microseconds: 800),
          child: Container(
            decoration: BoxDecoration(),
            width: MediaQuery.of(context).size.width*0.9,
            height: MediaQuery.of(context).size.height*0.8,
            child: SingleChildScrollView(
              child: Column(
                children: [

                ],
              ),
            ),
          ),
        );
      }
  );
}