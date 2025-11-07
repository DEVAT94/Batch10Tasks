import 'dart:async';
import 'dart:ui';
import 'package:f_chefsarena/screens/duel/rating.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/material.dart';

void showCountdownDialog(BuildContext context, int durationMinutes, int round) {
  int remainingSeconds = durationMinutes * 60;
  Timer? timer;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          timer ??= Timer.periodic(const Duration(seconds: 1), (_) {
            if (remainingSeconds > 0) {
              setState(() {
                remainingSeconds--;
              });
            } else {
              timer?.cancel();
              setState(() {});
            }
          });

          String formatTime(int totalSeconds) {
            final hours = (totalSeconds ~/ 3600).toString().padLeft(2, '0');
            final minutes = ((totalSeconds % 3600) ~/ 60).toString().padLeft(
              2,
              '0',
            );
            final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
            return "$hours:$minutes:$seconds";
          }

          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
              title: Text(
                round == 1
                    ? 'Spieler 1 startet.\nDu hast zwei Stunden Zeit!'
                    : 'Spieler 2 ist dran.\nDu hast zwei Stunden Zeit!',
                textAlign: TextAlign.center,
                style: AppTheme.textTheme.bodyMedium,
              ),
              content: Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.textColor,
                      blurRadius: 16,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: Text(
                  remainingSeconds > 0
                      ? "Verbleibende Zeit: ${formatTime(remainingSeconds)}"
                      : "Spieler, deine Zeit ist abgelaufen!",
                  textAlign: TextAlign.center,
                  style: AppTheme.textTheme.bodyLarge,
                ),
              ),

              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        timer?.cancel();
                        Navigator.of(context).pop();
                        if (round == 1) {
                          showCountdownDialog(context, 120, 2);
                        } else if (round == 2) {
                          showFinalDialog(context);
                        }
                      },
                      child: Text(
                        'Bin fertig!',
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: AlertDialog(
                                title: const Text('Bist du sicher?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      timer?.cancel();
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Ja'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Nein'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Abbrechen',
                        style: TextStyle(color: AppTheme.cancel, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
              backgroundColor: AppTheme.cardColor,
            ),
          );
        },
      );
    },
  ).then((_) => timer?.cancel());
}

void showFinalDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AlertDialog(
          title: Text(
            'Das Duell ist beendet.',
            textAlign: TextAlign.center,
            style: AppTheme.textTheme.bodyMedium,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all<Color>(
                      AppTheme.primaryColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RatingPlayerOne(),
                      ),
                    );
                  },
                  child: const Text('OK', style: TextStyle(fontSize: 20)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Abbrechen',
                    style: TextStyle(color: AppTheme.cancel, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
          backgroundColor: AppTheme.cardColor,
        ),
      );
    },
  );
}
