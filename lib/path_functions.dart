import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

saveToFolder() async {
  Directory? directory;
  try {
    if (Platform.isAndroid) {
      if (await _requestPermission(Permission.storage)) {
        directory = await getExternalStorageDirectory();
        print(directory);
        String newPath = "";

        List<String> paths = directory!.path.split("/");
        for (int x = 1; x < paths.length; x++) {
          String folder = paths[x];
          if (folder != "Android") {
            newPath += "/" + folder;
          } else {
            break;
          }
        }
        newPath = newPath + "/Pictures";
        directory = Directory(newPath);
        //print(directory);
        print(newPath);

        return newPath;
      } else {
        return false;
      }
    }

    if (!await directory!.exists()) {
      await directory.create(recursive: true);
    }

    if (await directory.exists()) {
      File saveFile = File(directory.path + "/counter.txt");
    }
  } catch (e) {
    print(e);
  }
}

Future<bool> _requestPermission(Permission permission) async {
  if (await permission.isGranted) {
    return true;
  } else {
    var result = await permission.request();
    if (result == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }
}

