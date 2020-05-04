import 'package:flutter/material.dart';
import 'package:kmt/models/post-item-model.dart';

class ItemList extends StatelessWidget {
  final Item item;
  const ItemList({this.item});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        child: AspectRatio(
          aspectRatio: 16.0 / 12.0,
          child: Image.asset(
            item.bannerUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
