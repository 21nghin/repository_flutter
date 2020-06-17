import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercartshopping/commom/models/cart.dart';
import 'package:fluttercartshopping/commom/models/catalog.dart';
import 'package:fluttercartshopping/commom/models/product.dart';
import 'package:fluttercartshopping/commom/widgets/cart_button.dart';
import 'package:fluttercartshopping/commom/widgets/product_square.dart';
import 'package:fluttercartshopping/src/ui/cart/cart_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final cart = Cart();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product',
      home: MyHomePage(cart: cart,),
      routes: <String, WidgetBuilder>{
        CartPage.routeName: (context) => CartPage(cart),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Cart cart;

  MyHomePage({Key key, @required this.cart}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _updateCart(Product product) {
    setState(() => widget.cart.add(product));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
        actions: <Widget>[
          //TODO nút giỏ hàng trong thanh ứng dụng.
          CartButton(
            itemCount: widget.cart.itemCount,
            onPressed: () {
              print('CartPage');
              Navigator.of(context).pushNamed(CartPage.routeName);
            },
          )
        ],
      ),
      body: ProductGrid(widget.cart, _updateCart),
    );
  }

  Widget ProductGrid(Cart cart, Function(Product) updateProduct) {
    return GridView.count(
      physics: BouncingScrollPhysics(),
      crossAxisCount: 3,
      children: catalog.products.map((product) {
        return ProductSquare(
          product: product,
          onTap: () {
            setState(() {
              print('click item');
              updateProduct(product);
            });
          },
        );
      }).toList(),
    );
  }
}



