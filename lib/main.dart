import 'dart:async';

import 'package:bugs_report/bug_report_overlay.dart';
import 'package:bugs_report/floating_bug_report_provider.dart';
import 'package:bugs_report/sentry_reporter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await SentryReporter.setup(MyApp());
}

class MyApp extends StatelessWidget with ChangeNotifier {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BugReportOverlay(key: key);
  }
}
