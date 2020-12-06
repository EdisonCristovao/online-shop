import 'package:flutter/material.dart';
import 'package:onlineshop/constants.dart';
import 'package:onlineshop/models/Product.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Color'),
                              Row(
                                children: [
                                  ColorDot(
                                    color: Color(0xFF356C95),
                                    isSelected: true,
                                  ),
                                  ColorDot(color: Color(0xFFF8C078)),
                                  ColorDot(color: Color(0xFFA29B9B))
                                ],
                              )
                            ],
                          ),
                          RichText(
                              text: TextSpan(
                            style: TextStyle(color: kTextColor),
                            children: [
                              TextSpan(text: 'Size'),
                            ],
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Top Mano',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: 'Preço\n'),
                                TextSpan(
                                  text: 'R\$${product.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: kDefaultPaddin),
                          Expanded(
                            child: Hero(
                              tag: '${product.id}',
                              child: Image.asset(
                                product.image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorDot({
    Key key,
    this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: isSelected ? color : Colors.transparent),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
