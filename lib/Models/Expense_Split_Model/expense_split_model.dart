class ExpenseSplitModel {
  final int? id;
  final int expenseId;
  final int userId;
  final double amount;

  ExpenseSplitModel({
    this.id,
    required this.expenseId,
    required this.userId,
    required this.amount,
  });

  factory ExpenseSplitModel.fromMap(Map<String, dynamic> map) {
    return ExpenseSplitModel(
      id: map['id'],
      expenseId: map['expense_id'],
      userId: map['user_id'],
      amount: map['amount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'expense_id': expenseId,
      'user_id': userId,
      'amount': amount,
    };
  }
}

