import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/ocean.dart';

import 'package:highlight/languages/java.dart';

class CodeWrapperWidget extends StatefulWidget {
  final Widget child;
  final String text;
  final String language;
  const CodeWrapperWidget(this.child, this.text, this.language, {super.key});

  @override
  State<CodeWrapperWidget> createState() => _PreWrapperState();
}

class _PreWrapperState extends State<CodeWrapperWidget> {
  late Widget _switchWidget;

  bool hasCopied = false;

  late CodeController controller;

  @override
  void initState() {
    super.initState();
    _switchWidget = Icon(Icons.copy_rounded, key: UniqueKey());

    controller = CodeController(
        text: widget.text, // Initial code
        language: java,
        readOnly: true);
  }

  double fontSize = 16.0;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CodeTheme(
        data: CodeThemeData(
          styles: oceanTheme,
        ),
        child: SingleChildScrollView(
          child: CodeField(
            padding: const EdgeInsets.all(0),
            readOnly: true,
            textStyle: TextStyle(fontSize: fontSize),
            controller: controller,
          ),
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: InkWell(
                    onTap: () async {
                      if (hasCopied) return;
                      await Clipboard.setData(ClipboardData(text: widget.text));
                      _switchWidget = Icon(Icons.check, key: UniqueKey());
                      refresh();
                      Future.delayed(const Duration(seconds: 2), () {
                        hasCopied = false;
                        _switchWidget = Icon(
                          Icons.copy_rounded,
                          key: UniqueKey(),
                        );
                        refresh();
                      });
                    },
                    child: _switchWidget),
              ),
              const SizedBox(
                height: 8,
              ),
              InkWell(
                  onTap: () {
                    if (fontSize < 35) {
                      setState(() {
                        fontSize = fontSize + 1.0;
                      });
                    }
                  },
                  child: const Icon(Icons.add)),
              InkWell(
                  onTap: () {
                    if (fontSize >= 15) {
                      setState(() {
                        fontSize = fontSize - 1.0;
                      });
                    }
                  },
                  child: const Icon(Icons.remove)),
            ],
          ),
        ),
      )
    ]);

    return Stack(
      children: [
        widget.child,
      ],
    );
  }

  void refresh() {
    if (mounted) setState(() {});
  }
}
