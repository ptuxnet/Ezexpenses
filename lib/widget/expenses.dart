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

  // Method for scaffold's Icon button
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ezexpense'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
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
