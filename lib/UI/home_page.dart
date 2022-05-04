import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namefeature/UI/view.dart';

import '../main.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<void> getData() async {
    await dbHelper.databaseGet();
     setState(() {});
  }
  ValueNotifier<bool> isNotification = ValueNotifier(false);

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        title: const Text("नाम से जाने भविष्य"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset('assets/images/img123.jpg',height: h,width: w,fit: BoxFit.cover,
          ),
          ListView.builder(
              itemCount: dbHelper.category.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FeatureView(titleName: '${dbHelper.category[i]['title']}', description: '${dbHelper.category[i]['description']}',)));

                  },
                  child: Column(
                    children: [

                      Container(
                        height:200,
                        width: w*0.5,
                        margin: EdgeInsets.all(10.0),
                        decoration:   BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                            gradient:const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: [
                                0.1,
                                0.4,
                                0.6,
                                0.9,
                              ],
                              colors: [
                                Color(0xff7df8fa),
                                Color(0xffb9cafa),
                                Color(0xffe6b6fb),
                                Color(0xfff2b0fb),
                              ],
                            )
                        ),
                        child: SizedBox(


                            child: Column(

mainAxisAlignment: MainAxisAlignment.center,
                              children: [


                                Image.asset('assets/images/image 1.png',

                                height: 100,
                                  width: 100,
                                ),


                                Text(
                                  "${dbHelper.category[i]['title']}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            )),
                      ),

                    ],
                  ),
                );
              }),
        ],
      ),

    drawer: Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset('assets/images/image 1.png'),
          ),
          const SizedBox(
            height: 15.0,
          ),


          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Stack(
                children: [
                  Container(
                    height: h * 0.1,
                    width: w,
                    decoration:   BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                        gradient:const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [
                            0.1,
                            0.4,
                            0.6,
                            0.9,
                          ],
                          colors: [
                            Color(0xff7df8fa),
                            Color(0xffb9cafa),
                            Color(0xffe6b6fb),
                            Color(0xfff2b0fb),
                          ],
                        )
                    ),


                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const Icon(
                              CupertinoIcons.bell,
                              color: Colors.black,
                            )),
                        const SizedBox(
                          width: 17,
                        ),
                        Text(
                          "अधिसूचना",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        ValueListenableBuilder(
                            valueListenable: isNotification,
                            builder: (context, v, c) {
                              return CupertinoSwitch(
                                trackColor: Colors.white,
                                activeColor: Colors.green,
                                value: isNotification.value,
                                onChanged: (v) {
                                  isNotification.value = v;
                                  // NotificationService();
                                },
                              );
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),


          const SizedBox(
            height: 10.0,
          ),

          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Stack(
                children: [
                  Container(
                    height: h * 0.1,
                    width: w,
                    decoration:   BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                        gradient:const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [
                            0.1,
                            0.4,
                            0.6,
                            0.9,
                          ],
                          colors: [
                            Color(0xff7df8fa),
                            Color(0xffb9cafa),
                            Color(0xffe6b6fb),
                            Color(0xfff2b0fb),
                          ],
                        )
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Icon(
                          CupertinoIcons.square_favorites,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          "पूछे जाने वाले प्रश्न",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),



          const SizedBox(
            height: 10.0,
          ),
          //Privacy  Policy
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Stack(
                children: [
                  Container(
                    height: h * 0.1,
                    width: w,
                    decoration:   BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                        gradient:const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [
                            0.1,
                            0.4,
                            0.6,
                            0.9,
                          ],
                          colors: [
                            Color(0xff7df8fa),
                            Color(0xffb9cafa),
                            Color(0xffe6b6fb),
                            Color(0xfff2b0fb),
                          ],
                        )
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Icon(
                          CupertinoIcons.doc,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          "गोपनीयता नीति",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 10.0,
          ),


          GestureDetector(
            onTap: () {
              Navigator.pop(context);

            },
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Stack(
                children: [
                  Container(
                    height: h * 0.1,
                    width: w,
                    decoration:   BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                        gradient:const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [
                            0.1,
                            0.4,
                            0.6,
                            0.9,
                          ],
                          colors: [
                            Color(0xff7df8fa),
                            Color(0xffb9cafa),
                            Color(0xffe6b6fb),
                            Color(0xfff2b0fb),
                          ],
                        )
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Icon(
                          Icons.info_outline,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          "ऐप के बारे में",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 10.0,
          ),
          //Share
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Stack(
                children: [
                  Container(
                    height: h * 0.1,
                    width: w,
                    decoration:   BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                        gradient:const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [
                            0.1,
                            0.4,
                            0.6,
                            0.9,
                          ],
                          colors: [
                            Color(0xff7df8fa),
                            Color(0xffb9cafa),
                            Color(0xffe6b6fb),
                            Color(0xfff2b0fb),
                          ],
                        )
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Icon(
                          CupertinoIcons.share,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          "साझा करना",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 10.0,
          ),

        ],
      ),
    )

    );
  }
}
