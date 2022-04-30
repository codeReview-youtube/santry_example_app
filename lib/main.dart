import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://b8b0ff96d4144873b882a61900094172@o444009.ingest.sentry.io/6371966';
      options.tracesSampleRate = 1.0;
      // options.environmentAttributes = {
      //   'app_version': '1.0.0',
      //   'device_name': 'My device',
      //   'device_id': '12345',
      // };
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> sendException() async {
    try {
      throw Exception('This is an exception');
    } catch (exception, stackTrace) {
      await Sentry.captureException(exception, stackTrace: stackTrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bugs report",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Bugs report"),
        ),
        body: const Center(
          child: Text('Home page'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: sendException,
          child: const Icon(Icons.bug_report),
        ),
      ),
    );
  }
}
