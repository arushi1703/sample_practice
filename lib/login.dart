import 'package:flutter/material.dart';
import 'auth_service.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final authService= AuthService();

  final TextEditingController emailcon= TextEditingController();
  final TextEditingController passcon= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: EdgeInsets.all(40),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(height: 30),
            TextFormField(
              controller: emailcon,
              decoration: InputDecoration(
                hintText: 'Enter email',
              ),
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: passcon,
              decoration: InputDecoration(
                hintText: 'Enter password',
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  authService.loginUser(emailcon.text,passcon.text);
                },
                child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
