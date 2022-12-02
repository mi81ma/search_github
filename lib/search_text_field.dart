import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField(
      {Key? key,
      this.onFocusChange,
      this.focus,
      this.onCancel,
      this.inputDecoration})
      : super(key: key);

  final void Function(bool hasFocus)? onFocusChange;
  final FocusNode? focus;
  final VoidCallback? onCancel;
  final InputDecoration? inputDecoration;

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  FocusNode _focus = new FocusNode();

  @override
  void initState() {
    super.initState();
    _focus = widget.focus ?? new FocusNode();
    _focus.addListener(() {
      if (widget.onFocusChange != null) {
        widget.onFocusChange!(_focus.hasFocus);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "search",
      child: Material(
        type: MaterialType.transparency,
        child: Row(
          children: [
            Expanded(
                child: TextField(
                    style: const TextStyle(color: Colors.red),
                    focusNode: _focus,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        // suffixIcon: Text("Cancel"),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 1))))),
            if (widget.onCancel != null)
              GestureDetector(
                onTap: widget.onCancel,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Cancel"),
                ),
              )
          ],
        ),
      ),
    );
  }
}
