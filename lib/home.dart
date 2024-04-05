import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'product.dart';
import 'auth_service.dart';
import 'userForm.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController textdata= TextEditingController();

  final authservice= AuthService();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Products Page'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>ProductList(),)
                );
              },
            ),
            ListTile(
              title: const Text('Form'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>UserForm()),
                );
              },
            ),
            ListTile(
              title: const Text('LogOut'),
              onTap: () {
                authservice.logOut();
              },
            ),
          ],
        ),
      ),
      body: Column(
        children:[
          StreamBuilder<DocumentSnapshot>(
          stream:FirebaseFirestore.instance.collection("users").doc("Urja").snapshots(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              final userData=snapshot.data!.data() as Map<String, dynamic>;
              return Column(
                children: [
                  Text(userData["name"]),
                  SizedBox(height:30),
                  Text(userData["age"].toString()),
                  SizedBox(height:30),
                  Text(userData["email"]),
                  SizedBox(height:30),
                  Text(userData["password"]),
                  SizedBox(height:30),
                ],
              );
            }
            else if(snapshot.hasError){
              return Text('Error');
            }
            else{
              return CircularProgressIndicator();
            }
          }
        ),
          SizedBox(
            width:300,
            child: TextField(
              controller: textdata,
            ),
          ),
          ElevatedButton(
              onPressed: (){ retrieveData();},
              child: Text('Retrieve'),
          )
        ],
      ),
    );
  }
  void retrieveData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? fn=prefs.getString("firstname");
    final String? ln=prefs.getString("lastname");

    setState(() {
      textdata.text=fn!+" "+ln!;
    });
  }
}
