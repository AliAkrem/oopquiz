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
        text: formatJavaCode(widget.text) , // Initial code
        language: java,
        readOnly: true
        
        );
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

    
  }

  void refresh() {
    if (mounted) setState(() {});
  }


  String formatJavaCode(String code) {
  // Normalize line endings
  code = code.replaceAll('\r\n', '\n');

  // Split code into lines
  List<String> lines = code.split('\n');

  // Prepare for formatted code
  List<String> formattedLines = [];
  int indentLevel = 0;
  const String indent = '  '; // Two spaces for indentation

  for (String line in lines) {
    line = line.trim(); // Remove leading/trailing whitespaces

    // Check if the line closes a block (e.g., a closing brace)
    if (line.startsWith('}')) {
      indentLevel--;
    }

    // Add the indented line to the formatted lines
    formattedLines.add('${indent * indentLevel}$line');

    // Check if the line opens a new block (e.g., an opening brace)
    if (line.endsWith('{')) {
      indentLevel++;
    }
  }

  // Join the formatted lines into a single string
  return formattedLines.join('\n');
}

}
