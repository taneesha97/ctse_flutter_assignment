import 'package:ctse_assignment_1/components/profile/background.dart';
import 'package:ctse_assignment_1/models/user.dart';
import 'package:ctse_assignment_1/screens/leader_board.dart';
import 'package:ctse_assignment_1/screens/quice_configuration_screen.dart';
import 'package:ctse_assignment_1/screens/quize_list.dart';
import 'package:ctse_assignment_1/screens/user_history.dart';
import 'package:ctse_assignment_1/util/User/UserCRUDModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../util/userAuth/userauthentication.dart';
import 'movie_library_list.dart';

class ProfileUI extends StatefulWidget {
  const ProfileUI({Key? key}) : super(key: key);

  @override
  _ProfileUIState createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {

  String uid = '';
  List<Users> docs = [];
  String correctCount = '';
  String wrongCount = '';

  @override
  void initState() {
    super.initState();
    Stream<User?> val = Provider.of<UserAuthentication>(context, listen: false).authStateChanges;

    val.listen((event) {
     // print(event?.uid);
      setState(() {
        uid = event!.uid.toString();
        Provider.of<UserCRUDModel>(context, listen: false)
            .getLoginUser(event!.uid.toString())
            .then((value) => {
          //print(value),
          setState(() {
            docs = value;
          }),

        });
        Provider.of<UserCRUDModel>(context, listen: false)
            .getCorrectAnswers(event!.uid.toString())
            .then((value) => {
          //print(value),
          setState(() {
            correctCount = value.toString();
            // print('correctCount');
            // print(correctCount);
          }),

        });

        Provider.of<UserCRUDModel>(context, listen: false)
            .getWrongAnswers(event!.uid.toString())
            .then((value) => {
          print(value),
          setState(() {
            wrongCount = value.toString();
            // print('wrongCount');
            // print(wrongCount);
          }),

        });
        // Provider.of<UserCRUDModel>(context, listen: false)
        //     .getWrongAnswers1(event!.uid.toString());
      });
    });


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Background(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: 80,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 30,
            ),
            Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/profile-user.png",
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(docs[0].userName.toString(), style: TextStyle(fontSize: 16, color: Colors.white),),
                Text(docs[0].email.toString(), style: TextStyle(fontSize: 16, color: Colors.white),),
                Text(docs[0].age.toString(), style: TextStyle(fontSize: 16, color: Colors.white),),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Game Statistics',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    width: size.width,
                    //height: 180,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: const Text(
                                "High Score",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "98",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.yellow),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: const Text(
                                "Quizes",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "98",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.yellow),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: const Text(
                                "Correct",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              correctCount,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.yellow),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: const Text(
                                "Wrong",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              wrongCount,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.yellow),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 40,
                    runSpacing: 10,

                    children: [

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // background
                          onPrimary: Colors.white,
                          padding: const EdgeInsets.all(10.0),
                          //fixedSize: const Size(640, 70),
                          // foreground
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => ProfileUI()),
                          // );
                        },
                        child: const Text(
                          'Clear',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // background
                          onPrimary: Colors.white,
                          padding: const EdgeInsets.all(10.0),
                          //fixedSize: const Size(640, 70),
                          // foreground
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LeaderBoard()),
                          );
                        },
                        child: const Text(
                          'Leaderboard',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // background
                          onPrimary: Colors.white,
                          padding: const EdgeInsets.all(10.0),
                          //fixedSize: const Size(640, 70),
                          // foreground
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserHistory(id: uid,)),
                          );
                        },
                        child: const Text(
                          'UserHistory',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // background
                          onPrimary: Colors.white,
                          padding: const EdgeInsets.all(10.0),
                          //fixedSize: const Size(640, 70),
                          // foreground
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DropDown()),
                          );
                        },
                        child: const Text(
                          'Quiz configuration',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // background
                          onPrimary: Colors.white,
                          padding: const EdgeInsets.all(10.0),
                          //fixedSize: const Size(640, 70),
                          // foreground
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserHistory(id: uid,)),
                          );
                        },
                        child: const Text(
                          'User History',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Colors.red, // background
                  //           onPrimary: Colors.white,
                  //           padding: const EdgeInsets.all(10.0),
                  //           //fixedSize: const Size(640, 70),
                  //           // foreground
                  //         ),
                  //         onPressed: () {
                  //           // Navigator.push(
                  //           //   context,
                  //           //   MaterialPageRoute(builder: (context) => ProfileUI()),
                  //           // );
                  //         },
                  //         child: const Text(
                  //           'Clear',
                  //           style: TextStyle(
                  //               fontSize: 12, fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //       ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Colors.red, // background
                  //           onPrimary: Colors.white,
                  //           padding: const EdgeInsets.all(10.0),
                  //           //fixedSize: const Size(640, 70),
                  //           // foreground
                  //         ),
                  //         onPressed: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => LeaderBoard()),
                  //           );
                  //         },
                  //         child: const Text(
                  //           'Leaderboard',
                  //           style: TextStyle(
                  //               fontSize: 12, fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //       ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Colors.red, // background
                  //           onPrimary: Colors.white,
                  //           padding: const EdgeInsets.all(10.0),
                  //           //fixedSize: const Size(640, 70),
                  //           // foreground
                  //         ),
                  //         onPressed: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => UserHistory()),
                  //           );
                  //         },
                  //         child: const Text(
                  //           'UserHistory',
                  //           style: TextStyle(
                  //               fontSize: 12, fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //       ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Colors.red, // background
                  //           onPrimary: Colors.white,
                  //           padding: const EdgeInsets.all(10.0),
                  //           //fixedSize: const Size(640, 70),
                  //           // foreground
                  //         ),
                  //         onPressed: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => DropDown()),
                  //           );
                  //         },
                  //         child: const Text(
                  //           'Quiz configuration',
                  //           style: TextStyle(
                  //               fontSize: 12, fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              // Row(
              //   children: [
              //     Column(
              //       children: [
              //         Text(
              //           'Profile Image',
              //           style: TextStyle(fontWeight: FontWeight.bold),
              //         ),
              //         Container(
              //           margin: EdgeInsets.all(10.0),
              //           padding: EdgeInsets.all(10.0),
              //           width: size.width * 0.35,
              //           height: 180,
              //           decoration: const BoxDecoration(
              //             color: Colors.lightBlue,
              //             borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //           ),
              //           child: Column(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Container(
              //                   decoration: const BoxDecoration(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(10.0)),
              //                   ),
              //                   child: ElevatedButton(
              //                     style: ElevatedButton.styleFrom(
              //                       primary: Color.fromARGB(
              //                           255, 8, 47, 114), // background
              //                       onPrimary: Colors.white,
              //                       padding: const EdgeInsets.all(10.0),
              //                       //fixedSize: const Size(640, 70),
              //                       // foreground
              //                     ),
              //                     onPressed: () {
              //                       // Navigator.push(
              //                       //   context,
              //                       //   MaterialPageRoute(builder: (context) => ProfileUI()),
              //                       // );
              //                     },
              //                     child: const Text(
              //                       'Edit Account',
              //                       style: TextStyle(
              //                           fontSize: 12,
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                   ),
              //                 ),
              //                 Container(
              //                   decoration: const BoxDecoration(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(10.0)),
              //                   ),
              //                   child: ElevatedButton(
              //                     style: ElevatedButton.styleFrom(
              //                       primary: Color.fromARGB(
              //                           255, 8, 47, 114), // background
              //                       onPrimary: Colors.white,
              //                       padding: const EdgeInsets.all(10.0),
              //                       //fixedSize: const Size(640, 70),
              //                       // foreground
              //                     ),
              //                     onPressed: () {
              //                       Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                             builder: (context) => LibraryList()),
              //                       );
              //                     },
              //                     child: const Text(
              //                       'My Library',
              //                       style: TextStyle(
              //                           fontSize: 12,
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                   ),
              //                 ),
              //                 Container(
              //                   decoration: const BoxDecoration(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(10.0)),
              //                   ),
              //                   child: ElevatedButton(
              //                     style: ElevatedButton.styleFrom(
              //                       primary: Colors.red, // background
              //                       onPrimary: Colors.white,
              //                       padding: const EdgeInsets.all(10.0),
              //                       //fixedSize: const Size(640, 70),
              //                       // foreground
              //                     ),
              //                     onPressed: () {
              //                       Provider.of<UserAuthentication>(context,
              //                               listen: false)
              //                           .signoutUser();
              //                       // Navigator.push(
              //                       //   context,
              //                       //   MaterialPageRoute(builder: (context) => ProfileUI()),
              //                       // );
              //                     },
              //                     child: const Text(
              //                       'Delete Account',
              //                       style: TextStyle(
              //                           fontSize: 12,
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                   ),
              //                 ),
              //               ]),
              //         ),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         Text(
              //           'Profile Details',
              //           style: TextStyle(fontWeight: FontWeight.bold),
              //         ),
              //         Container(
              //           margin: EdgeInsets.all(10.0),
              //           width: size.width * 0.5,
              //           height: 180,
              //           decoration: const BoxDecoration(
              //             color: Colors.green,
              //             borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //           ),
              //           child: const Text('is working'),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ]),
    ));
  }
}
