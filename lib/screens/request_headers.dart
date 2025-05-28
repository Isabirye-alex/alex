import 'package:flutter/material.dart';

import '../drawerscreens/doc.dart';

class RequestHeaders extends StatelessWidget {
  const RequestHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(

          title: Row(
              children: [
                Text('at', style: TextStyle(fontSize: 50, color: Colors.white)),
                Container(
                  width: 35,
                  decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))),
                  child: Center(child: Text('Devs', style: TextStyle(fontSize: 10, color: Colors.orange, fontFamily: 'Roboto'),)),
                ),
              ]
          ),

          actions: [
            Container(
              margin: EdgeInsets.all(10),
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                // color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text('Sign In', style: TextStyle(color: Colors.white, fontSize: 20),)),
            ),
          ],
          backgroundColor: Colors.orange[600],
          leading: Builder(
            builder: (context) {
              return IconButton(onPressed: (){Scaffold.of(context).openDrawer();},
                icon: Icon(Icons.menu, color: Colors.white,),
              );
            }
            ,),
        ),
        drawer: DocDrawer(),
        body:Container(
      margin: EdgeInsets.all(12),
      child: Stack(
        children:[
          SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text('Request Headers', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              SizedBox(height: 20),
              Text('These are the standard request headers that are needed when authenticating with the API.'),
              SizedBox(height: 10),
              Text('When using username and API Key', style: TextStyle(fontSize: 30),),
              SizedBox(height: 20),
              Text('Parameter', style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              RichText(text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w300),
                children: [
                  TextSpan(text: 'apiKey', style: TextStyle(fontWeight: FontWeight.bold)),
                  WidgetSpan(child: Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Text('string', style: TextStyle(color: Colors.orange),),
                  )),
                  TextSpan(text: '\nAfrica\'s Talking application apiKey'),


                ]
              )),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              RichText(text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w300),
                children: [
                  TextSpan(text: 'Content-Type ', style: TextStyle(fontWeight:FontWeight.bold)),
                  WidgetSpan(child: Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child: Text(' string', style: TextStyle(color: Colors.orange),),
                  )),
                  TextSpan(text: '\nThe requests content type, '),
                  WidgetSpan(child: Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child: Text(' an application/x-www-form-urlencoded', style: TextStyle(color: Colors.orange),),
                  )),
                ]
              )),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              RichText(text: TextSpan(style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w300),
              children: [
                TextSpan(text: 'Accept', style: TextStyle(fontWeight: FontWeight.bold)),
                WidgetSpan(child: Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: Text(' string ', style: TextStyle(color: Colors.orange),),
                )),
                WidgetSpan(child: Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: Text(' optional ', style: TextStyle(color: Colors.orange),),
                )),
                TextSpan(text: '\nThe requests response type. Can be\n'),
                WidgetSpan(child: Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: Text(' application/json ', style: TextStyle(color: Colors.orange),),
                )),
                TextSpan(text: ' or '),
                WidgetSpan(child: Container(
                  // height: 15,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: Text(' application/xml ', style: TextStyle(color: Colors.orange),),
                )),
              ]
              ),),
              Text('When using an Auth Token', style: TextStyle(fontSize: 30),),
              SizedBox(height: 10),
              SizedBox(height: 20),
              Text('Parameter', style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              RichText(text: TextSpan(style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                children: [
                  TextSpan(text: 'authToken ', style: TextStyle(fontWeight: FontWeight.bold)),
                  WidgetSpan(child: Container(
                    margin: EdgeInsets.all(2),
                    padding: EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                        borderRadius: BorderRadius.circular(4)),
                    child: Text('String',style: TextStyle(color: Colors.orange),),
                  )),
                  WidgetSpan(child: Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                        borderRadius: BorderRadius.circular(4)),
                    child: Text('Optional',style: TextStyle(color: Colors.orange),),
                  )),
                  TextSpan(text: '\nGenerated Auth Token')
                ]
              ),),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              RichText(text: TextSpan(style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
              children: [
                TextSpan(text: 'Content-Type ',style: TextStyle(fontWeight: FontWeight.bold)),
                WidgetSpan(child: Container(
                  margin: EdgeInsets.all(2),
                  padding: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  borderRadius: BorderRadius.circular(4)
                ),
                child: Text('String', style: TextStyle(color: Colors.orange),),
                )),
                TextSpan(text: '\nThe requests content type. Can be '),
                WidgetSpan(child: Container(
                  margin: EdgeInsets.all(2),
                  padding: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: Text('application/x-www-form-urlencoded', style: TextStyle(color: Colors.orange),),
                )),
                TextSpan(text: ' or '),
                WidgetSpan(child: Container(
                  margin: EdgeInsets.all(2),
                  padding: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: Text('application/xml', style: TextStyle(color: Colors.orange),),
                )),

              ]
              ),
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              RichText(text: TextSpan(style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(text: 'Accept ',style: TextStyle(fontWeight: FontWeight.bold)),
                    WidgetSpan(child: Container(
                      margin: EdgeInsets.all(2),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Text('String', style: TextStyle(color: Colors.orange),),
                    )),
                    WidgetSpan(child: Container(
                      margin: EdgeInsets.all(2),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Text('Optional', style: TextStyle(color: Colors.orange),),
                    )),
                    TextSpan(text: '\nThe requests content type. Can be\n '),
                    WidgetSpan(child: Container(
                      margin: EdgeInsets.all(2),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Text('application/x-www-form-urlencoded', style: TextStyle(color: Colors.orange),),
                    )),
                    TextSpan(text: ' or '),
                    WidgetSpan(child: Container(
                      margin: EdgeInsets.all(2),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Text('application/xml', style: TextStyle(color: Colors.orange),),
                    )),

                  ]
              ),
              ),
            ],
          ),
        ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.green,
              ),
              child: Icon(Icons.question_answer, size: 30),
            ),
          ),

      ]
      ),
        )
    );
  }
}
