import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github/main.dart';
import 'package:search_github/componet/search_text_field.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class SearchingPageView extends ConsumerStatefulWidget {
  const SearchingPageView({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchingPageView> createState() => _SearchingPageViewState();
}

class _SearchingPageViewState extends ConsumerState<SearchingPageView> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              SearchTextField(
                isAutoFocus: true,
                onCancel: () {
                  FocusScope.of(context).unfocus();
                  Navigator.pop(context);
                },
                inputDecoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
