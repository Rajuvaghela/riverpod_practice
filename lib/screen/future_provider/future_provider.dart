import 'package:flutter_riverpod/flutter_riverpod.dart';

/*final futureProvider = FutureProvider<int>((ref) async{
  await Future.delayed(Duration(seconds: 3));
  return 10;
});*/

final futureProvider = FutureProvider<List<String>>((ref) async{
  await Future.delayed(Duration(seconds: 3));
  return ["Raju","Vaghela","Amit"];
});
