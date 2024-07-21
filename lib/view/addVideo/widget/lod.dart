
import 'package:flutter/cupertino.dart';
import 'package:sportat/core/router/router.dart';
import 'package:sportat/widgets/loading_indicator.dart';


class LoadingDialog {

  static bool isLoadingDialogEnabled = false;

  static showLoadingDialog(){
    isLoadingDialogEnabled = true;
    showCupertinoDialog(
      context: MagicRouter.currentContext,
      barrierDismissible: false,
      builder: (context) => const CupertinoAlertDialog(content: LoadingIndicator(),),
    );
  }

  static hideLoadingDialog({Function? onHide})  {
    if(!isLoadingDialogEnabled) return;
    isLoadingDialogEnabled = false;
    MagicRouter.pop();
    if(onHide != null)  onHide();
  }
}