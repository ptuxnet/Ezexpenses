import 'package:ezexpense/expenses_list.dart';
import 'package:ezexpense/model/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Vada-pav',
      amount: 0.5,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('data'),
            Expanded(
                child: ExpensesList(
              expenses: _registeredExpenses,
            )),
          ],
        ),
      ),
    );
  }
}
