import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ListView(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [const SizedBox(
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
        SizedBox(height: 30,),
        Stack(
        fit: StackFit.loose,
        alignment: Alignment.topCenter,
        children:[

        Column(
          children: [
            const SizedBox(height: 160,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: height * 0.7,
                child:Column(children: [
                      Container(

                        margin: const EdgeInsets.all(5),
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
                              height: 30,
                            ),
                            Text(
                              'Ala Eddine Achach',
                              style: GoogleFonts.alegreya(
                                color: const Color.fromRGBO(39, 105, 171, 1),
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
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                    const SizedBox(
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

                    ])
                  ,
                ),
              ),
          ],
        ),
          Center(
            child: SizedBox(
              width: 200, // Set your desired width here
              height: 200, // Set your desired height here
              child: ClipOval(
                child: Image.asset(
                  'assests/images/profile.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
    ],),],
    );
  }
}
