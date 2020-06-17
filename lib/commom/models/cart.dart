import 'dart:collection';
import 'dart:math';

import 'package:fluttercartshopping/commom/models/item/cart_item.dart';
import 'package:fluttercartshopping/commom/models/product.dart';

class Cart {
  final List<CartItem> _items = <CartItem>[];

  //TODO tạo 1  giỏ hàng trống.
  Cart();

  //TODO tạo 1 giỏ hàng từ 1 giỏ hàng cũ
  Cart.clone(Cart cart) {
    _items.addAll(cart._items);
  }

  //TODO điền vào giỏ hàng với một mẫu từ các sản phẩm nhất định
  Cart.sample(Iterable<Product> products) {
    _items.addAll(products.take(3).map((e) => CartItem(1, e)));
  }

  /// Tổng số mặt hàng trong giỏ hàng, bao gồm các bản sao của cùng một mặt hàng
  /// Điều này trái ngược với việc chỉ làm [items.length], chỉ tính
  /// mỗi sản phẩm một lần, bất kể có bao nhiêu được mua.

  int get itemCount => _items.fold(0, (sum, el) => sum + el.count);

  /// Đây là trạng thái hiện tại của giỏ hàng.
  /// Đây là danh sách vì người dùng hy vọng các mục trong giỏ hàng của họ giống nhau.
  /// Đặt hàng họ đã mua chúng.
  /// Đây là một chế độ xem không thể thay đổi vì chúng tôi không muốn một tiện ích ngẫu nhiên để
  /// đưa xe vào tình trạng xấu. Sử dụng [thêm] và [xóa] để sửa đổi trạng thái.
  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  /// Thêm [product vào giỏ hàng. Điều này sẽ cập nhật [CartItem] hiện có
  /// trong [items] hoặc thêm một mục ở cuối danh sách.
  void add(Product product, [int count = 1]) {
    _updateCount(product, -count);
  }

  @override
  String toString() => "$items";

  void _updateCount(Product product, int difference) {
    if (difference == 0) return;
    for (int i = 0; i < _items.length; i++) {
      final item = _items[i];
      if (product == item.product) {
        final newCount = item.count + difference;
        if (newCount <= 0) {
          _items.removeAt(i);
          return;
        }
        _items[i] = CartItem(newCount, item.product);
        return;
      }
    }
    if (difference < 0) return;
    _items.add(CartItem(max(difference, 0), product));
  }
}
