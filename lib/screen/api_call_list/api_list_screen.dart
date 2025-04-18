import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/screen/api_call_list/post_provider.dart';
import 'package:riverpod_practice/screen/stream_provider/stream_provider.dart';

class ApiListScreen extends ConsumerWidget {
  const ApiListScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final provider = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(title: Text('List from API')),
      body: Center(
        child: provider.when(
          skipLoadingOnRefresh: false,
          data: (data) {
            return
              ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var item = data[index];
                  return ListTile(
                    title: Text(item.title),

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
          ref.invalidate(postProvider);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
