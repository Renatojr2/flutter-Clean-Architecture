import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('lib/ui/assets/logo.png'),
            ),
            Text(
              'Login'.toUpperCase(),
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Entrar'.toUpperCase()),
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.person),
                    onPressed: () {},
                    label: Text('Criar conta'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
