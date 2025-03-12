import 'package:flutter/material.dart';
import 'package:nambu_admin/component/sport/sportpersonalcard.dart';
import 'package:nambu_admin/provider/sportpersonprovider.dart';
import 'package:provider/provider.dart';

class SportSearchDelegate extends SearchDelegate<String> {
  final List<String> items = ['item 0', 'item 1', 'item 2', 'item 3', 'item 4'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, query);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('결과: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final provider = Provider.of<SportpersonProvider>(context);
    final suggestions = List.generate(4, (index) => 'item $index')
        .where((item) => item.contains(query))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Sportpersonalcard(index: index),
        );
      },
    );
  }
}
