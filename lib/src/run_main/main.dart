import 'package:fluttercartshopping/src/ui/main.dart' as cart_bloc;

void main() {
  final screen = Architecture.cart_bloc;

  switch(screen){
    case Architecture.cart_bloc:
      cart_bloc.main();
      return;
  }
}

enum Architecture{
  cart_bloc
}
