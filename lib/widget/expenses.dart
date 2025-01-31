import 'dart:async';

import 'package:ezexpense/widget/chart/chart.dart';
import 'package:ezexpense/widget/expenses_list.dart';
import 'package:ezexpense/model/expense_model.dart';
import 'package:ezexpense/widget/new_expense.dart';
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
      amount: 200,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Groceries',
      amount: 510,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Fuel',
      amount: 310,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Books',
      amount: 160,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Movie',
      amount: 130,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Dinner',
      amount: 450,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Gym Membership',
      amount: 250,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Lunch',
      amount: 200,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Taxi',
      amount: 150,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Concert',
      amount: 6000,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Office Supplies',
      amount: 350,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  // Method for scaffold's Icon button
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  // Method for add Expense.
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  // Method for remove Expense.
  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      content: const Text('Your Expense has been deleted'),
      action: SnackBarAction(
        label: 'UNDO',
        onPressed: () {
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // Automatically dismiss the SnackBar after 2 seconds
    Timer(const Duration(seconds: 4), () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expense found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Ezexpense',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Chart(expenses: _registeredExpenses),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(),
            ),
            Expanded(
              child: mainContent,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddExpenseOverlay,
        child: const Icon(Icons.add),
      ),
    );
  }
}
