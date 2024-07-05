import 'package:flutter/material.dart';
import 'secondscreen.dart';

class FirstScreen extends StatelessWidget {
  final int num1 = 7;
  final int num2 = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primera Pantalla'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$num1 x $num2'),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Ver Resultado'),
              onPressed: () {
                int resultado = num1 * num2;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(result: resultado),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
