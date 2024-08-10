import 'package:get_storage/get_storage.dart';
import 'package:sportat/core/models/user_model.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/view/splash/view.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class AppStorage {
  static final GetStorage _box = GetStorage();

  static Future<void> init() async => await GetStorage.init();

  static UserModel? get registerOneInfo {
    UserModel? profileModel;
    if (_box.hasData('user')) {
      profileModel = UserModel.fromJson(_box.read('user'));
    }
    return profileModel;
  }

  static bool get isLogged =>
      getToken != null ||
      registerOneInfo != null && getRegisterOneData!.firstName != '';

  ///for register one

  static Future<void> cacheRegisterOneInfo(UserModel userModel) =>
      _box.write('user', userModel.toJson());

  static int? get getRegisterOneId => registerOneInfo?.data.user.id;

  static String? get getToken => registerOneInfo?.data.token;

  static User? get getRegisterOneData => registerOneInfo?.data.user;

  static Future<void> cacheGuestToken(token) => _box.write('guestToken', token);
  static Future<void> cacheUserImage(image) => _box.write('image', image);

  static bool get isGuestLogged => _box.read('guestToken') != null;

  static String? get getGuestToken => _box.read('guestToken');
  static String? get getUserImage => _box.read('image');

  static Future<void> signOut() async {
    await _box.erase();
    MagicRouter.navigateAndPopAll(const SplashView());
  }

  static Future<void>? launchURL(url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
