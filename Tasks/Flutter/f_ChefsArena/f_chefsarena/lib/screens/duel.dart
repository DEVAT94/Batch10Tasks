import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/features/cappbar.dart';
import 'package:f_chefsarena/features/celevatedbutton.dart';
import 'package:f_chefsarena/features/customcards.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/material.dart';

class DuelMode extends StatelessWidget {
  const DuelMode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(text: 'Zeit für ein Duell!'),
        body: CustomBoxDeco(
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: CustomCard(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    description: 'Duell starten?',
                    subTextDescription: '',
                    fontSize: 32,
                    descriptionColor: AppTheme.headlineColor,
                    child: Column(
                      children: [
                        CustomElevatedButton(
                          text: 'Let´s cook',
                          icon: ImageIcon(
                            AssetImage('assets/icons/kuchengerate.png'),
                            size: 32,
                          ),
                          textStyle: AppTheme.textTheme.bodyMedium,
                          backgroundColor: AppTheme.primaryColor,
                          elevation: WidgetStatePropertyAll(8),
                          iconColor: WidgetStatePropertyAll(AppTheme.textColor),
                        ),
                        SizedBox(height: 60),
                        Text(
                          'Ihr habt 4 Stunden Zeit!',
                          style: AppTheme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
