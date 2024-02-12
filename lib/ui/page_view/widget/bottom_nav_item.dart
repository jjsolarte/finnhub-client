import 'package:finnhub_client/ui/style/palette.dart';
import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.bottomItem,
    required this.iconData,
    required this.callback,
    required this.itemSelected,
  }) : super(key: key);

  final int bottomItem;
  final int itemSelected;
  final IconData iconData;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: CircleAvatar(
          backgroundColor:
              itemSelected == bottomItem ? Palette.primaryColor : Colors.transparent,
          child: Icon(iconData)),
    );
  }
}
