import 'package:flutter/material.dart';
import 'package:onlineshop/constants.dart';

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            buildSizedBox(icon: Icons.remove, press: () => handleCounter(-1)),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
              child: Text(
                numOfItems.toString().padLeft(2, '0'),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            buildSizedBox(icon: Icons.add, press: () => handleCounter(1))
          ],
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: IconButton(
            color: Colors.white,
            icon: Icon(
              Icons.favorite,
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  void handleCounter(increment) {
    setState(() {
      numOfItems += increment;
    });
  }

  SizedBox buildSizedBox({IconData icon, Function press}) {
    return SizedBox(
      height: 32,
      width: 40,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
