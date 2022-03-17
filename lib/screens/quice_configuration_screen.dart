import 'package:ctse_assignment_1/screens/quize_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/form_dropdown/Scrollbar.dart';
import '../components/form_dropdown/ExpandedListAnimationWidget.dart';



class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}
List <String> _list =['Action',"Romance","Thriller",'Animation'];
List <String> _list2 =['5',"10","15",'20'];
List <String> _list3 =['10 Min',"15 Min","20 Min", "30 Min"];

class _DropDownState extends State<DropDown> {
  bool isStrechedDropDown = false;
  bool isStrechedDropDown2 = false;
  bool isStrechedDropDown3 = false;

  int? groupValue;
  int? groupValue2;
  int? groupValue3;

  String title = 'Enter Movie Category';
  String title2 = 'Enter No of questions';
  String title3 = 'Enter time';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: AppBar(
            centerTitle: true,
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/p2.jpg"),
                        fit: BoxFit.fill,
                        // colorFilter: ColorFilter.mode(Colors.blue.withOpacity(0), BlendMode.darken)
                    )
                ),
              ),
            ),

            title: Text(
              "Quice Configuration",
              style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
            ),
            backgroundColor: Colors.pink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50))
            ),
          ),
          // title: Text(
          //   "Quiz Configuration",
          //   style: TextStyle(color: Colors.black),
          // ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  // color: Colors.lightGreenAccent,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 5.0, bottom: 5.0, top: 5.0),
                        child: Text(
                          "Quiz Configuration",
                           style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xff1e88e5)),
                                    borderRadius: BorderRadius.all(Radius.circular(12))),
                                child: Column(
                                  children: [
                                    Container(
                                      // height: 45,
                                        width: double.infinity,
                                        padding: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color(0xff1e88e5),
                                            ),
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(10))),
                                        constraints: BoxConstraints(
                                          minHeight: 45,
                                          minWidth: double.infinity,
                                        ),
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 20, vertical: 10),
                                                child:
                                                Text(
                                                  title,
                                                  style: TextStyle(color: Colors.black45),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isStrechedDropDown =
                                                    !isStrechedDropDown;
                                                  });
                                                },
                                                child: Icon(isStrechedDropDown
                                                    ? Icons.arrow_upward
                                                    : Icons.arrow_downward))
                                          ],
                                        )),
                                    ExpandedSection(
                                      expand: isStrechedDropDown,
                                      height: 100,
                                      child: MyScrollbar(
                                        builder: (context, scrollController2) =>
                                            ListView.builder(
                                                padding: EdgeInsets.all(0),
                                                controller: scrollController2,
                                                shrinkWrap: true,
                                                itemCount: _list.length,
                                                itemBuilder: (context, index) {
                                                  return RadioListTile(
                                                      title: Text(_list.elementAt(index)),
                                                      value: index,
                                                      groupValue: groupValue,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          groupValue = val as int;
                                                          title = _list.elementAt(index);
                                                        });
                                                      });
                                                }),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 5.0, bottom: 5.0, top: 5.0),
                      child: Text(
                        "Quiz Configuration",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff1e88e5)),
                                  borderRadius: BorderRadius.all(Radius.circular(12))),
                              child: Column(
                                children: [
                                  Container(
                                    // height: 45,
                                      width: double.infinity,
                                      padding: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xff1e88e5),
                                          ),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                      constraints: BoxConstraints(
                                        minHeight: 45,
                                        minWidth: double.infinity,
                                      ),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                              child: Text(
                                                title2,
                                                style: TextStyle(color: Colors.black45),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isStrechedDropDown2 =
                                                  !isStrechedDropDown2;
                                                });
                                              },
                                              child: Icon(isStrechedDropDown2
                                                  ? Icons.arrow_upward
                                                  : Icons.arrow_downward))
                                        ],
                                      )),
                                  ExpandedSection(
                                    expand: isStrechedDropDown2,
                                    height: 100,
                                    child: MyScrollbar(
                                      builder: (context, scrollController2) =>
                                          ListView.builder(
                                              padding: EdgeInsets.all(0),
                                              controller: scrollController2,
                                              shrinkWrap: true,
                                              itemCount: _list2.length,
                                              itemBuilder: (context, index) {
                                                return RadioListTile(
                                                    title: Text(_list2.elementAt(index)),
                                                    value: index,
                                                    groupValue: groupValue2,
                                                    onChanged: (val) {
                                                      setState(() {
                                                        groupValue2 = val as int;
                                                        title2 = _list2.elementAt(index);
                                                      });
                                                    });
                                              }),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 10),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 5.0, bottom: 5.0, top: 5.0),
                      child: Text(
                        "Quiz Configuration",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff1e88e5)),
                                  borderRadius: BorderRadius.all(Radius.circular(12))),
                              child: Column(
                                children: [
                                  Container(
                                    // height: 45,
                                      width: double.infinity,
                                      padding: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xff1e88e5),
                                          ),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                      constraints: BoxConstraints(
                                        minHeight: 45,
                                        minWidth: double.infinity,
                                      ),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                              child: Text(
                                                title3,
                                                style: TextStyle(color: Colors.black45),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isStrechedDropDown3 =
                                                  !isStrechedDropDown3;
                                                });
                                              },
                                              child: Icon(isStrechedDropDown3
                                                  ? Icons.arrow_upward
                                                  : Icons.arrow_downward))
                                        ],
                                      )),
                                  ExpandedSection(
                                    expand: isStrechedDropDown3,
                                    height: 100,
                                    child: MyScrollbar(
                                      builder: (context, scrollController3) =>
                                          ListView.builder(
                                              padding: EdgeInsets.all(0),
                                              controller: scrollController3,
                                              shrinkWrap: true,
                                              itemCount: _list3.length,
                                              itemBuilder: (context, index) {
                                                return RadioListTile(
                                                    title: Text(_list3.elementAt(index)),
                                                    value: index,
                                                    groupValue: groupValue3,
                                                    onChanged: (val) {
                                                      setState(() {
                                                        groupValue3 = val as int;
                                                        title3 = _list3.elementAt(index);
                                                      });
                                                    });
                                              }),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Column(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(90, 45),
                          textStyle: TextStyle(fontSize: 15),
                          primary: Colors.blue,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text('Add Label'),
                        onPressed: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => QuizeList()));
                        }),
                    SizedBox(height: 20),
                    // ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       minimumSize: Size(105, 45),
                    //       textStyle: TextStyle(fontSize: 15),
                    //       primary: Colors.pink,
                    //       shape: new RoundedRectangleBorder(
                    //         borderRadius: new BorderRadius.circular(10.0),
                    //       ),
                    //     ),
                    //     child: Text('Delete'),
                    //     onPressed: (){
                    //       // Navigator.push(context, MaterialPageRoute(builder: (context) =>  ExampleList(title: 'Exaple List',)));
                    //   }),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
