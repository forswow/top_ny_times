import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/post_provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.searchText,
    required this.model,
  }) : super(key: key);

  final TextEditingController searchText;
  final PostProvider model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 40,
          child: Material(
            color: Colors.white54,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: TextField(
                controller: searchText,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                ),
                onChanged: (val) async {
                  if (val.isNotEmpty) {
                    return await context
                        .read<PostProvider>()
                        .sortList(val, model.section);
                  }
                  if (val.isEmpty ) {
                    return await context
                        .read<PostProvider>()
                        .sortList('', model.section);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}