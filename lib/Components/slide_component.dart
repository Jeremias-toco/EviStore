import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class SlideComponent extends StatelessWidget {
  const SlideComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: ImageSlideshow(
          indicatorColor: Colors.red,
          autoPlayInterval: 2000,
          isLoop: true,
          initialPage: 0,
          children: [
            ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10)),child: Image.asset("assets/img/1.jpg",fit: BoxFit.cover),),
            ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10)),child: Image.asset("assets/img/2.jpg",fit: BoxFit.cover)),
            ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10)),child: Image.asset("assets/img/3.jpg",fit: BoxFit.cover)),
          ]
        ),
      ),
    );
  }
}