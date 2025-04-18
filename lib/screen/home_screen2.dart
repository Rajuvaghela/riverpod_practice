import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/screen/search_provider.dart';

class HomeScreen2 extends ConsumerStatefulWidget {
  const HomeScreen2({super.key});

  @override
  ConsumerState<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends ConsumerState<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              ref.read(searchProvider.notifier).search(value);
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final search = ref.watch((searchProvider).select((state) =>state.search));
              print("only consumer1");
              return Text(search, style: TextStyle(fontSize: 20));
            },
          ),

          Consumer(
            builder: (context, ref, child) {
              final onChange = ref.watch((searchProvider).select((state) =>state.onChange));

              print("only consumer2");
              return Switch(
                value: onChange,
                onChanged: (value) {
                  ref.read(searchProvider.notifier).onChange(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
