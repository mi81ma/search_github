import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github/main.dart';

class SearchTextField extends ConsumerStatefulWidget {
  const SearchTextField({
    Key? key,
    this.onFocusChange,
    this.focusNode,
    this.onCancel,
    this.inputDecoration,
    this.isAutoFocus,
  }) : super(key: key);

  final void Function(bool hasFocus)? onFocusChange;
  final FocusNode? focusNode;
  final VoidCallback? onCancel;
  final InputDecoration? inputDecoration;
  final bool? isAutoFocus;

  @override
  ConsumerState<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends ConsumerState<SearchTextField> {
  FocusNode _focusNode = FocusNode();
  bool _isAutoFocus = false;

  @override
  void initState() {
    super.initState();
    _isAutoFocus = widget.isAutoFocus ?? false;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      if (widget.onFocusChange != null) {
        widget.onFocusChange!(_focusNode.hasFocus);
      }
    });
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        log('Focused on text field');
      } else {
        log('Out of focus from text field');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        // Hero(
        //   tag: "search",
        //   child: Material(
        //     type: MaterialType.transparency,
        //     child:
        Row(
      children: [
        Expanded(
            child: TextField(
                autofocus: _isAutoFocus,
                textInputAction: TextInputAction.search,
                key: const Key('secondTextField'),
                style: const TextStyle(color: Colors.black),
                focusNode: _focusNode,
                decoration: InputDecoration(
                    hintText: L10n.of(context) != null
                        ? L10n.of(context)!.search
                        : "Search Github",
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black38,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1))))),
        if (widget.onCancel != null)
          GestureDetector(
            key: const Key('cancelFocus'),
            onTap: widget.onCancel,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                L10n.of(context) != null ? L10n.of(context)!.cancel : "Cancel",
              ),
            ),
          )
      ],
    );
    //   ),
    // );
  }
}
