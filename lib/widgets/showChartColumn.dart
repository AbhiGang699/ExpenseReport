import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowChartColumn extends StatelessWidget{
  final Map<String , Object > val;
  final double totalAmount;
  ShowChartColumn(this.val,this.totalAmount);

  Widget build ( BuildContext context){
    print(totalAmount);
    return SizedBox(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(val['day']),
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 100,
                width: 20,
                //color: Theme.of(context).primaryColor,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(220, 220, 200, 1),
                  border: Border.all(color: Colors.grey , width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),

              ),
              Container(
                height: totalAmount<=0 ? 0 : 100*(((val['totalSum'] as double)/totalAmount)),
                width: 20,
                // color: Color.fromRGBO(220, 220, 200, 1),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border.all(color: Colors.grey , width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          FittedBox(child: Text( (val['totalSum'] as double).toStringAsFixed(1) )),
        ],
      ),
    );
  }
}
