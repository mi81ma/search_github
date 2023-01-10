import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github/main.dart';
import 'package:search_github/view_model/searching_page_view_model.dart';
import 'package:search_github/widget/search_result_list_item.dart';
import 'package:search_github/widget/search_text_field.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:search_github/widget/size_config.dart';

class SearchingPageView extends ConsumerStatefulWidget {
  const SearchingPageView({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchingPageView> createState() => _SearchingPageViewState();
}

class _SearchingPageViewState extends ConsumerState<SearchingPageView> {
  late final SearchingPageViewModel _vm;
  final _focusNode = FocusNode();
  // The message to display.
  String? _message;
// Handles the key events from the Focus widget and updates the
// _message.
  KeyEventResult _handleKeyEvent(FocusNode node, RawKeyEvent event) {
    setState(() {
      if (event.logicalKey == LogicalKeyboardKey.keyQ) {
        _message = 'Pressed the "Q" key!';
      } else {
        if (kReleaseMode) {
          _message =
              'Not a Q: Pressed 0x${event.logicalKey.keyId.toRadixString(16)}';
          print(_message);
        } else {
          // As the name implies, the debugName will only print useful
          // information in debug mode.
          _message = 'Not a Q: Pressed ${event.logicalKey.debugName}';
          print(_message);
        }
      }
    });
    return event.logicalKey == LogicalKeyboardKey.keyQ
        ? KeyEventResult.handled
        : KeyEventResult.ignored;
  }

  @override
  void initState() {
    super.initState();
    _vm = SearchingPageViewModel();
    _vm.setRef(ref);
    _vm.init();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              Focus(
                onKey: _handleKeyEvent,
                child: AnimatedBuilder(
                  animation: _focusNode,
                  builder: (BuildContext context, Widget? child) {
                    return SearchTextField(
                      textEditingController: _vm.searchWordEditingController,
                      onEditingComplete: () {
                        print("onEditingComplete");
                        FocusScope.of(context).unfocus();
                        _vm.onEditingComplete;
                      },
                      isAutoFocus: true,
                      onCancel: () {
                        FocusScope.of(context).unfocus();
                        _vm.onTapCancel();
                      },
                      inputDecoration: InputDecoration(
                          focusColor: null,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 1))),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
