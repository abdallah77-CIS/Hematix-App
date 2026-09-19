import 'dart:io';

/// Base URL of the existing Spring Boot backend.
class ApiConfig {
  /// إذا أردت استخدام رابط Ngrok الثابت، ضعه هنا، وإلا اتركها فارغة لاستخدام الـ LAN IP أو المحاكي
  static const String? ngrokUrl = 'https://faculty-antonym-cabbage.ngrok-free.dev';

  /// Set to your machine's actual LAN IP for physical device testing.
  static const String? manualHost = '192.168.100.35';

  static const int port = 8080;

  static String get baseUrl {
    // إذا تم توفير رابط Ngrok، سيتم اعتماده مباشرة لهاتفك الحقيقي
    if (ngrokUrl != null && ngrokUrl!.isNotEmpty) {
      return '$ngrokUrl/api';
    }

    // الطريقة السابقة للمحاكيات أو الشبكة المحلية
    String host;
    if (manualHost != null) {
      host = manualHost!;
    } else if (Platform.isAndroid) {
      host = '10.0.2.2';
    } else {
      host = 'localhost';
    }

    return 'http://$host:$port/api';
  }
}