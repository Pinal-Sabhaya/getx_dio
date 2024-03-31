import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


double calculateResponsiveFontSize(BuildContext context, double baseFontSize) {
  // Reference screen size (iPhone X)
  const double referenceScreenWidth = 375.0;
  const double referenceScreenHeight = 812.0;

  // Calculate scaling factors
  double widthScaleFactor =
      MediaQuery.of(Get.context!).size.width / referenceScreenWidth;
  double heightScaleFactor =
      MediaQuery.of(Get.context!).size.height / referenceScreenHeight;

  // Choose the smaller scaling factor to ensure that the text fits on the screen
  double scaleFactor = widthScaleFactor < heightScaleFactor
      ? widthScaleFactor
      : heightScaleFactor;

  // Calculate font size based on the reference font size and the chosen scaling factor
  double fontSize = baseFontSize * scaleFactor;

  // print("fontsize==> $fontSize");

  return fontSize;
}
/*

void snackBarSuccess(
  BuildContext context,
  String message, {
  BoxDecoration? iconWithDecoration,
  Icon? icon,
}) {
  AnimationController? localAnimationController;

  mySnackbar(
    animationDuration: const Duration(milliseconds: 1000),
    reverseAnimationDuration: const Duration(milliseconds: 350),
    displayDuration: const Duration(milliseconds: 2000),
    onAnimationControllerInit: (controller) =>
        localAnimationController = controller,
    dismissType: DismissType.onSwipe,
    dismissDirection: [
      DismissDirection.horizontal,
      DismissDirection.vertical,
      DismissDirection.endToStart,
      DismissDirection.up,
      DismissDirection.startToEnd
    ],
    Overlay.of(context),
    AwesomeTopSnackbar(
      onCloseClick: () {
        localAnimationController?.reverse();
      },
      icon: icon,
      iconWithDecoration: iconWithDecoration,
      message: message,
      textStyle: FontConstants.plusBold.copyWith(
          color: colorWhite,
          fontSize: calculateResponsiveFontSize(context, font_15)),
      backgroundColor: primaryColor,
    ),
  );
}

void snackBarError(
  BuildContext context,
  String message, {
  BoxDecoration? iconWithDecoration,
  Icon? icon,
}) {
  AnimationController? localAnimationController;

  mySnackbar(
    animationDuration: const Duration(milliseconds: 1000),
    reverseAnimationDuration: const Duration(milliseconds: 350),
    displayDuration: const Duration(milliseconds: 2000),
    onAnimationControllerInit: (controller) =>
        localAnimationController = controller,
    dismissType: DismissType.onSwipe,
    dismissDirection: [
      DismissDirection.horizontal,
      DismissDirection.vertical,
      DismissDirection.endToStart,
      DismissDirection.up,
      DismissDirection.startToEnd
    ],
    Overlay.of(context),
    AwesomeTopSnackbar(
      onCloseClick: () {
        localAnimationController?.reverse();
      },
      icon: icon,
      iconWithDecoration: iconWithDecoration,
      message: message,
      textStyle: FontConstants.plusBold.copyWith(
          color: colorWhite,
          fontSize: calculateResponsiveFontSize(context, font_15)),
      backgroundColor: colorDarkRed,
    ),
  );
}
*/

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}

String formatDate(DateTime inputDate) {
  // Define output date format
  final outputFormat = DateFormat('dd MMMM yyyy');

  try {
    // Format the input DateTime object to the desired output format
    return outputFormat.format(inputDate);
  } catch (e) {
    // Return original input if there's an error
    return inputDate.toString();
  }
}

String extractFileName(String filePath) {
  List<String> pathParts = filePath.split('/');
  return pathParts.last;
}

/*launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

launchEmail(String email) async {
  Uri mail = Uri.parse("mailto:$email");
  // Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
  if (await launchUrl(mail)) {
    print("email app is opened");
  } else {
    print("email app is not opened");
  }
}*/

String formatTime(String timeString) {
  // Split the time string into hours, minutes, and seconds
  List<String> parts = timeString.split(':');

  // Ensure there are exactly three parts (hours, minutes, seconds)
  if (parts.length != 3) {
    return "";
  }

  try {
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    // Convert 24-hour format to 12-hour format
    String period = hours < 12 ? 'AM' : 'PM';
    hours = hours % 12;
    if (hours == 0) {
      hours = 12; // 12 AM/PM should be displayed as 12
    }
    // Construct the formatted time string
    return '$hours:${parts[1]} $period'; // Output: 11:11 AM
  } catch (e) {
    return "";
  }
}

String formatTimeReturn(String timeString) {
  // Split the time string into hours, minutes, and period (AM/PM)
  List<String> parts = timeString.split(' ');

  // Ensure there are exactly two parts (time and period)
  if (parts.length != 2) {
    return "";
  }

  // Split the time part into hours and minutes
  List<String> timeParts = parts[0].split(':');

  // Ensure there are exactly two parts (hours and minutes)
  if (timeParts.length != 2) {
    return "";
  }

  try {
    int hours = int.parse(timeParts[0]);
    int minutes = int.parse(timeParts[1]);

    // If the period is PM and hours are less than 12, convert hours to 24-hour format
    if (parts[1] == 'PM' && hours < 12) {
      hours += 12;
    }

    // Construct the formatted time string with seconds
    return '$hours:${timeParts[1]}:00'; // Output: 11:11:00
  } catch (e) {
    return "";
  }
}

