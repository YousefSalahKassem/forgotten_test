import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forgotten_test/home/providers/category_provider.dart';
import 'package:forgotten_test/home/providers/product_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [_Header(),_Body()],
      ),
    );
  }
}

class _Header extends ConsumerWidget {
  const _Header();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final state = ref.watch(CategoryProvider.provider);
    final notifier = ref.read(CategoryProvider.provider.notifier);
    final categories = CategoryProvider.mockCategories;

    return SizedBox(
      height: 60,
      width: MediaQuery.sizeOf(context).width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              notifier.selectedCategory = category;
              ref.read(ProductProvider.provider.notifier).updateProducts();

            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: state.selectedCategory == category
                    ? Colors.blue
                    : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                category.title,
                style: TextStyle(
                  color: state.selectedCategory == category
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(ProductProvider.provider).products;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index) {
        final productName = products.keys.elementAt(index);
        final productDetails = products[productName];

        return ListTile(
          title: Text(productName),
          subtitle: Text(productDetails??''),
        );
      },
    );
  }
}