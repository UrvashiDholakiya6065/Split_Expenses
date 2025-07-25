class GroupMemberModel {
  final int? id;
  final int groupId;
  final int userId;

  GroupMemberModel({
    this.id,
    required this.groupId,
    required this.userId,
  });

  factory GroupMemberModel.fromMap(Map<String, dynamic> map) {
    return GroupMemberModel(
      id: map['id'],
      groupId: map['group_id'],
      userId: map['user_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'group_id': groupId,
      'user_id': userId,
    };
  }
}
