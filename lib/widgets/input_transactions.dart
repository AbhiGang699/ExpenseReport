import 'dart:math';

import 'package:intl/intl.dart';
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
  DateTime selectedDate;

  void _justAnotherFunction(){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if(value==null)return;
      setState(() {
        selectedDate=value;
      });
    });
  }

  void localFunction(){
    String taitel;
    double amnt;
    try{
      taitel=inputTitle.text;
      amnt=double.parse(inputAmount.text) ;
      if(taitel.isEmpty || amnt <=0 || selectedDate==null)return ;
    }
    catch(e){
      return;
    }

    widget.func(inputTitle.text,inputAmount.text,selectedDate);
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
        
        Row(
          children: [
            Expanded(
              child: Container(
                  width: 150,
                  padding: EdgeInsets.all(5),
                  child: (selectedDate==null )?
                  Text("No Date Chosen ! ") :
                  Text('Chosen Date : ${DateFormat.yMd().format(selectedDate)}')
              ),
            ),
            FlatButton(
              child: Text("Choose Date",
                style: TextStyle(color: Theme.of(context).primaryColor , fontWeight: FontWeight.bold),
              ),
              onPressed: _justAnotherFunction,
            )
          ],
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: RaisedButton(
            elevation: 5,
            padding: EdgeInsets.all(10),
            color: Theme.of(context).primaryColor,
            child: Text("Add Expense " ,
              style: TextStyle( color: Colors.white),
            ) ,
            onPressed: localFunction,
          ),
        ),
      ],
    );
  }
}