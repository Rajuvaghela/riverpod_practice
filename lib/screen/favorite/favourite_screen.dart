import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/screen/favorite/provider/favourite_provider.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteList = ref.watch(favouriteProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite List"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value){
              ref.read(favouriteProvider.notifier).favourite(value);
            },
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(value: "All", child: Text('All')),
                PopupMenuItem(value: "Favourite", child: Text('Favourite')),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Search",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              ref.read(favouriteProvider.notifier).filterList(value);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favouriteList.filteredItems.length,
              itemBuilder: (context, index) {
                var item = favouriteList.filteredItems[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          // ref.read(favouriteProvider.notifier).updateItem(item.id,"hello");
                        },
                        icon: Icon(
                          item.favourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                      ),
                      /*                  IconButton(onPressed: () {
                      ref.read(itemProvider.notifier).updateItem(item.id,"hello");
                    }, icon: Icon(Icons.edit)),
                    IconButton(
                      onPressed: () {
                        ref.read(itemProvider.notifier).deleteItem(item.id);
                      },
                      icon: Icon(Icons.delete),
                    ),*/
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favouriteProvider.notifier).addItem();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
