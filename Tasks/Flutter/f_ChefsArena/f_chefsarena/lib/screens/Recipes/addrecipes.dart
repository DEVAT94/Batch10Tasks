import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/features/cappbar.dart';
import 'package:f_chefsarena/features/celevatedbutton.dart';
import 'package:f_chefsarena/features/recipetext.dart';
import 'package:f_chefsarena/theme/theme.dart';
import 'package:flutter/material.dart';

class AddRecipes extends StatelessWidget {
  const AddRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(text: 'Speicher dein Rezept'),
        body: CustomBoxDeco(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: [
                      RecipeText(
                        labelText: 'Rezept Name',
                        style: AppTheme.textTheme.bodySmall,
                        suffixIcon: Icon(
                          Icons.cancel_outlined,
                          color: AppTheme.cancel,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      SizedBox(height: 32),
                      SizedBox(
                        height: 600,
                        child: RecipeText(
                          labelText: 'Zutaten und Zubereitung',
                          style: AppTheme.textTheme.bodySmall,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.top,
                          expands: true,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                      SizedBox(height: 32),
                      CustomElevatedButton(
                        text: 'Speichern',
                        textStyle: AppTheme.textTheme.bodySmall,
                        backgroundColor: AppTheme.primaryColor,
                        width: 140,
                        elevation: WidgetStatePropertyAll(4),
                        onPressed: () {
                          //Foto importieren und speichern
                        },
                      ),
                    ],
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
