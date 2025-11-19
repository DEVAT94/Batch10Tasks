// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/features/cappbar.dart';
import 'package:f_chefsarena/features/celevatedbutton.dart';
import 'package:f_chefsarena/features/friendlist.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  final currentUser = FirebaseAuth.instance.currentUser;

  List<Map<String, dynamic>> friends = [
    {
      'name': 'Andreas',
      'rang': 'Hobbykoch',
      'imagePath': 'assets/images/Andreas.png',
    },
    {'name': 'Anna', 'rang': 'Koch', 'imagePath': 'assets/images/Anna.png'},
    {'name': 'Anton', 'rang': 'Koch', 'imagePath': 'assets/images/Anton.png'},
    {'name': 'Jens', 'rang': 'Koch', 'imagePath': 'assets/images/Jens.png'},
    {
      'name': 'Jonas',
      'rang': 'Chef de Cuisine',
      'imagePath': 'assets/images/Jonas.png',
    },
    {'name': 'Lisa', 'rang': 'Koch', 'imagePath': 'assets/images/Lisa.png'},
    {
      'name': 'Markus',
      'rang': 'Entremetier',
      'imagePath': 'assets/images/Markus.png',
    },
    {
      'name': 'Nico',
      'rang': 'Tellerwäscher',
      'imagePath': 'assets/images/Nico.png',
    },
    {
      'name': 'Nicole',
      'rang': 'Tellerwäscher',
      'imagePath': 'assets/images/Nicole.png',
    },
    {'name': 'Nina', 'rang': 'Koch', 'imagePath': 'assets/images/Nina.png'},
    {
      'name': 'Richard',
      'rang': 'Hobbykoch',
      'imagePath': 'assets/images/Richard.png',
    },
    {'name': 'Senaid', 'rang': 'Koch', 'imagePath': 'assets/images/Senaid.png'},
  ];

  @override
  void initState() {
    super.initState();
    _loadFriendsFromFirestore();
  }

  Future<void> _loadFriendsFromFirestore() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('friends')
        .get();

    final List<Map<String, dynamic>> loadedFriends = snapshot.docs.map((doc) {
      return {
        'name': doc['name'],
        'rang': doc['rang'],
        'imagePath': doc['imagePath'],
      };
    }).toList();

    setState(() {
      friends.addAll(loadedFriends);
    });
  }

  Future<void> _addFriendByEmail(String email) async {
    try {
      final query = await FirebaseFirestore.instance
          .collection('user')
          .where('email', isEqualTo: email)
          .get();

      if (query.docs.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Kein Benutzer mit dieser E-Mail gefunden."),
          ),
        );
        return;
      }

      final userDoc = query.docs.first;
      final data = userDoc.data();

      if (currentUser != null && data['email'] == currentUser!.email) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Du kannst dich nicht selbst hinzufügen."),
          ),
        );
        return;
      }

      final fullName = "${data['firstName']} ${data['lastName']}";
      final rang = data['title'];

      final imagePath = data.containsKey('imagePath')
          ? data['imagePath']
          : 'assets/images/default.png';

      await FirebaseFirestore.instance.collection('friends').add({
        'name': fullName,
        'rang': rang,
        'imagePath': imagePath,
        'email': data['email'],
        'uid': userDoc.id,
      });

      setState(() {
        friends.add({'name': fullName, 'rang': rang, 'imagePath': imagePath});
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("$fullName wurde hinzugefügt!")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Fehler: $e")));
    }
  }

  void _openAddFriendDialog() {
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Freund hinzufügen"),
          content: TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: "E-Mail des Freundes",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Abbrechen"),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: const Text("Hinzufügen"),
              onPressed: () async {
                final email = emailController.text.trim();
                Navigator.pop(context);
                await _addFriendByEmail(email);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(text: 'Freunde'),
        body: CustomBoxDeco(
          child: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: friends.map((f) {
                            return FriendList(
                              name: f['name'],
                              rang: f['rang'],
                              imagePath: f['imagePath'],
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: CustomElevatedButton(
                    onPressed: () => _openAddFriendDialog(),
                    icon: const Icon(Icons.add),
                    text: 'Add',
                    textStyle: TextStyle(
                      color: AppTheme.headlineColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    iconColor: const WidgetStatePropertyAll(Colors.white),
                    iconSize: const WidgetStatePropertyAll(32),
                    backgroundColor: AppTheme.primaryColor,
                    width: 120,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
