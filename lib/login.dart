import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final authService= AuthService();

  final TextEditingController emailcon= TextEditingController();
  final TextEditingController passcon= TextEditingController();
  final TextEditingController namecon= TextEditingController();
  final TextEditingController agecon= TextEditingController();
  final TextEditingController mobilecon= TextEditingController();
  final TextEditingController otpcon= TextEditingController();

  ConfirmationResult? confirmation= null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: EdgeInsets.all(40),
        child:SingleChildScrollView(
          child: Column(
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
                validator: (passcon){
                  if (passcon!.length<6){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('More than 6'))
                    );
                  }
                  return null;
                }
              ),
              SizedBox(height:40),
              TextFormField(
                controller: namecon,
                decoration: InputDecoration(
                  hintText: 'Enter name',
                ),
              ),
              SizedBox(height:40),
              TextFormField(
                controller: agecon,
                decoration: InputDecoration(
                  hintText: 'Enter age',
                ),
              ),
              TextFormField(
                controller: mobilecon,
                decoration: InputDecoration(
                  hintText: 'Enter mobile number',
                ),
              ),
              TextFormField(
                controller: otpcon,
                decoration: InputDecoration(
                  hintText: 'Enter otp',
                ),
              ),
              SizedBox(height:40),
              ElevatedButton(
                onPressed: (){
                  authService.createUser(emailcon.text, passcon.text,namecon.text,agecon.text);
                },
                child: Text('Sign Up'),
              ),
              SizedBox(height:40),
              ElevatedButton(
                  onPressed: (){
                    authService.loginUser(emailcon.text,passcon.text);
                  },
                  child: Text('Login'),
              ),
              ElevatedButton(
                onPressed: () async{
                  confirmation = await authService.sendOtp(mobilecon.text);
                },
                child: Text('Send OTP'),
              ),
              ElevatedButton(
                onPressed: () async{
                  await authService.loginOtp(confirmation!, otpcon.text);
                },
                child: Text('Login with OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
