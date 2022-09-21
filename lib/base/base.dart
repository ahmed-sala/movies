import 'package:flutter/material.dart';
import 'package:movies_app/showLoadingUtils.dart';

abstract class BaseNavigator {
  void showLoadingDialog({String message = 'loading...'});
  void hideLoadingDialoge();
  void showMessageDialog(String message,
      {String? posActionName,
      VoidCallback? posAction,
      String? negActionName,
      VoidCallback? negAction,
      bool isCancelable = true});

}

class BaseViewModel<Nav extends BaseNavigator> extends ChangeNotifier {
  Nav? navigator;
}

abstract class BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late VM viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel.navigator = this;
  }

  VM initViewModel();
  @override
  void showLoadingDialog({String message = 'loading...'}) {
    showLoading(context, message);
  }

  @override
  void showMessageDialog(String message,
      {String? posActionName,
      VoidCallback? posAction,
      String? negActionName,
      VoidCallback? negAction,
      bool isCancelable = true}) {
    showMessage(context, message,
        posActionName: posActionName,
        posActionCallBack: posAction,
        negActionName: negActionName,
        negActionCallback: negAction,
        );
  }

  @override
  void hideLoadingDialoge() {
    hideLoading(context);
  }
}
