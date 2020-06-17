import 'dart:ffi';

import 'package:flutter/material.dart';

class CartButton extends StatefulWidget {
  ///TODO Chức năng gọi khi nhấn vào nút biểu tượng
  final VoidCallback onPressed;

  ///TODO Số lượng các mặt hàng trong giỏ. Khi đầy là 0, sẽ không có huy hiệu được hiển thị.
  final int itemCount;
  final Color badgeColor;
  final Color badgeTextColor;

  CartButton(
      {Key key,
      this.onPressed,
      @required this.itemCount,
      this.badgeColor: Colors.red,
      this.badgeTextColor: Colors.white})
      : assert(itemCount >= 0),
        assert(badgeColor != null),
        assert(badgeTextColor != null),
        super(key: key);

  @override
  _CartButtonState createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CartButton oldWidget) {
    // TODO: implement didUpdateWidget
    if (widget.itemCount != oldWidget.itemCount) {
      _animationController.reset();
      _animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  final Tween<Offset> _badgePositionTween =
      Tween(begin: const Offset(-0.5, 0.9), end: const Offset(0.0, 0.0));

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Icon(Icons.shopping_cart),
          Positioned(
            top: -8,
            right: -3,
            child: SlideTransition(
              position: _badgePositionTween.animate(_animation),
              child: Material(
                type: MaterialType.circle,
                elevation: 2,
                color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    widget.itemCount.toString(),
                    style: TextStyle(
                      fontSize: 10,
                      color: widget.badgeTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      onPressed: widget.onPressed,
    );
  }
}
