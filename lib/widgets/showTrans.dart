import '../models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class showTrans extends StatelessWidget{
  Transaction trans;
  showTrans(this.trans);
  Widget build (BuildContext context){
    return Card(
     // color: Colors.amber ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.purple,
              ),
            ),
            child: Text("\$ "+trans.amount.toString(),
              style: TextStyle(color: Colors.purple),
              ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(trans.title),
              Text(DateFormat('MMM dd, yyyy').format(trans.date))
            ],
          ),
        ],
      ),
    );
  }

}