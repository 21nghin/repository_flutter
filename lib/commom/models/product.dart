import 'dart:ui';

class Product {
  //TODO Mã định danh duy nhất cảu sản phẩm.
  final int id;

  //TODO Văn bản mặc định sẽ hiển thị
  final String name;

  //TODO 1 màu liên quan đến sản phẩm.
  final Color color;

  const Product(this.id, this.name, this.color);

  @override
  // TODO: implement hashCode
  int get hashCode => id;

  @override
  bool operator ==(other) => other is Product && other.hashCode == hashCode;

  @override
  String toString() => "$name (id=$id)";
}
