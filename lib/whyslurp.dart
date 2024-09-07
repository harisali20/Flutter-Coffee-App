import 'package:flutter/material.dart';

class WhySlurp extends StatelessWidget {
  const WhySlurp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  )),
              title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text('Why SLURP',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins-SemiBold",
                            fontSize: 19.16,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 2,
                    ),
                    Text('SLURP is the first and only coffee membership ',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins-Regular",
                          fontSize: 10,
                        )),
                  ]),
              backgroundColor: const Color(0xff1ABB9C),
            ),
            body: Expanded(
                child: Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xffF1F2E9),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, bottom: 10.0, right: 30.0, left: 30.0),
                    child: Image.asset(
                      'assets\\images\\cups.png',
                      height: 170,
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(right: 35.0, left: 35.0),
                      child: Text(
                        "Coffee is a cherished beverage enjoyed by millions worldwide, and its importance goes beyond just being a morning ritual. It serves as a vital source of energy, providing a much-needed boost to start the day.\n\n"
                        "The caffeine in coffee stimulates the central nervous system, enhancing alertness, concentration, and overall cognitive function. ",
                        style: TextStyle(
                            fontFamily: "Poppins-Regular",
                            color: Color(0xff000000),
                            fontSize: 20.58),
                      ))
                ],
              ),
            ))));
  }
}
