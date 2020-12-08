import 'package:doe_marmita/main.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final passController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // userController.text = 'davi';
    // passController.text = '123456';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(),
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).padding.top),
            ),
            margin: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  TextFormField(
                    controller: userController,
                    textCapitalization: TextCapitalization.none,
                    decoration: InputDecoration(labelText: 'Usuário'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white),
                      // style: TextStyle(color: Colors.white),
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      if (userController.text == 'davi' &&
                          passController.text == '123456') {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                            (route) => false);
                      } else {
                        final snackBar = SnackBar(
                          content: Text('Falha na autenticação!'),
                        );
                        return _scaffoldKey.currentState.showSnackBar(snackBar);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
