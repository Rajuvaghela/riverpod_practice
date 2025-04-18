import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/screen/stream_provider/stream_provider.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(stockPriceProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Stream provider')),
      body: Center(
        child: provider.when(
          skipLoadingOnRefresh: false,
          data: (data) {
            return Text(data.toString(),style: TextStyle(fontSize: 50),);
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(stockPriceProvider);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
