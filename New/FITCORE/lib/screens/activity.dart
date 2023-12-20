import 'package:flutter/material.dart';
import 'package:sign_in/animations/FadeAnimation.dart';

class Activity extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  double sliderHeight = 170.0;
  //late double sliderHeight;

  List<String> categories = ["Breakfast", "Lunch", "Dinner", "Snacks"];
  List<dynamic> Activities = [
    {
      "image": "assets/images/Run.jpeg",
      "isFavorite": false,
      "title": "Running",
      "calorie": 1,
      "note": "1 Plate = 70 gm",
      "Breakfast": true
    },
    {
      "image": "assets/images/plank4.jpg",
      "isFavorite": false,
      "title": "Plank",
      "calorie": 1.3,
      "note": "1 Egg = 55 gm"
    },
    {
      "image": "assets/images/Push Up.jpg",
      "isFavorite": false,
      "title": "Pushup",
      "calorie": 3.5,
      "note": "1 Plate = 150 gm",
      "Breakfast": true
    },
    {
      "image": "assets/images/bike3.jpg",
      "isFavorite": false,
      "title": "Cycling",
      "calorie": 0.5,
      "note": "1 Appel = 250 gm"
    },
  ];

  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        //brightness: Brightness.light,
        leading: Icon(null),
        actions: <Widget>[
          FadeAnimation(
              1,
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_basket,
                  color: Colors.grey[800],
                ),
              ))
        ],
      ),

      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        'Activities',
                        style: TextStyle(
                            color: Colors.grey[80],
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   height: 50,
                  //   child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: categories.length,
                  //       itemBuilder: (context1, index) => FadeAnimation(
                  //           1,
                  //           makeCategory(
                  //               title: categories[index], index: index))),
                  // child: ListView(
                  //   scrollDirection: Axis.horizontal,
                  //   children: <Widget>[
                  //     FadeAnimation(1, makeCategory(title: 'Pizaa')),
                  //     FadeAnimation(1.3, makeCategory(title: 'Burgers')),
                  //     FadeAnimation(1.4, makeCategory(title: 'Kebab')),
                  //     FadeAnimation(1.5, makeCategory(title: 'Desert')),
                  //     FadeAnimation(1.6, makeCategory(title: 'Salad')),
                  //   ],
                  // ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            // FadeAnimation(
            //     1,
            //     Padding(
            //       padding: EdgeInsets.all(20),
            //       child: Text(
            //         'Free Calories',
            //         style: TextStyle(
            //             color: Colors.grey[700],
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold),
            //       ),
            //     )),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: Activities.length,
                  itemBuilder: (context, index) => FadeAnimation(
                    1,
                    makeItem(
                      list: Activities,
                      image: Activities[index]["image"],
                      isFavorite: Activities[index]["isFavorite"],
                      title: Activities[index]["title"],
                      calorie: Activities[index]["calorie"],
                      note: Activities[index]["note"],
                      index: index,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget makeCategory({title, index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = index;
        });
      },
      child: AnimatedContainer(
        width: 120,
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color:
              selectedCategory == index ? Colors.yellow[700] : Colors.grey[300],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color:
                    selectedCategory == index ? Colors.black : Colors.grey[700],
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget makeItem({list, image, isFavorite, title, calorie, note, index}) {
    //double sliderHeight = 150.0;
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(begin: Alignment.bottomCenter, stops: [
                  .2,
                  .9
                ], colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ])),

            //////////////////////////////////////////////////////////////////////
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            list[index]["isFavorite"] =
                                !list[index]["isFavorite"];
                          });
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    width: 1.5,
                                    color: isFavorite
                                        ? Colors.red
                                        : Colors.transparent,
                                  )),
                              child: isFavorite
                                  ? Icon(
                                      Icons.add_circle,
                                      color: Colors.red,
                                    )
                                  : Icon(
                                      Icons.add_circle,
                                      color: Colors.white,
                                    )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Close'),
                                        )
                                      ],
                                      title: const Text('Note'),
                                      contentPadding: const EdgeInsets.all(20),
                                      content: Text(note),
                                    ));
                          });
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    width: 1.5,
                                    color: Colors.transparent,
                                  )),
                              child: Icon(
                                Icons.error_outline,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "$title",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      // double cal=calorie*sliderHeight;
                      // Text(
                      //   ((calorie * sliderHeight).toInt()).toString() + " Cal",
                      //   style: TextStyle(color: Colors.white, fontSize: 20),
                      // ),

                      //  sliderHeight = 150.0;

                      Text(
                        "Time : ${sliderHeight.toInt()} min",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),

                      Slider(
                          value: sliderHeight,
                          min: 3,
                          max: 240,
                          // activeColor: setColor(),
                          divisions: 200,
                          onChanged: (double d) {
                            setState(() {
                              sliderHeight = d;
                            });
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget sliderInTermsOfPlatform() {

  //   return new Slider(
  //       value: 100,
  //       min: 100,
  //       max: 220.0,
  //       // activeColor: setColor(),
  //       divisions: 25,
  //       onChanged: (double d) {
  //         setState(() {
  //           sliderHeight = d;
  //         });
  //       });
  // }
}
