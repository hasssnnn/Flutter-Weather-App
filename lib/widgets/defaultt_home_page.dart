import 'package:flutter/material.dart';

class DefaultHomePageWidget extends StatelessWidget {
  const DefaultHomePageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          'There is no weather yet',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        Text(
          'Try to search now!',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ]),
    );
  }
}