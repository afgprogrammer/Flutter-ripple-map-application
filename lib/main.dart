import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  )  
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover
              )
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.3),
                  ]
                )
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          makeItem(image: 'assets/images/place.jpg'),
                          makeItem(image: 'assets/images/place3.jpg'),
                          makeItem(image: 'assets/images/place2.jpg'),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,)
                  ],
                ),
              )
            ),
          ),
          makePoint(top: 140.0, left: 40.0),
          makePoint(top: 190.0, left: 190.0),
          makePoint(top: 219.0, left: 60.0),
        ],
      )
    );
  }

  Widget makePoint({top, left}) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.withOpacity(0.3)
        ),
        child: Animator<double>(
          duration: Duration(seconds: 1),
          tween: Tween<double>(begin: 4.0, end: 6.0),
          cycles: 0,
          builder: (anim) => Center(
            child: Container(
              margin: EdgeInsets.all(anim.value),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue
              ),
            ),
          ),
        )
      ),
    );
  }

  Widget makeItem({image}) {
    return AspectRatio(
      aspectRatio: 1.7 / 2,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200]
                  ),
                  child: Text('2.1 mi', style: TextStyle(color: Colors.grey[500]),)
                )
              ],
            ),
            SizedBox(height: 30,),
            Text('Golde Gate Bridge', style: TextStyle(color: Colors.grey[800], fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),            
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.star_border, color: Colors.yellow[700], size: 30,),
            )
          ],
        ),
      ),
    );
  }
}
