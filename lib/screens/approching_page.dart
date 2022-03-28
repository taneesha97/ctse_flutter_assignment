import 'package:flutter/material.dart';

class ApprochingPage extends StatefulWidget {
  @override
  _ApprochingPageState createState() => _ApprochingPageState();
}

class _ApprochingPageState extends State<ApprochingPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(450),
        child: AppBar(
          flexibleSpace: Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 5),
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
                  height: 15,
                ),
                    Container(

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Welcome Movie Quiz",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "Relaway",
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Text(
                            "Welcome Movie Quize",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Relaway",
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          //onChanged: {},
                          decoration: const InputDecoration(
                            // icon: Icon(
                            //   icon,
                            //   color: kPrimaryColor,
                            // ),
                            hintText: 'Enter Username',
                            //hintText: hintText,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          //onChanged: {},
                          decoration: const InputDecoration(
                            hintText: 'Enter Email',
                            //hintText: hintText,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          //onChanged: {},
                          decoration: const InputDecoration(
                            hintText: 'Enter Password',
                            //hintText: hintText,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 500,
            ),
            Container(
              //padding: EdgeInsets.symmetric(horizontal: 80),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(60.0)),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue, // background
                  onPrimary: Colors.white,
                  padding: const EdgeInsets.all(20.0),
                  fixedSize: const Size(150, 70),

                  // foreground
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => FeedBackForm()),
                  // );
                },
                child: const Text(
                  'Start',
                  style:
                  TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
