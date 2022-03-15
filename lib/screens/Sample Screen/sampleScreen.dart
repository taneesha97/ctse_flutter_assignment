import 'package:flutter/material.dart';
import 'package:reviews_slider/reviews_slider.dart';

class SampleScreen extends StatefulWidget {
  SampleScreen({Key? key}) : super(key: key);

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  int? selectedValue1;
  int? selectedValue2;

  void onChange1(int value) {
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
      color: Colors.grey,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'How was the help you received?',
              style: TextStyle(color: Color(0xFF6f7478), fontSize: 18),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReviewSlider(
                onChange: onChange1,
                optionStyle: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 1
                ),
                options: ['Terrible', 'Malo', 'Bien', 'Vale', 'Genial']
                
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ReviewSlider(
                    onChange: onChange1,
                    circleDiameter: 40,
                    optionStyle: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 1
                    ),
                    options: ['Terrible', 'Malo', 'Bien', 'Vale', 'Genial']

                ),
              ),
            ),
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
