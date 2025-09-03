import 'package:f_chefsarena/features/boxdecoration.dart';
import 'package:f_chefsarena/features/cappbar.dart';
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
                      RecipeText(labelText: 'Rezept Name', prefixIcon: Icon(Icons.close_rounded, color: AppTheme.cancel)),
                      SizedBox(height: 32),
                      SizedBox(
                        height: 600,
                        child: RecipeText(
                          labelText: 'Zutaten und Zubereitung',
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.top,
                          expands: true,
                        ),
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

class RecipeText extends StatelessWidget {
  final String labelText;
  final Widget? prefixIcon;
  final int? minLines;
  final int? maxLines;
  final bool expands;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;

  const RecipeText({
    super.key,
    required this.labelText,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.prefixIcon,
    this.minLines,
    this.maxLines,
    this.expands = false, 
    
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: minLines,
      maxLines: maxLines,
      expands: expands,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTheme.textTheme.bodyMedium,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon:
            prefixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.headlineColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.headlineColor, width: 2),
        ),
        border: OutlineInputBorder(),
      ),
    );
  }
}
