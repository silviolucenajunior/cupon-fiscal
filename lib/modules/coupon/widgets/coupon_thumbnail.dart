import 'package:flutter/material.dart';

class CouponThumbnailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        width: 600,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CouponThumbnailWidget._getDateWidget(),
            CouponThumbnailWidget._getPriceWidget(),
            CouponThumbnailWidget._getStablishmentWidget(),
          ]
        )
      )
    );
  }
  
  static Widget _getStablishmentWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Mercadinho Melhor Opção",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        Text("Rua Paste, 514, Carlito Pamplona",
            style: TextStyle(
            fontSize: 12,
          ),),
        Text("Fortaleza/Ceara",
            style: TextStyle(
            fontSize: 12,
          ),),
      ]
    );
  }
  
  static Widget _getDateWidget() {
    return Text(
      "21/08/1987",
      style: TextStyle(
        fontSize: 12
      )
    );
  }
  
  static Widget _getPriceWidget() {
    return Text(
      r"R$ 300,00",
      style: TextStyle(
        fontSize: 12
      )
    );
  }
}
