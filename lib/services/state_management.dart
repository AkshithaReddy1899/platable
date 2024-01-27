import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers/cart_provider.dart';

final cartRiverpod = ChangeNotifierProvider((ref) => CartProvider());
