import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserData {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String title;
  final int rank;
  final int xp;

  UserData({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.title,
    required this.rank,
    required this.xp,
  });

  factory UserData.fromMap(String uid, Map<String, dynamic> map) {
    return UserData(
      uid: uid,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      title: map['title'] ?? '',
      rank: (map['rank'] ?? 0) is int ? map['rank'] : int.tryParse(map['rank'].toString()) ?? 0,
      xp: (map['xp'] ?? 0) is int ? map['xp'] : int.tryParse(map['xp'].toString()) ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'title': title,
      'rank': rank,
      'xp': xp,
    };
  }

  static Future<UserData> fromFirestoreWithRank(DocumentSnapshot userDoc) async {
  final userData = userDoc.data() as Map<String, dynamic>? ?? {};
  // Hole rank-Wert aus dem user-Dokument — robust gegenüber String/int/null
  final rawRank = userData['rank'];
  final int rankValue = rawRank is int
      ? rawRank
      : (rawRank is String ? int.tryParse(rawRank) ?? 0 : 0);

  String titleFromRank = '';

  try {
    // 1) Versuch: suche nach numerischem Feld 'rank' == rankValue
    final rankQuery = await FirebaseFirestore.instance
        .collection('ranks')
        .where('rank', isEqualTo: rankValue)
        .limit(1)
        .get();

    if (rankQuery.docs.isNotEmpty) {
      final r = rankQuery.docs.first.data();
      titleFromRank = (r['title'] ?? r['titel'] ?? '').toString();
    } else {
      // 2) Fallback: versuche, direkt das Dokument mit der id == rankValue (falls du so gespeicherst)
      final maybeDoc = await FirebaseFirestore.instance
          .collection('ranks')
          .doc(rankValue.toString())
          .get();
      if (maybeDoc.exists) {
        final r = maybeDoc.data() as Map<String, dynamic>;
        titleFromRank = (r['title'] ?? r['titel'] ?? '').toString();
      }
    }
  } catch (e) {
    // Logging für Debugging
    if (kDebugMode) {
      print('Fehler beim Laden des Ranks: $e');
    }
  }

  // Falls kein Titel aus ranks gefunden wurde, verwende ggf. den title im userDoc
  if (titleFromRank.isEmpty) {
    titleFromRank = (userData['title'] ?? '').toString();
  }

  return UserData(
    uid: userDoc.id,
    firstName: (userData['firstName'] ?? '').toString(),
    lastName: (userData['lastName'] ?? '').toString(),
    email: (userData['email'] ?? '').toString(),
    title: titleFromRank,
    rank: rankValue,
    xp: userData['xp'] is int
        ? userData['xp'] as int
        : int.tryParse((userData['xp'] ?? '0').toString()) ?? 0,
  );
}
}
