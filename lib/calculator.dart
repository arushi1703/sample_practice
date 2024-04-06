import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  final TextEditingController n1con= TextEditingController();
  final TextEditingController n2con= TextEditingController();
  final TextEditingController resultcon= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            SizedBox(
              width: 300,
              child:TextFormField(
                controller: n1con,
                decoration: InputDecoration(
                  hintText: 'Enter first number',
                ),
              ),
            ),
            SizedBox(
              width: 300,
              child:TextFormField(
                controller: n2con,
                decoration: InputDecoration(
                  hintText: 'Enter second number',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    int? n1= int.tryParse(n1con.text);
                    int? n2= int.tryParse(n1con.text);
                    resultcon.text=(n1!+n2!).toString();
                  });
                },
                child: Text('+'),
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  int? n1= int.tryParse(n1con.text);
                  int? n2= int.tryParse(n1con.text);
                  resultcon.text=(n1!-n2!).toString();
                });
              },
              child: Text('-'),
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  int? n1= int.tryParse(n1con.text);
                  int? n2= int.tryParse(n1con.text);
                  resultcon.text=(n1!*n2!).toString();
                });
              },
              child: Text('*'),
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  int? n1= int.tryParse(n1con.text);
                  int? n2= int.tryParse(n2con.text);
                  try {
                    resultcon.text = (n1! / n2!).toString();
                  }
                  catch (e){
                    print('Error');
                  }
                });
              },
              child: Text('/'),
            ),
            SizedBox(
              width: 300,
              child:TextFormField(
                controller: resultcon,
                decoration: InputDecoration(
                  hintText: '',
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
