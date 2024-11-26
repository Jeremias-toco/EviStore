import 'package:flutter/material.dart';

class SearchbarComponent extends StatelessWidget {
  final VoidCallback? onPress;
  final TextEditingController? controller;
  final GestureTapCallback? onTap;

  const SearchbarComponent({
    super.key,
    this.onPress,
    this.controller,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.redAccent.withOpacity(0.4),
              blurRadius: 22,
              offset: Offset(5, 5)
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextField(
            onTap: onTap,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "buscar produtos...",
              suffixIcon: InkWell(
                onTap: onPress,
                child: Icon(Icons.search)
              )
            ),
          ),
        ),
      ),
    );
  }
}