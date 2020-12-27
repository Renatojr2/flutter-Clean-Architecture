import 'package:flutter/material.dart';
import 'package:fordev/ui/pages/pages.dart';
import '../../components/header_line.dart';
import '../../components/components.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;

  const LoginPage({this.presenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LoginHeader(),
            HeaderLine(text: 'Login'),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Form(
                child: Column(
                  children: [
                    StreamBuilder(
                      stream: presenter.emailErrorStream,
                      builder: (context, snapshot) => TextFormField(
                        onChanged: presenter.validateEmail,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          errorText: snapshot.data?.isEmpty == true
                              ? null
                              : snapshot.data,
                          icon: Icon(
                            Icons.email,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32, top: 8),
                      child: StreamBuilder<String>(
                        stream: presenter.passwordErrorStream,
                        builder: (context, snapshot) => TextFormField(
                          onChanged: presenter.validatePassword,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            icon: Icon(
                              Icons.lock,
                              color: Theme.of(context).primaryColorLight,
                            ),
                            errorText: snapshot.data?.isEmpty == true
                                ? null
                                : snapshot.data,
                          ),
                          obscureText: true,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: RaisedButton(
                        onPressed: null,
                        child: Text('Entrar'.toUpperCase()),
                      ),
                    ),
                    StreamBuilder<bool>(
                        stream: presenter.isFormValidErrorStream,
                        builder: (context, snapshot) {
                          return FlatButton.icon(
                            icon: Icon(Icons.person),
                            onPressed: snapshot.data == true ? () {} : null,
                            label: Text('Criar conta'),
                          );
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
