import 'package:ezexpense/model/expense_model.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(
    this.expense, {
    super.key,
  });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 12),
    //   child: Card(
    //     elevation: 1.0,
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(
    //         horizontal: 20,
    //         vertical: 16,
    //       ),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             expense.title,
    //             style: const TextStyle(fontWeight: FontWeight.bold),
    //           ),
    //           const SizedBox(
    //             height: 4,
    //           ),
    //           Row(
    //             children: [
    //               Text('₹${expense.amount}'),
    //               const Spacer(),
    //               Row(
    //                 children: [
    //                   Icon(
    //                     categoryIcons[expense.category],
    //                   ),
    //                   const SizedBox(
    //                     width: 5,
    //                   ),
    //                   Text(
    //                     expense.formattedDate,
    //                   )
    //                 ],
    //               )
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Card(
        elevation: 1,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(
              categoryIcons[expense.category],
            ),
          ),
          title: Text(expense.title,
              style: Theme.of(context).textTheme.labelLarge),
          subtitle: Text(expense.formattedDate),
          trailing: Text('₹${expense.amount}',
              style: Theme.of(context).textTheme.bodyMedium),
        ),
      ),
    );
  }
}
