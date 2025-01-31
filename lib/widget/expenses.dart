import 'dart:async';
import 'package:ezexpense/widget/Buttons/custom_choice_chips.dart';
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

  final Map<Category, bool> _selectedCategories = {
    for (var category in Category.values) category: false,
  };

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

    // Automatically dismiss the SnackBar after 4 seconds
    Timer(const Duration(seconds: 4), () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    });
  }

  List<Expense> _getFilteredExpenses() {
    final selectedCategories = _selectedCategories.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    if (selectedCategories.isEmpty) {
      return _registeredExpenses;
    }

    return _registeredExpenses
        .where((expense) => selectedCategories.contains(expense.category))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredExpenses = _getFilteredExpenses();

    Widget mainContent = const Center(
      child: Text('No expense found. Start adding some!'),
    );

    if (filteredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: filteredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Ezexpense',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Chart(expenses: filteredExpenses),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Category.values.length,
                  itemBuilder: (ctx, index) {
                    final category = Category.values[index];
                    return CustomChoiceChip(
                      text: category.name,
                      isSelected: _selectedCategories[category]!,
                      onSelected: (isSelected) {
                        setState(() {
                          _selectedCategories[category] = isSelected;
                        });
                      },
                    );
                  },
                ),
              ),
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
