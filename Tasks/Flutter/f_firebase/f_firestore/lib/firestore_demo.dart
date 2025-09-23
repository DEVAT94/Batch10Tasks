import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDemo extends StatefulWidget {
  const FirestoreDemo({super.key});

  @override
  State<FirestoreDemo> createState() => _FirestoreDemoState();
}

class _FirestoreDemoState extends State<FirestoreDemo> {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<int> countDocuments(String collection) async {
    final query = await db.collection(collection).get();
    return query.docs.length;
  }

  Future<Map<String, dynamic>?> getDocument(
    String collection,
    String docId,
  ) async {
    final doc = await db.collection(collection).doc(docId).get();

    if (!doc.exists) {
      if (kDebugMode) {
        print("Dokument $docId existiert nicht in $collection");
      }
      return null;
    }

    if (kDebugMode) {
      print("Daten: ${doc.data()}");
    }
    return doc.data();
  }

  Future<List<Map<String, dynamic>>> getAllDocuments(String collection) async {
    final query = await db.collection(collection).get();
    return query.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firestore Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                int count = await countDocuments("customer");
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Anzahl Customer: $count")),
                );
              },
              child: const Text("Zähle Dokumente in 'customer'"),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async {
                var data = await getDocument(
                  "customer",
                  "TdqP6wvXhBFvOaoF7xsZ",
                );

                if (data == null) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Customer nicht gefunden")),
                  );
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Customer: ${data['firstName']} ${data['lastName']} (ID: ${data['id']})",
                      ),
                    ),
                  );
                }
              },
              child: const Text("Hole ein Customer-Dokument"),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async {
                var allProducts = await getAllDocuments("items");
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Produkte: $allProducts")),
                );
              },
              child: const Text("Lade alle Items"),
            ),
          ],
        ),
      ),
    );
  }
}
