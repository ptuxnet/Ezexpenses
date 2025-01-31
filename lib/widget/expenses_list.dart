import 'package:ezexpense/model/expense_model.dart';
import 'package:ezexpense/widget/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Slidable(
        closeOnScroll: true,
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              icon: Icons.edit_sharp,
              label: 'Edit',
              borderRadius: BorderRadius.circular(10),
            ),
            SlidableAction(
              onPressed: (context) =>
                  _showConfirmationDialog(context, expenses[index]),
              backgroundColor: Colors.red.shade400,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        child: ExpensesItem(
          expenses[index],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, Expense expense) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirm Deletion'),
        content: const Text('Are you sure you want to delete this expense?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              onRemoveExpense(expense);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
