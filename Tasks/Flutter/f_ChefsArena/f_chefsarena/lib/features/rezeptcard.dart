import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/material.dart';

class RezeptCard extends StatelessWidget {
  final String profilBild;
  final String name;
  final String kategorie;
  final String gerichtBild;
  final List<String> zutaten;

  const RezeptCard({
    super.key,
    required this.profilBild,
    required this.name,
    required this.kategorie,
    required this.gerichtBild,
    required this.zutaten,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.regularCardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.regularCardColor,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(profilBild),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: AppTheme.headlineColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Kategorie: $kategorie',
                        style: const TextStyle(
                          color: AppTheme.headlineColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.more_vert, color: AppTheme.headlineColor),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              gerichtBild,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
          ),
          if (zutaten.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Zutaten für 2 Personen:',
                style: const TextStyle(color: AppTheme.headlineColor),
              ),
            ),
          if (zutaten.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: zutaten
                    .map(
                      (zutat) => Text(
                        '• $zutat',
                        style: const TextStyle(color: AppTheme.headlineColor),
                      ),
                    )
                    .toList(),
              ),
            ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}