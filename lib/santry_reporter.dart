import 'package:sentry_flutter/sentry_flutter.dart';

class SantryReporter {
  Future<void> setup() async {
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
  }

  static throwError(String message, Exception exc, {stackTrace}) async {
    if (stackTrace != null) {
      Sentry.captureException(exc, stackTrace: stackTrace);
    }
  }
}
