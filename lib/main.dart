import 'package:expensereport/widgets/input_transactions.dart';
import 'package:expensereport/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void startaddnewtransaction(BuildContext ctx ){
    showModalBottomSheet(context: ctx, builder: (_){
      return Text("Hey this is your modal screen !!");
    },);


  }

  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        fontFamily: 'Georgia',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Container(
              width: 100,
              child: Text("Expense Report Application ",textAlign: TextAlign.center,),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add) ,onPressed: ()=>startaddnewtransaction(context), )
          ],
        ),
        body:SingleChildScrollView(
          child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Card(
              elevation: 5,
              color: Colors.blue,
              child: Container(
                width: double.infinity,
                child: Text("Hey this is a chart",textAlign: TextAlign.center,),
              ),
            ),
            TransactionList(),
          ],
        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){},
        ),
      ),
    );
  }
}