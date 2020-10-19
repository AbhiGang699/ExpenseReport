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

  bool _showChart=false;
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
        // onDoubleTap: ()=>AnimatedIcons.close_menu,
      );
    });
  }


   @override
  Widget build(BuildContext context){
    bool _isLandscape = (MediaQuery.of(context).orientation == Orientation.landscape);
    var _bodyHeight = MediaQuery.of(context).size.height;
    var _bodyWidth =  MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _bodyHeight * 0.1,
        title: Container(
          width: 100,
          child: Text('Expense Report' , style: TextStyle(fontSize: 14),),
            ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add) ,onPressed: ()=>startAddNewTransaction(context)),
        ],
      ),
      body:SingleChildScrollView(
        child: Container(
          height: _bodyHeight*0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if(_isLandscape==true)
              Container(
                  height: _bodyHeight*0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: _bodyHeight*0.05),
                      Text("Show Chart : "),
                      Switch(
                          value: _showChart,
                          onChanged: (val){
                        setState(() {
                          _showChart=val;
                        });
                      }),
                      SizedBox(height: _bodyHeight*0.05,),
                    ],
                  ),
                ),
              if(_showChart== true && _isLandscape==true || _isLandscape==false)
              Card(
                elevation: 5,
                //color: Colors.blue,
                child: Container(
                  height: (_isLandscape )? _bodyHeight*0.7:_bodyHeight*0.25,
                  width: double.infinity,
                  child: Chart(expenses),
                ),
              )
              ,
              if(_isLandscape==true && _showChart==false || _isLandscape==false)
              Column(
                  children:[
                      expenses.isEmpty ?
                      Container(
                        width: _bodyWidth*0.7,
                        height: _isLandscape ? _bodyHeight*0.7 : _bodyHeight*0.4,
                        child:Column(
                         children : [
                           SizedBox(height: _bodyHeight*0.02),
                           Text("Nothing to show yet !!! ",style: TextStyle(fontWeight: FontWeight.bold),),
                           SizedBox(height: _bodyHeight*0.02),
                           Image.asset('assets/images/nothingHere.png' ,
                          fit: BoxFit.cover,
                        ),
                      ]),
                      )
                          : Container(
                        height: _isLandscape ? _bodyHeight*0.7 : _bodyHeight*0.5,
                            child:ListView.builder(
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