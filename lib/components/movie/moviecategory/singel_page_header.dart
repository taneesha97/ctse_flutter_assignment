import 'package:flutter/material.dart';

import '../../../styles.dart';

class SinglePageHeader extends StatelessWidget {
  final String header;
  final Widget reusableWidget;
  const SinglePageHeader({Key? key, required this.reusableWidget, required this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
            ),
            child: Text(header, style: Styles.textSectionHeader,),
          ),
          Divider(
            color: Styles.primaryThemeColor,
            thickness: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 5,
                bottom: 5,
                right: 5,
              ),
              child: reusableWidget,
            ),
          ),
        ],
      ),
    );
  }
}
