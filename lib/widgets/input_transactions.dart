import 'dart:math';

import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import '../widgets/transaction_list.dart';

class InputTransactions extends StatefulWidget{
  final Function func;
  InputTransactions(this.func);
  _InputTransactions createState()=>_InputTransactions(func);
}

class _InputTransactions extends State<InputTransactions>{

  final Function func;

  TextEditingController inputTitle = TextEditingController();
  TextEditingController inputAmount= TextEditingController();

  _InputTransactions(this.func);

  void localFunction(){
    func(inputTitle.text,inputAmount.text);
    setState(() {
      inputAmount.clear();
      inputTitle.clear();
    });
  }


  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Card(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Title" ),
                controller: inputTitle,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: inputAmount,
              ),
            ],
          ),
        ),
        RaisedButton(
          elevation: 5,
          child: Text("Add Expense ") ,
          onPressed: localFunction,
        ),
      ],
    );
  }
}