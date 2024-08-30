import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

final deviceInfo = DeviceInfoPlugin();

/// Enum representing the filter options for a list.
///
/// - [latest]: Represents the latest items.
/// - [popularity]: Represents items sorted by popularity.
enum FilerList {
  latest,
  popularity,
}

/// Displays a [SnackBar] with the given [message] in the provided [context].
///
/// This function hides any currently visible [SnackBar] and then shows a new
/// [SnackBar] with the specified message and a duration of 2 seconds.
///
/// [context]: The [BuildContext] in which the [SnackBar] is to be displayed.
/// [message]: The message to be shown in the [SnackBar].
void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(
        seconds: 2,
      ),
    ),
  );
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

///Checks if the current device is an emulator or the real physical device
///Returns: emulator infor if the current device is an emulator and false if it is the real physical
Future<bool> isEmulator() async {
  if (Platform.isAndroid) {
    final androidInfo = await deviceInfo.androidInfo;
    // Android Emulator identifiers
    return androidInfo.isPhysicalDevice == false ||
        androidInfo.model.contains('google_sdk') ||
        androidInfo.model.contains('sdk_gphone');
  } else if (Platform.isIOS) {
    final iosInfo = await deviceInfo.iosInfo;
    // iOS Simulator identifiers
    return iosInfo.isPhysicalDevice == false;
  }
  return false;
}

Future<String> deviceData() async {
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return '${androidInfo.manufacturer} ${androidInfo.model}'; // Example: Samsung Galaxy S21
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return '${iosInfo.name} ${iosInfo.model}'; // Example: iPhone 13 Pro
  } else if (Platform.isWindows) {
    WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
    return windowsInfo.computerName; // Example: DESKTOP-XXXXX
  } else if (Platform.isMacOS) {
    MacOsDeviceInfo macInfo = await deviceInfo.macOsInfo;
    return macInfo.computerName; // Example: MacBook Pro
  } else if (Platform.isLinux) {
    LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
    return linuxInfo.name; // Example: Ubuntu 20.04
  } else {
    return 'Unknown device';
  }
}
