import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FrontOrBackSide { front, back }

final frontOrBackSideProvider = Provider<FrontOrBackSide>((_) {
  throw UnimplementedError();
});
