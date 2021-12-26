import 'dart:developer';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter_downloader/flutter_downloader.dart';

class DownloadCallbackHelper {
  static void downloadCallback(
    String id,
    DownloadTaskStatus status,
    int progress,
  ) {
    if (true) {
      log(
        'task ($id) is in status ($status) and process ($progress)',
        name: 'BACKGROUND ISOLATE CALBACK',
      );
    }

    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }
}
