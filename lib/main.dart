import './widgets/input_transactions.dart';
import 'package:flutter/material.dart';
import './models/Transaction.dart';
import './widgets/showTrans.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  

  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        //primaryColor: Colors.green,
        brightness: Brightness.light ,
        fontFamily: 'Monotype Corsiva',
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
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
      id: DateTime.now().toString(),
      title : "Samose",
      amount: 100,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),

    Transaction(
      id: DateTime.now().toString(),
      title : "Chicken Lollipop",
      amount: 150,
      date: DateTime.now(),
    ),
  ];

  void func(String task, String amount,DateTime date){
    Transaction obj = new Transaction(
        id: date.toString(),
        title: task,
        amount: double.parse(amount),
        date: date,
    );
    setState(() {
      expenses.add(obj);
    });
  }

  void deleteTransaction(String trans_id){
    setState(() {
      expenses.removeWhere((element) =>element.id==trans_id);
    });
  }

  void startAddNewTransaction(BuildContext ctx ) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(
          onTap: (){},
          child : InputTransactions(func),
          behavior: HitTestBehavior.opaque,
        onDoubleTap: ()=>AnimatedIcons.close_menu,
      );
    });
  }


   @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 100,
          child: Text('Expense Report' , style: TextStyle(fontSize: 14),),
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
              //color: Colors.blue,
              child: Container(
                width: double.infinity,
                child: Chart(expenses),
              ),
            ),
            Column(
                children:[
                  Container(
                    height: 500,
                    child:expenses.isEmpty ?
                    Container(
                      height: 300,
                      child:Column(
                       children : [
                         Text("Nothing to show yet !!! ",style: TextStyle(fontWeight: FontWeight.bold),),
                         SizedBox(height: 10),
                         Image.asset('assets/images/nothingHere.png' ,
                        fit: BoxFit.contain,
                      ),
                    ]),)
                        : ListView.builder(
                      itemBuilder: (ctx ,index){
                        return showTrans(expenses[index],deleteTransaction);
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