
import 'package:flutter/material.dart';

import '../drawerscreens/doc.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

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
      body: Stack(
        children: [
          SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(18),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Authentication', style: TextStyle(fontSize: 40, color:Colors.black, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('Requests made to our APIs must be authenticated, there are two ways to do this:', style: TextStyle(),),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1. Authenticating using your API key and username', style: TextStyle(fontWeight: FontWeight.w100),),
                        SizedBox(height: 10),
                        Text('2. Authenticating using a token', style: TextStyle(fontWeight: FontWeight.w100),),
                        SizedBox(height: 10),
                      ],
                    ),
                    Text('Authenticating using your API key and username', style: TextStyle(fontSize: 22, color:Colors.black, fontWeight: FontWeight.bold)),
                    Text('Your username', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16)),
                     RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 14, color: Colors.black), // Use default text style for the base
                        children: [
                          TextSpan(text: "When working with the "),
                          TextSpan(
                            text: "sandbox",
                            style: TextStyle(color: Colors.orange),
                          ),
                          TextSpan(text: "(our development environment), the username is always "),
                          WidgetSpan(
                            child: Container(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.orange.withAlpha(70),
                                border: Border.all(color: Colors.orange),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: const Text(
                                "sandbox",
                                style: TextStyle(color: Colors.orange),
                              ),
                            ),
                          ),
                          const TextSpan(text: "."),
                        ],
                      ),
                    ),
                     SizedBox(height: 20),
                     RichText(text:
                     TextSpan(
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      children: [
                        TextSpan(text: 'When in the live environment, this is the specific username of the application making the request. Here is an article from the help center on '),
                        TextSpan(
                            style: TextStyle(color: Colors.orange),
                            text: 'how to make a production application')
                     ]
                    )
                    ),
                     SizedBox(height: 20),
                     Text('You API Key', style: TextStyle(fontSize: 20)),
                     RichText(text:TextSpan(
                       style: TextStyle(fontSize: 14, color: Colors.black),
                       children: [
                         TextSpan(
                           text: 'You can generate an API key from the the dashboard, here is an article from the help center on '
                         ),
                         TextSpan(
                           style: TextStyle(color: Colors.orange),
                           text: 'how to generate an API key.'
                         ),

                       ]
                     )),
                     SizedBox(height: 20),
                     Text('When a new API key is generated, you can no longer use the old one. After you generate your API key, we strongly advise that you copy it and keep it somewhere safe. It will not be displayed again because Africa\'s Talking does not log or save your API key for security reasons. If you lose it, you\'ll have to generate a new one'),
                     SizedBox(height: 20),
                     Text('Making an API call', style: TextStyle(fontSize: 22, color:Colors.black, fontWeight: FontWeight.bold)),
                     SizedBox(height: 20),
                     RichText(
                         text: TextSpan(
                           style: TextStyle(color: Colors.black, fontSize: 14),
                       children: [
                         TextSpan(
                           text: 'You need to include the API key in the request header as a field called '
                         ),
                         TextSpan(
                           style: TextStyle(color: Colors.orange),
                           text: 'apiKey'
                         ),
                         TextSpan(
                           text: '. The place where the '
                         ),
                         TextSpan(
                           style: TextStyle(color: Colors.orange),
                           text: 'username'
                         ),
                         TextSpan(
                           text: 'should be included depends on the type of request'
                         ),


                       ]
                     )),
                     SizedBox(height: 20),
                     RichText(
                        text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 14),
                          children: [
                            TextSpan(text: 'For'),
                            TextSpan(
                              style: TextStyle(color: Colors.orange),
                              text: ' GET'
                            ),
                            TextSpan(
                              text: 'requests e.g. '
                            ),
                            TextSpan(
                              style: TextStyle(color: Colors.orange),
                              text: 'fetch messages'
                            ),
                            TextSpan(text: ', the '),
                            TextSpan(style: TextStyle(color: Colors.orange), text: 'username'),
                            TextSpan(text: ' should be passed as a query parameter')
                          ]
                    )),
                    SizedBox(height: 20),
                    RichText(text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: [
                        TextSpan(text: 'For '),
                        WidgetSpan(child: Container(
                          decoration: BoxDecoration(
                              color: Colors.amber,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text('GET ', style: TextStyle(color: Colors.orange),),
                        ),
                        ),
                        TextSpan(text: 'requests e.g. '),
                        TextSpan(text: 'fetch requests, ', style: TextStyle(color: Colors.orange)),
                        TextSpan(text: 'the '),
                        WidgetSpan(child: Container(
                          decoration: BoxDecoration(color: Colors.amber,
                          borderRadius: BorderRadius.circular(6)
                          ),
                          child: Text('username', style: TextStyle(color: Colors.orange)),
                        ),
                        ),
                        TextSpan(text: ' should be included as one of the parameters within the form.')
                      ]
                    )),
                    SizedBox(height: 20),
                    RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          children: [
                            TextSpan(text: 'For '),
                            WidgetSpan(child: Container(
                              decoration: BoxDecoration(color: Colors.amber,
                              borderRadius: BorderRadius.circular(6)
                              ),
                              child: Text('POST', style: TextStyle(color: Colors.orange)),
                            )),
                            TextSpan(text: ' requests in which parameters are sent as a url encoded form e.g. in '),
                            WidgetSpan(child: Container(
                              decoration: BoxDecoration(color: Colors.amber,
                              borderRadius: BorderRadius.circular(6)
                              ),
                              child: Text('sending SMS, ', style: TextStyle(color: Colors.orange)),
                            )),
                            TextSpan(text: ' the '),
                            WidgetSpan(child: Container(
                              decoration: BoxDecoration(color: Colors.amber,
                                  borderRadius: BorderRadius.circular(6)
                              ),
                              child: Text('username ', style: TextStyle(color: Colors.orange)),
                            )),
                            TextSpan(text: ' should be included as one of the parameters within the form.')

                          ]

                    ),

                    ),
                    SizedBox(height: 20),
                    RichText(text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: [
                        TextSpan(text: 'For '),
                        WidgetSpan(child: Container(
                          decoration: BoxDecoration(color: Colors.amber,
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: Text('POST ', style: TextStyle(color: Colors.orange)),
                        )
                        ),
                        TextSpan(text: ' requests that require JSON in the request body e.g. in '),
                        WidgetSpan(child: Container(
                          decoration: BoxDecoration(color: Colors.amber,
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: Text('mobile checkout', style: TextStyle(color: Colors.orange)),
                        )),
                        TextSpan(text: ', the '),
                        WidgetSpan(child: Container(
                          // padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(color: Colors.amber,
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: Text('username  ', style: TextStyle(color: Colors.orange)),
                        )),
                        TextSpan(text: 'should be included in the JSON sent in the body of the request.')
                      ]
                    )),


                  ],
                )
              ],
            ),
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
    );
  }
}
