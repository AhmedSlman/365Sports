import 'package:dio/dio.dart';
import 'package:sportat/const/dimensions.dart';
import 'package:sportat/core/appStorage/app_storage.dart';
import 'package:sportat/core/router/router.dart';

class DioHelper {
  static const _baseUrl = 'https://365sportat.app/api/v2/';
  static Dio dioSingleton = Dio()..options.baseUrl = _baseUrl;

  static Future<Response<dynamic>> post(String path, bool isAuh,
      {FormData? formData,
      Map<String, dynamic>? body,
      Function(int, int)? onSendProgress}) {
    dioSingleton.options.headers = isAuh
        ? {
            'Authorization':
                'Bearer ${AppStorage.isGuestLogged ? AppStorage.getGuestToken : AppStorage.getToken}',
            'Accept-Language': isEn(MagicRouter.currentContext) ? 'en' : 'ar'
          }
        : {'Accept-Language': isEn(MagicRouter.currentContext) ? 'en' : 'ar'};
    print(dioSingleton.options.headers);
    final response = dioSingleton.post(
      path,
      data: formData ?? FormData.fromMap(body!),
      onSendProgress: onSendProgress,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    dioSingleton.options.headers = null;
    return response;
  }

  static Future<Response<dynamic>>? get(String path) {
    if (AppStorage.isLogged ||
        AppStorage.isGuestLogged ||
        !AppStorage.isLogged ||
        !AppStorage.isLogged) {
      dioSingleton.options.headers = {
        'Authorization':
            'Bearer ${AppStorage.isGuestLogged ? AppStorage.getGuestToken : AppStorage.getToken}',
        'Accept-Language': isEn(MagicRouter.currentContext) ? 'en' : 'ar'
      };
    }
    final response = dioSingleton.get(path);
    dioSingleton.options.headers = null;
    return response;
  }
}


// static Future<void>? launchURL( url) async {
//    if (!await launch(url)) throw 'Could not launch $url';
// }
