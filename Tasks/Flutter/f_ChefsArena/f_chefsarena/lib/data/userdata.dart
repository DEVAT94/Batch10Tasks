class UserData {
  final String firstName;
  final String lastName;
  final String title;
  final int rank;
  final int xp;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.title,
    required this.rank,
    required this.xp,
  });

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      title: map['title'],
      rank: map['rank'] ?? '',
      xp: map['xp'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'title': title,
      'rank': rank,
      'xp': xp,
    };
  }
}
