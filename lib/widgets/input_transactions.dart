import 'dart:math';

import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import '../widgets/transaction_list.dart';

class InputTransactions extends StatefulWidget{
  final Function func;
  InputTransactions(this.func);
  _InputTransactions createState()=>_InputTransactions();
}

class _InputTransactions extends State<InputTransactions>{

  TextEditingController inputTitle = TextEditingController();
  TextEditingController inputAmount= TextEditingController();



  void localFunction(){
    String taitel;
    double amnt;
    try{
      taitel=inputTitle.text;
      amnt=double.parse(inputAmount.text) ;
      if(taitel.isEmpty || amnt <=0 )return ;
    }
    catch(e){
      return;
    }

    widget.func(inputTitle.text,inputAmount.text);
    setState(() {
      inputAmount.clear();
      inputTitle.clear();
    });
    Navigator.of(context).pop();
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
                keyboardType: TextInputType.text,
                onSubmitted: (_)=>localFunction,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: inputAmount,
                keyboardType: TextInputType.number,
                  onSubmitted: (_)=>localFunction
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