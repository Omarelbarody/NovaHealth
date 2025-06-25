import 'package:flutter/material.dart';

class FormattedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;

  const FormattedText({
    Key? key,
    required this.text,
    this.style,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = style ?? DefaultTextStyle.of(context).style;
    
    // Parse the text and create spans
    final List<InlineSpan> spans = _parseFormattedText(text, defaultStyle);
    
    return RichText(
      text: TextSpan(
        children: spans,
        style: defaultStyle,
      ),
      textAlign: textAlign,
    );
  }
  
  List<InlineSpan> _parseFormattedText(String text, TextStyle baseStyle) {
    List<InlineSpan> spans = [];
    
    // Pattern to match both bold and italic tags
    final RegExp tagPattern = RegExp(r'<(b|i)>(.*?)</\1>');
    
    // Current position in the text
    int currentPosition = 0;
    
    // Find all matches
    final matches = tagPattern.allMatches(text);
    
    for (final match in matches) {
      // Add text before the tag
      if (match.start > currentPosition) {
        spans.add(TextSpan(
          text: text.substring(currentPosition, match.start),
          style: baseStyle,
        ));
      }
      
      // Get the tag type (b or i) and content
      final tagType = match.group(1);
      final content = match.group(2);
      
      if (content != null) {
        // Apply appropriate style based on tag type
        if (tagType == 'b') {
          spans.add(TextSpan(
            text: content,
            style: baseStyle.copyWith(fontWeight: FontWeight.bold),
          ));
        } else if (tagType == 'i') {
          spans.add(TextSpan(
            text: content,
            style: baseStyle.copyWith(fontStyle: FontStyle.italic),
          ));
        }
      }
      
      // Update current position
      currentPosition = match.end;
    }
    
    // Add remaining text after the last tag
    if (currentPosition < text.length) {
      spans.add(TextSpan(
        text: text.substring(currentPosition),
        style: baseStyle,
      ));
    }
    
    // Handle nested formatting recursively
    List<InlineSpan> processedSpans = [];
    for (final span in spans) {
      if (span is TextSpan && span.text != null) {
        // Check if this span contains any formatting tags
        if (span.text!.contains('<b>') || span.text!.contains('<i>')) {
          // Process nested formatting
          processedSpans.addAll(_parseFormattedText(span.text!, span.style ?? baseStyle));
        } else {
          processedSpans.add(span);
        }
      } else {
        processedSpans.add(span);
      }
    }
    
    return processedSpans;
  }
} 