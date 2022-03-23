import 'package:bot_toast/bot_toast.dart';

class XSnackBar {
  // TODO: remove late key workd
  static CancelFunc? cancel;

  static show({required String msg}) => BotToast.showText(text: msg);
  // TODO: tránh việc showloading quá nhiều.
  static showLoading() => cancel = BotToast.showLoading();

  // TODO: check isShowLoading before cancel
  static hideLoading() {
    (cancel ?? () {})();
  }
}
