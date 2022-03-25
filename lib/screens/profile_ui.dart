import 'package:ctse_assignment_1/components/profile/background.dart';
import 'package:flutter/material.dart';

class ProfileUI extends StatefulWidget {
  @override
  _ProfileUIState createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Background(
      child: SingleChildScrollView(
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
                width: 100,
                height: 100,
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
                children: const [
                  Text('Taneesha Ayesh'),
                  Text('taneesha.ayeth@gmail.com'),
                  Text('Taneesha Ayesh'),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Profile Image',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    width: size.width * 0.35,
                    height: 180,
                    decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(
                                    255, 8, 47, 114), // background
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
                                'Edit Account',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(
                                    255, 8, 47, 114), // background
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
                                'My Library',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: ElevatedButton(
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
                                'Delete Account',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Profile Details',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    width: size.width * 0.5,
                    height: 180,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: const Text('is working'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
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
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: const Text(
                              "High Score",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("98",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.yellow),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: const Text(
                            "Quizes",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("98",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.yellow),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: const Text(
                            "Correct",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("98",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.yellow),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: const Text(
                            "Wrong",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("98",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.yellow),
                        )
                      ],
                    ),

                  ],
                ),
              ),
              const SizedBox(
                height: 20,
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
            ],
          ),
        ]),
      ),
    ));
  }
}
