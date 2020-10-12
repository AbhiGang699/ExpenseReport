import './widgets/input_transactions.dart';
import 'package:flutter/material.dart';
import './models/Transaction.dart';
import './widgets/showTrans.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  

  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        fontFamily: 'Georgia',
      ),
      title: "Flutter App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> expenses = [
    Transaction(
      id: "first",
      title : "Samose",
      amount: 100,
      date: DateTime.now(),
    ),

    Transaction(
      id: "second",
      title : "Chicken Lollipop",
      amount: 150,
      date: DateTime.now(),
    ),
  ];

  void func(String task, String amount){
    Transaction obj = new Transaction(
        id: null,
        title: task,
        amount: double.parse(amount),
        date: DateTime.now()
    );
    setState(() {
      expenses.add(obj);
    });
  }

  void startAddNewTransaction(BuildContext ctx ) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return InputTransactions(func);
    });
  }

   @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 100,
          child: Text("Expense Report Application ",textAlign: TextAlign.center,),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add) ,onPressed: ()=>startAddNewTransaction(context)),
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
            Column(
                children:[
                  Container(
                    height: 300,
                    child:ListView.builder(
                      itemBuilder: (ctx ,index){
                        return showTrans(expenses[index]);
                      },
                      itemCount: expenses.length,
                    ),
                  ),

                ]
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Builder(
        builder:(context)=> FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>startAddNewTransaction(context),
        ),),
    );
  }
}