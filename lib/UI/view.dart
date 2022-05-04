import 'package:flutter/material.dart';

class FeatureView extends StatefulWidget {
  String titleName;
  String description;

    FeatureView({Key? key,required this.description,required this.titleName}) : super(key: key);

  @override
  State<FeatureView> createState() => _FeatureViewState();
}

class _FeatureViewState extends State<FeatureView> {

  double custFontSize = 20;

  void bigFont() async{
    setState(() {
      custFontSize+=2;
    });
  }

  void smallFont() async{
    setState(() {
      custFontSize-=2;
    });
  }


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleName),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Container(
          padding:const EdgeInsets.only(left: 16,right: 16),
            height: h,
            width: w,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
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
            child: Text(widget.description,
              textScaleFactor: 0.85,
              style:   TextStyle(
                color: Colors.black,
                fontSize: custFontSize,
                fontWeight: FontWeight.w700),)),
      ),
      floatingActionButton: Container(
        height: 50,
        width: 122,
       decoration: BoxDecoration(
         borderRadius:BorderRadius.circular(6),
         color: Colors.white,
       ),
        margin:const EdgeInsets.all(8),
        padding:const EdgeInsets.only(left: 8,right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            GestureDetector(
              onTap: (){
                bigFont();
              },
              child: Container(

                decoration:const BoxDecoration(
                    color: Colors.black,
                  shape: BoxShape.circle
                ),
                child: const Center(
                  child: Center(
                    child: Icon(Icons.add,size: 30,color: Colors.white,),
                  ),
                ),

              ),
            ),

             const Center(
               child: Center(
                 child: Icon(Icons.search,size: 30,color: Colors.grey,),
               ),
             ),

            GestureDetector(
              onTap: (){
                smallFont();
              },
              child: Container(

                decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle
                ),
                child: const Center(
                  child: Center(
                    child: Icon(Icons.remove,size: 30,color: Colors.white,),
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
