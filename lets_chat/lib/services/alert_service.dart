import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_chat/services/navigation_service.dart';

class AlertService {
  final GetIt _getIt = GetIt.instance;
  late NavigationService _navigationService;
  AlertService() {
    _navigationService = _getIt.get<NavigationService>();
  }
  void showAlert({
    required String text,
    IconData icon = Icons.info,
    Color textColor = Colors.black,
    Color iconColor = Colors.black,
  }) {
    try {
      DelightToastBar(
          autoDismiss: true,
          position: DelightSnackbarPosition.top,
          builder: (context) {
            return ToastCard(
              leading: Icon(
                icon,
                size: 28,
                color: iconColor,
              ),
              title: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: textColor,
                ),
              ),
            );
          }).show(_navigationService.navigatorKey.currentContext!);
    } catch (e) {
      print(e);
    }
  }
}
