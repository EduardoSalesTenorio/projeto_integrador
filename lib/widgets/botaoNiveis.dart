import 'package:flutter/material.dart';

class BotaoNiveis extends StatelessWidget {
  BotaoNiveis();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: SizedBox(
        width: 30,
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '1',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Icon(Icons.star),
          ],
        ),
      ),
    );
  }
}
