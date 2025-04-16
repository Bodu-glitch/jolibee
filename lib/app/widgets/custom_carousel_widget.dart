import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomCarouselWidget();
  }
}

class _CustomCarouselWidget extends State<CustomCarouselWidget> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<String> imgList = [
    'https://jollibee.com.vn/media/mageplaza/bannerslider/banner/image/b/a/banner_web-02-compressed.jpg',
    'https://jollibee.com.vn/media/mageplaza/bannerslider/banner/image/b/a/banner_web__c_m_g_m_m_t_i-compressed.jpg',
    'https://jollibee.com.vn/media/mageplaza/bannerslider/banner/image/b/a/banner_website_jbvn_-_perfect_pairs_2025-compressed.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: 180,
              aspectRatio: 16 / 9,
              autoPlay: true,
              viewportFraction: 1.0,
              autoPlayInterval: Duration(milliseconds: 3000),
              autoPlayAnimationDuration: Duration(milliseconds: 300),
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },

            ),
            items:
            imgList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      i,
                      fit: BoxFit.fitWidth,
                      width: MediaQuery.of(context).size.width,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key, duration: Duration(milliseconds: 300), curve: Curves.easeIn),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                        .withOpacity( _current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]);
  }
}
