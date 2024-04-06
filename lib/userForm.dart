import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {

  final TextEditingController firstnamecon= TextEditingController();
  final TextEditingController lastnamecon= TextEditingController();

  void storeData() async{
    final SharedPreferences pref= await SharedPreferences.getInstance();
    await pref.setString('firstname',firstnamecon.text);
    await pref.setString('lastname',lastnamecon.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Form'),),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Enter first name:'),
                SizedBox(
                  width:300,
                  child: TextFormField(
                    controller: firstnamecon,
                    decoration: InputDecoration(
                      hintText: 'Ada',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height:40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Enter last name:'),
                SizedBox(height:20),
                SizedBox(
                  width:300,
                  child: TextFormField(
                    controller: lastnamecon,
                    decoration: InputDecoration(
                      hintText: 'Lovelace',
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed:(){
                  storeData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>Home()),
                  );
                  },
                child: Text('Store'),
            )
          ],
        ),
      ),
    );
  }
}


