import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> downloadDocument(String url) async {
  await checkPermission().then((value) async {
    final dir = await getExternalStorageDirectory();
    if (dir != null) {
      final taskId = await FlutterDownloader.enqueue(
        url: url,
        savedDir: dir.absolute.path,
        fileName: 'Tap-Document.pdf',
        showNotification: true,
        saveInPublicStorage: true,
        openFileFromNotification: true,
      );
    }
  });
}

Future<bool> checkPermission() async {
  await Permission.storage.isDenied.then((value) {
    if (value) {
      Permission.storage.request();
    }
  });
  return false;
}
