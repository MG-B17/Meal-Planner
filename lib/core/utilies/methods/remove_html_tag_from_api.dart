String removeHtmlTags(String textWithTags) {
  // Regular expression to match <b>...</b> and <a href="...">...</a> tags
  final boldTagRegex = RegExp(r'<b>(.*?)</b>');
  final anchorTagRegex = RegExp(r'<a\s+href="[^"]*">(.*?)<\/a>');

  // Remove bold tags
  String textWithoutBold = textWithTags.replaceAllMapped(
    boldTagRegex,
        (match) => match.group(1) ?? '', // Replace with the content inside <b>
  );

  // Remove anchor tags
  String finalText = textWithoutBold.replaceAllMapped(
    anchorTagRegex,
        (match) => match.group(1) ?? '', // Replace with the content inside <a>
  );

  return finalText;
}


String removeHtmlAndNutrition(String textWithTags) {
  // Regular expression to match <b>...</b> tags
  final boldTagRegex = RegExp(r'<b>(.*?)</b>');

  // Regular expression to match <a href="...">...</a> tags
  final anchorTagRegex = RegExp(r'<a\s+href="[^"]*">(.*?)<\/a>');

  // Regular expression to match nutrition information
  final nutritionRegex = RegExp(
    r'(One portion of this dish contains about\s+\d+g\s+of\s+protein,\s*\d+g\s+of\s+fat,\s+and\s+a\s+total\s+of\s+\d+\s+calories\.)',
  );

  // Remove bold tags
  String textWithoutBold = textWithTags.replaceAllMapped(
    boldTagRegex,
        (match) => match.group(1) ?? '',
  );

  // Remove anchor tags
  String textWithoutLinks = textWithoutBold.replaceAllMapped(
    anchorTagRegex,
        (match) => match.group(1) ?? '',
  );

  // Remove nutrition information
  String summaryText = textWithoutLinks.replaceAll(nutritionRegex, '');

  // Trim any leading/trailing whitespace that might result from the removal
  return summaryText.trim();
}