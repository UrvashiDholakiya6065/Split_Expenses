class ExpenseModel {
  final int? id;
  final int groupId;
  final String title;
  final double amount;
  final int paidBy;
  final String datetime;

  ExpenseModel({
    this.id,
    required this.groupId,
    required this.title,
    required this.amount,
    required this.paidBy,
    required this.datetime,
  });

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id'],
      groupId: map['group_id'],
      title: map['title'],
      amount: map['amount'],
      paidBy: map['paid_by'],
      datetime: map['datetime'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'group_id': groupId,
      'title': title,
      'amount': amount,
      'paid_by': paidBy,
      'datetime': datetime,
    };
  }
}