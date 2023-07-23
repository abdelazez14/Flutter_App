import 'package:flutter/material.dart';

import '../../AppColors.dart';

class PriceAndCountItems extends StatelessWidget {


  final String price;

  const PriceAndCountItems(
      {Key? key,
        required this.price,
       })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Text(
          "\$ $price",
          style: const TextStyle(
              color: Colors.black ,fontWeight: FontWeight.bold, fontSize: 25, height: 1.5),
        )
      ],
    );
  }
}