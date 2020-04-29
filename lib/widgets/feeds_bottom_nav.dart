
import 'package:flutter/material.dart';

class FeedsBottomNav extends StatelessWidget {
 final  item;
 FeedsBottomNav(this.item); 

  Widget build(context) {
    return Container(
      height: 75.0,
      child: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                item             
              ],
            ),
          ),
      ),
    );
  }

  Widget navItem(context,  pageItem, content) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
        MaterialPageRoute(
          builder: (_) => pageItem,
        )),
      child: content);
  }
}

class BtmIcon extends StatelessWidget {
  final IconData _name;
  final double _size;
  final Color _color;
  BtmIcon(this._name, this._size, this._color);
  Widget build(context) {
    return Icon(
      _name,
      size: _size,
      color: _color,
    );
  }
}
