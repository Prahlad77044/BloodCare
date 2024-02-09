import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomerSupport extends StatelessWidget {
  CustomerSupport({super.key});
  final TextEditingController mycontroller = TextEditingController();
  final TextEditingController yurcontroller = TextEditingController();
  final TextEditingController ourcontroller = TextEditingController();
  final TextEditingController thiscontroller = TextEditingController();
  final TextEditingController thatcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,

          appBar: AppBar(
            title: Text('Feedback'),
            backgroundColor: Colors.red[800],
          ),



          body: SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Good Feedback is the key to improvement.',
                  style: TextStyle(
                    color: Colors.red[200],
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: mycontroller,
                      decoration: InputDecoration(
                        hintText: 'Your Name..',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                      ),

                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: yurcontroller,
                      decoration: InputDecoration(
                        hintText: 'Message..',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: ourcontroller,
                      decoration: InputDecoration(
                        hintText: 'Email Id..',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                      ),

                    ),
                  ),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: thiscontroller,
                      decoration: InputDecoration(
                        hintText: 'Phone No.',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    
                  },
                  child: Padding(
                    padding:  EdgeInsets.all(30.0),
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text('Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red[800],
                        borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60,),
                SingleChildScrollView(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.red[800]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('About us',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Contact us',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),),
                            ),

                            Text('9860316993',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                              ),),
                            SizedBox(height: 2,),
                            Text('9803509940',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                              ),),

                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text('Social Media',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon:Icon(FontAwesomeIcons.facebook),
                                  iconSize: 35,
                                  onPressed: (){},
                                  color: Colors.blue[300],
                                ),
                                IconButton(
                                  icon:Icon(FontAwesomeIcons.instagram),
                                  iconSize: 35,
                                  onPressed: (){},
                                  color: Colors.pink[200],
                                ),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                )


              ],),
          )
      );

  }
}
