import '../models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './showChartColumn.dart';

class Chart extends StatefulWidget{
  List<Transaction> expenses;

  Chart(this.expenses);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  double totalAmount=0.0;

  List<Map<String,Object>> get groupedRecentTransactions{
    return List.generate(7, (index){
      double sum=0;
      final datenow= DateTime.now().subtract(Duration(days: index));
      for(int i=0;i<widget.expenses.length;i++)
        if( (widget.expenses[i].date).day == datenow.day )sum+=widget.expenses[i].amount;
       return {
         'day': DateFormat.E().format(datenow),
         'totalSum': sum,
       };
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    totalAmount=0;
     for(int i=0;i<widget.expenses.length;i++){
      totalAmount+=widget.expenses[i].amount;
    }
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [...(groupedRecentTransactions).map( (col){
          return Flexible(
              fit: FlexFit.tight
              ,
              child: ShowChartColumn(col,totalAmount));
        }
        ).toList(),
        ]),
    );
}
}
