import './input_transactions.dart';
import 'package:flutter/material.dart';
import './showTrans.dart';
import '../models/Transaction.dart';


class TransactionList extends StatefulWidget{
  _TransactionList createState()=> _TransactionList();
}

class _TransactionList extends State<TransactionList>{

  final List<Transaction> expenses = [
    /*Transaction(
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
    ),*/
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

  Widget build (BuildContext context){
    return Column(
      children:[
        InputTransactions(func),
        Container(
          height: 100,
          child:expenses.isEmpty ?
              Container(
                height: 300,
                child: Image.asset('assets/images/nothingHere.png' ,
                  fit: BoxFit.cover,
                ),
              )
              : ListView.builder(
                itemBuilder: (ctx ,index){
                  return showTrans(expenses[index],null);
                },
                itemCount: expenses.length,
            ),
        ),

      ]
    );
  }
}