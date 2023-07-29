import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ListView(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 20,
        ),
        Text("My profile",
            textAlign: TextAlign.center,
            style: GoogleFonts.yesevaOne(
              color: (Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black),
              fontSize: 36,
            )),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: height * 0.6,
            child: LayoutBuilder(
              builder: (context, constraints) {
                double innerHeight = constraints.maxHeight;
                double innerWidth = constraints.maxWidth;
                return Stack(fit: StackFit.expand, children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: innerHeight * 0.65,
                      width: innerWidth,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.teal[50]
                            : Colors.white),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Ala Eddine Achach',
                            style: GoogleFonts.alegreya(
                              color: Color.fromRGBO(39, 105, 171, 1),
                              fontSize: 37,
                            ),
                          ),
                          Text(
                            'Medenine,Tunisia',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: 'Nunito',
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            'achachaladin@gmail.com',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: 'Nunito',
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Age',
                                    style: GoogleFonts.alegreyaSans(
                                      color: Colors.grey[800],
                                      fontSize: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    '21',
                                    style: TextStyle(
                                      color: Color.fromRGBO(39, 105, 171, 1),
                                      fontFamily: 'Nunito',
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 8,
                                ),
                                child: Container(
                                  height: 50,
                                  width: 3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Profession',
                                    style: GoogleFonts.alegreyaSans(
                                      color: Colors.grey[800],
                                      fontSize: 25,
                                    ),
                                  ),
                                  const Text(
                                    'Software Engineering',
                                    style: TextStyle(
                                      color: Color.fromRGBO(39, 105, 171, 1),
                                      fontFamily: 'Nunito',
                                      fontSize: 21,
                                    ),
                                  ),
                                  const Text(
                                    'INSAT',
                                    style: TextStyle(
                                      color: Color.fromRGBO(39, 105, 171, 1),
                                      fontFamily: 'Nunito',
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SizedBox(
                        width: innerWidth * 0.65,
                        child: ClipOval(
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              // Adjust the padding as needed
                              child: Image.asset(
                                'images/profile.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]);
              },
            ),
          ),
        )
      ],
    );
  }
}
