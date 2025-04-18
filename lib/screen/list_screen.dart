import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/screen/item_provider.dart';

class ListScreen extends ConsumerWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemProvider);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          var item = items[index];
          return ListTile(
            title: Text(item.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: () {
                  ref.read(itemProvider.notifier).updateItem(item.id,"hello");
                }, icon: Icon(Icons.edit)),
                IconButton(
                  onPressed: () {
                    ref.read(itemProvider.notifier).deleteItem(item.id);
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem("Raju Vaghela");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
