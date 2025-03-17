import 'package:flutter/material.dart';
import 'package:nambu_admin/component/sport/sportpersonalcard.dart';
import 'package:nambu_admin/provider/sport/sportpersonprovider.dart';
import 'package:provider/provider.dart';

class SportSearchDelegate extends SearchDelegate<String> {
  @override
  String? get searchFieldLabel => '번호 또는 이름 입력';
  @override
  TextStyle? get searchFieldStyle => TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.grey[600]);

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
    final suggestions =
        provider.teamList.where((item) => item.name.contains(query) || item.num.toString().contains(query)).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Sportpersonalcard(person: suggestions[index]),
        );
      },
    );
  }
}
