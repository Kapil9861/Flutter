// import 'package:marsenger_flavor/flavor/flavor_enum.dart';
// import 'package:package_info_plus/package_info_plus.dart';

// Future<AppConfig> getCurrentAppConfig() async {
//   PackageInfo packageInfo = await PackageInfo.fromPlatform();
//   String packageName = packageInfo.packageName;

//   if (packageName.endsWith(".dev")) {
//     return AppConfig.create(
//       appName: "DEV",
//       baseUrl: "https://dev-api.marsenger.com",
//       socketBaseUrl: devMarsengerSocket,
//       flavor: Flavor.dev,
//     );
//   } else if (packageName.endsWith(".stag")) {
//     return AppConfig.create(
//       appName: "STAGING",
//       socketBaseUrl: stagingMarsengerSocket,
//       baseUrl: "https://staging-api.marsenger.com",
//       flavor: Flavor.staging,
//     );
//   } else {
//     return AppConfig.create(
//       appName: "PROD",
//       baseUrl: "https://staging-api.marsenger.com",
//       socketBaseUrl: productionMarsengerSocket,
//       flavor: Flavor.prod,
//     );
//   }
// }
