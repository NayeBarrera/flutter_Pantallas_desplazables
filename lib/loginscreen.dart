import 'package:flutter/material.dart';
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

  // Usuario y clave quemados
  static Map<String, String> _users = {
    'user': 'password'
  };

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (_users.containsKey(username) && _users[username] == password) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FirstScreen()),
      );
    } else {
      setState(() {
        _errorMessage = 'Usuario o contraseña incorrectos';
      });
    }
  }

  void _goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterScreen(onRegister: _registerUser),
      ),
    );
  }

  void _registerUser(String username, String password) {
    setState(() {
      _users[username] = password;
    });
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
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
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
              onPressed: _goToRegister,
            ),
          ],
        ),
      ),
    );
  }
}
