import '../models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class showTrans extends StatelessWidget {
  Transaction trans;
  final deleteTransaction;
  showTrans(this.trans,this.deleteTransaction);

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: FittedBox(
                  child: Text(
                    trans.amount.toStringAsFixed(2),
                    style: TextStyle( fontWeight: FontWeight.bold , color: Colors.white),
                  ),
              ),
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          title: Text(trans.title),
          subtitle: Text('${DateFormat.yMMMd().format(trans.date)}'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: ()=> deleteTransaction(trans.id),
          ),
        ),
      ),
    );
  }

}













      /*Card(
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
                color: Theme.of(context).primaryColor,
              ),
            ),
            child: Text("\$ "+trans.amount.toStringAsFixed(2),
              style: TextStyle(color: Theme.of(context).primaryColor),
              ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(trans.title,),
              Text(DateFormat('MMM dd, yyyy').format(trans.date))
            ],
          ),
        ],
      ),
    );
  }

}*/