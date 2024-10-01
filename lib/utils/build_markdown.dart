import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:oopquiz/shared/code_wrapper.dart';
import 'package:oopquiz/shared/shared.dart';

Widget buildMarkdown(BuildContext context, String data) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final config =
      isDark ? MarkdownConfig.darkConfig : MarkdownConfig.defaultConfig;

  codeWrapper(child, text, language) => CodeWrapperWidget(
        child,
        text,
        language,
      );

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: MarkdownWidget(
        data: data,
        config: config.copy(configs: [
          isDark
              ? PreConfig.darkConfig.copy(
                  wrapper: codeWrapper,
                )
              : const PreConfig().copy(wrapper: codeWrapper)
        ])),
  );
}
