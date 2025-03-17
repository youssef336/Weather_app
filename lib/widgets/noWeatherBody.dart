// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';

// ignore: camel_case_types
class noWeatherBody extends StatelessWidget {
  const noWeatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "there is no weather 😓 , strart ",
            style: TextStyle(
                fontFamily: "Pacifico",
                fontSize: 25,
                fontWeight: FontWeight.w100),
          ),
          Text(
            "searching now 🔍",
            style: TextStyle(
              fontFamily: "Pacifico",
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}
