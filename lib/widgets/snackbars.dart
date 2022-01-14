import 'package:flutter/material.dart';


class ActionSuccessSnackBar extends SnackBar {
  final String label;

  ActionSuccessSnackBar({
    Key? key,
    required this.label
  }) : super(key: key,
      content: _SnackBarContent(label: label),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 2)
  );
}

class _SnackBarContent extends StatelessWidget {

  final String label;
  const _SnackBarContent({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class InvalidInputSnackBar extends SnackBar{

  InvalidInputSnackBar({
    Key? key,
    required this.label,

  }) :super(
      key: key,
      content: _SnackBarContent(label: label,),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 1)
  );
  final String label;
}



