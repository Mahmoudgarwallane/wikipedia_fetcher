import 'dart:io';

class LaunchUrl {
  static void launchUrl(String url) {
    switch (Platform.operatingSystem) {
      case "linux":
        Process.run("x-www-browser", [url]);
        break;
      case "macos":
        Process.run("open", [url]);
        break;
      case "windows":
        Process.run("explorer", [url]);
        break;
      default:
        print("cannot launch url on this device");
        break;
    }
  }
}

// "linux" "macos" "windows"