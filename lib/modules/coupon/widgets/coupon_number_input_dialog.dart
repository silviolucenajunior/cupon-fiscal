import 'package:flutter/material.dart';

class CouponNumberDialog extends StatelessWidget {
  final couponCodeInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: this.couponCodeInputController
              ),
              SizedBox(
                height: 20
              ),
              RaisedButton(
                child: Text("Confirmar"),
                onPressed: () {
                  Navigator.of(context).pop(this.couponCodeInputController.text);
                }
              )
            ]
          )
        ),
        
      ]
    );
  }

}