import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter =StateProvider<int>((ref) {
  return 0;
},);

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("build");
    //final str = ref.watch(hello);
    //final myCounter = ref.watch(counter);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Consumer(
             builder: (context,ref,child){
               final myCounter = ref.watch(counter);
               print("only consumer1");
               return Text(myCounter.toString(),style: TextStyle(fontSize: 50),);
             }),

          ElevatedButton(onPressed: (){
            ref.read(counter.notifier).state++;
          }, child: Text("+"))

        ],
      ),
    );
  }
}

/*
//Provider example
final hello =Provider<String>((ref) {
  return "Hello Raju";
},);

final age =Provider<int>((ref) {
  return 25;
},);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final str = ref.watch(hello);
    final myAge = ref.watch(age);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(str),
            Text(myAge.toString()),
          ],
        ),
      ),
    );
  }
}
*/
