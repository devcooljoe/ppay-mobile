/// String utility extensions for formatting text.
extension StringExtensions on String {
  /// Returns true if the string is not null and not empty after trimming.
  bool get isNotNullOrEmpty => trim().isNotEmpty;

  /// Converts a string to Title Case (first letter of each word capitalized).
  /// Example: "hello world" -> "Hello World"
  String toTitleCase() {
    if (isEmpty) return this;
    return split(' ')
        .map((word) {
          if (word.isEmpty) return word;
          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        })
        .join(' ');
  }

  /// Converts snake_case or camelCase to a human-readable format.
  /// Example: "phoneNumber" -> "Phone Number"
  /// Example: "phone_number" -> "Phone Number"
  String toHumanReadable() {
    if (isEmpty) return this;

    // Handle snake_case
    var result = replaceAll('_', ' ');

    // Handle camelCase by inserting spaces before uppercase letters
    result = result.replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (match) => '${match.group(1)} ${match.group(2)}',
    );

    return result.toTitleCase();
  }
}

/// Extension for nullable strings.
extension NullableStringExtensions on String? {
  /// Returns true if the string is not null and not empty after trimming.
  bool get isNotNullOrEmpty => this != null && this!.trim().isNotEmpty;
}
