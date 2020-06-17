//TODO 1 dòng trong giỏ hàng
import '../product.dart';

//TODO 1 dòng duy nhất trong giỏ hàng
class CartItem {
  final int count;
  final Product product;

  CartItem(this.count, this.product);

  @override
  String toString() => "${product.name} X $count";
}
