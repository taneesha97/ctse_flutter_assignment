import 'package:flutter/material.dart';
import 'package:reviews_slider/reviews_slider.dart';
import '../../styles.dart';

class SampleScreen extends StatefulWidget {
  SampleScreen({Key? key}) : super(key: key);

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  int? selectedValue1;
  int? selectedValue2;

  void onChange1(int value) {
    print(value);
    setState(() {
      selectedValue1 = value;
    });
  }

  void onChange2(int value) {
    setState(() {
      selectedValue2 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Movie Categories",
              style: TextStyle(
                fontFamily: "Raleway",
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 30,
              )),
            ),
            Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(196, 151, 151, 163),
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                        child: Text(
                          'What do you think of this app?',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 20, left: 20, top: 10),
                        child: ReviewSlider(
                            onChange: onChange1,
                            circleDiameter: 40,
                            optionStyle: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                            options: ['Worst', 'Worse', 'Bad', 'Good', 'Best']),
                      ),

                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Text(
                    'Do you have any thoughts of you would like to share?',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: TextFormField(
                      //onChanged: onChanged,
                      decoration: const InputDecoration(
                        hintText: 'Yes there',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 40),
                              textStyle: TextStyle(fontSize: 15),
                              primary: Colors.blueGrey,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text('Submit'),
                            onPressed: (){

                            }),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 40),
                              textStyle: TextStyle(fontSize: 15),
                              primary: Colors.blueGrey,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text('Cancel'),
                            onPressed: (){

                            }),

                      ],

                    )
                ),
              ],
            )),
            // Text(
            //     selectedValue1.toString(),
            //   style: TextStyle(fontSize: 1),
            // ),
            // SizedBox(height: 20),
            // Text(
            //   '¿Cómo fue la ayuda que recibiste?',
            //   style: TextStyle(color: Color(0xFF6f7478), fontSize: 18),
            // ),
            // SizedBox(height: 20),
            // ReviewSlider(
            //     optionStyle: TextStyle(
            //       color: Colors.red,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     onChange: onChange2,
            //     initialValue: 1,
            //     options: ['Terrible', 'Malo', 'Bien', 'Vale', 'Genial']),
            // Text(selectedValue2.toString()),
          ],
        ),
      ),
    );
  }
}
