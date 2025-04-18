import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/screen/future_provider/future_provider.dart';

class FutureListScreen extends ConsumerWidget {
  const FutureListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: provider.when(
          skipLoadingOnRefresh: false,
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var item = data[index];
                return ListTile(
                  title: Text(item),

                );
              },
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(futureProvider);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
