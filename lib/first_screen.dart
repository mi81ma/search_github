import 'package:flutter/material.dart';
import 'package:search_github/search_screen.dart';
import 'package:search_github/search_text_field.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Search GitHub")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              SearchTextField(
                onFocusChange: (val) async {
                  if (val) {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 300),
                            pageBuilder: (_, __, ___) => const SearchScreen()));
                  }
                },
              )
            ],
          ),
        ));
  }
}