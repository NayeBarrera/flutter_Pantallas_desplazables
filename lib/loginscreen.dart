import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firstscreen.dart';
import 'registersreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _usernameController.text,
        password: _passwordController.text,
      );
      // Si el inicio de sesión es exitoso, navegar a la pantalla FirstScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FirstScreen()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          _errorMessage = 'Usuario no encontrado';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          _errorMessage = 'Contraseña incorrecta';
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Correo electrónico'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Contraseña',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Ingresar'),
              onPressed: _login,
            ),
            SizedBox(height: 20),
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 20),
            TextButton(
              child: Text('Registrarse'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
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
