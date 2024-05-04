import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/app_colors.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({
    Key? key,
    this.height,
  }) : super(key: key);

  final double? height;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height ?? 180.0,
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
            viewportFraction: 1,
            autoPlay: true,

          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 1.0),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('text $i', style: const TextStyle(fontSize: 16.0)),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 5,),
        ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    height: 14,
                    width: 14,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: i == _currentIndex.value ? AppColors.primaryColor : Colors.white,
                      border: Border.all(
                        color: i == _currentIndex.value ? AppColors.primaryColor : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
              ],
            );
          },
        ),
      ],
    );
  }
}
