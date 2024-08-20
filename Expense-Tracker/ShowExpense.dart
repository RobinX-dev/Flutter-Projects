import 'package:flutter/material.dart';

import 'DataModel.dart';

class ShowExpense extends StatefulWidget {
  const ShowExpense({super.key});

  @override
  State<ShowExpense> createState() => _ShowExpenseState();
}

class _ShowExpenseState extends State<ShowExpense> {
  List<DataModel> data = [
    DataModel(title: "Tavel", amount: 1256, date: DateTime.now(), category: Categories.travel),
    DataModel(title: "Food", amount: 589, date: DateTime.now(), category: Categories.food),
    DataModel(title: "Games", amount: 695, date: DateTime.now(), category: Categories.shopping),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker'),
          actions: [const Icon(Icons.add)],),
      body: Column(
        children: [
          ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context,index)=>
          Card(
            child: Column(
              children: [
                Text(data[index].title),
                Row(
                  children: [
                    Text(data[index].amount.toString()),
                    Spacer(),
                    Text(data[index].date.toString(yMd))
                  ],
                )
              ],
            )
          ))
        ]
      ),
      
    );
  }
}