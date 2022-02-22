import 'package:bot_toast/bot_toast.dart';

class XSnackBar {
  static show({required String msg}) => BotToast.showText(text: msg);

  // TODO:
  static showLoading() =>
      BotToast.showLoading(duration: const Duration(seconds: 2));
  // TODO:
  // static hideLoading
}
