/// Enum representing the filter options for a list.
///
/// - [latest]: Represents the latest items.
/// - [popularity]: Represents items sorted by popularity.
enum FilerList {
  latest,
  popularity,
}

/// A list of categories used in the application.
///
/// This list includes various categories for filtering or sorting items.
final List<String> categories = [
  "all",
  "business",
  "entertainment",
  "general",
  "health",
  "science",
  "sports",
  "technology",
];

/// Capitalizes the first letter of the given [text].
///
/// If the [text] is empty, it returns the original [text] without modification.
///
/// [text]: The input string to be capitalized.
///
/// Returns: The capitalized string.
String capitalize(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}

/// Truncates the given [text] to a specified [cutoff] length and adds an ellipsis.
///
/// If the length of [text] is less than or equal to [cutoff], it returns the original
/// [text] without modification.
///
/// [text]: The input string to be truncated.
/// [cutoff]: The maximum length of the string before truncation.
///
/// Returns: The truncated string with an ellipsis if necessary.
String truncateWithEllipsis(String text, int cutoff) {
  if (text.length <= cutoff) {
    return text;
  } else {
    return '${text.substring(0, cutoff)}...';
  }
}

/// Calculates the time elapsed since the given [publishedAt] timestamp.
///
/// The [publishedAt] timestamp should be in ISO 8601 format. The function returns
/// a human-readable string representing the time elapsed, such as "5s ago", "3m ago",
/// or "2d ago".
///
/// [publishedAt]: The timestamp of the publication in ISO 8601 format.
///
/// Returns: A string representing the time elapsed since the publication.
String calculateTimeAgo(String publishedAt) {
  if (publishedAt.contains("ago")) {
    return publishedAt;
  } else {
    final dateTime = DateTime.parse(publishedAt);
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}
