import 'package:flutter/material.dart';

class NamedIcon extends StatelessWidget {
  final IconData iconData;
  // final String text;
  final VoidCallback? onTap;
  final int notificationCount;

  const NamedIcon({
    Key? key,
    this.onTap,
    // required this.text,
    required this.iconData,
    this.notificationCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        Icon(Icons.notifications),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              notificationCount.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
