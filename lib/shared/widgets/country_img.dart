import 'package:flutter/material.dart';

class CountryImageWidget extends StatelessWidget {
  final String flag;
  const CountryImageWidget({Key? key, required this.flag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: CircleAvatar(
        radius: 65,
        backgroundColor: Colors.white.withOpacity(.7),
        child: CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(flag),
        ),
      ),
    );
  }
}
