import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductCard {
  int productId;
  int price;
  String description;
  String image;

  ProductCard({
    required this.productId,
    required this.price,
    required this.description,
    required this.image,
  });
}

class CustomProductCard extends StatelessWidget {
  CustomProductCard({super.key, required this.productCard});

  final ProductCard productCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromRGBO(207, 0, 15, 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Giá chỉ còn: ${productCard.price} đ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          productCard.description,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ), // Wrap the color
                    ),
                    onPressed: () {},
                    child:  SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Đặt hàng',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(productCard.image,width: 120,),
          ],
        ),
      ),
    );
  }
}

class CustomCarouselProductCard extends StatelessWidget {
  CustomCarouselProductCard({super.key});

  final List<ProductCard> productCards = [
    ProductCard(
      productId: 1,
      price: 45000,
      description: 'C3 - Cơm gà giòn sốt cay + Súp bí đỏ + Nước ngọt',
      image: 'assets/images/ga.png',
    ),
    ProductCard(
      productId: 2,
      price: 50000,
      description: 'C4 - Cơm gà giòn sốt cay + Súp bí đỏ + Nước ngọt',
      image: 'assets/images/ga.png',
    ),
    ProductCard(
      productId: 3,
      price: 55000,
      description: 'C5 - Cơm gà giòn sốt cay + Súp bí đỏ + Nước ngọt',
      image: 'assets/images/ga.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(

        aspectRatio: 16 / 9,
        viewportFraction: 0.9,
        autoPlayInterval: Duration(milliseconds: 3000),
        autoPlayAnimationDuration: Duration(milliseconds: 300),
      ),
      items: productCards.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),

                child: CustomProductCard(productCard: i,)
            );
          },
        );
      }).toList(),
    );
  }
}
