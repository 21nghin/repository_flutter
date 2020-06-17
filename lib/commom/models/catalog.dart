import 'dart:collection';
import 'dart:ui' show Color;

import 'package:fluttercartshopping/commom/models/product.dart';

/// Danh mục mã hóa cứng của [Product] s.
final Catalog catalog = fetchCatalogSync();

/// Lấy danh mục một cách đồng bộ.
Future<Catalog> fetchCatalog() {
  //  Điều này mô phỏng một độ trễ ngắn để chúng ta không quá tự phụ về việc có
  //  trạng thái này xuất hiện từ khi bắt đầu ứng dụng (điều không thể xảy ra trong thế giới thực).
  return Future.delayed(const Duration(milliseconds: 200), fetchCatalogSync);
}

/// Tìm nạp danh mục một cách đồng bộ
/// Điều này ít thực tế hơn nhiều so với [fetchCatalog] nhưng có thể chấp nhận nếu chúng ta muốn
/// tập trung vào một số khía cạnh khác với mẫu của chúng tôi.
Catalog fetchCatalogSync() {
  return Catalog.sample();
}

class Catalog {
  /// Danh sách các sản phẩm mẫu.
  static const List<Product> _listProduct = const <Product>[
    const Product(42, "Sweater", const Color(0xFF536DFE)),
    const Product(1024, "Socks", const Color(0xFFFFD500)),
    const Product(1337, "Shawl", const Color(0xFF1CE8B5)),
    const Product(123, "Jacket", const Color(0xFFFF6C00)),
    const Product(201805, "Hat", const Color(0xFF574DDD)),
    const Product(128, "Hoodie", const Color(0xFFABD0F2)),
    const Product(321, "Tuxedo", const Color(0xFF8DA0FC)),
    const Product(1003, "Shirt", const Color(0xFF1CE8B5)),
  ];

  final List<Product> _products;

  Catalog.empty() : _products = [];

  Catalog.sample() : _products = _listProduct;

  bool get isEmpty => _products.isEmpty;

  /// Một danh sách bất biến của các sản phẩm
  UnmodifiableListView<Product> get products =>
      UnmodifiableListView<Product>(_products);
}
