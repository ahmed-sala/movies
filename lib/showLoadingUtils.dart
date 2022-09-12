import 'package:flutter/material.dart';

void showMassege(BuildContext context, String massege,
    {String? posActionName,
      VoidCallback? posAction,
      String? negActionName,
      VoidCallback? negAction,
      bool isCancelable = true}) {
  List<Widget> actions = [];
  if (posActionName != null) {
    actions.add(TextButton(
      onPressed: () {
        Navigator.pop(context);
        if (posAction != null) {
          posAction();
        }
      },
      child: Text(posActionName),
    ));
  }
  if (negAction != null) {
    actions.add(TextButton(
      onPressed: () {
        Navigator.pop(context);
        if (negAction != null) {
          negAction();
        }
      },
      child: Text(negActionName!),
    ));
  }
  showDialog(
      context: context,
      builder: (buildContext) {
        return AlertDialog(
          content: Text(
            massege,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          actions: actions,
        );
      },barrierDismissible: isCancelable);
   showLoading (BuildContext context, String loadingMassege,
      {bool isCancelable = true}) => showDialog(
      context: context,
      builder: (buildContext) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 12,
              ),
              Text(loadingMassege),
            ],
          ),
        );
      },barrierDismissible: isCancelable);
}
void hideLoading(BuildContext context){
  Navigator.pop(context);
}
