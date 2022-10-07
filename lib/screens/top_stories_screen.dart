import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nytimes/const.dart';
import 'package:nytimes/providers/post_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/post_card.dart';
import '../widgets/search_bar.dart';

class TopStoriesScreen extends StatefulWidget {
  static const routeName = '/';
  const TopStoriesScreen({Key? key}) : super(key: key);

  @override
  State<TopStoriesScreen> createState() => _TopStoriesScreenState();
}

class _TopStoriesScreenState extends State<TopStoriesScreen> {
  final searchText = TextEditingController(text: '');
  final scrollController = ScrollController();
  bool _isCategory = false;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (context.read<PostProvider>().results.length ==
          context.read<PostProvider>().count) {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels == 0) {
          } else {
            context
                .read<PostProvider>()
                .addItem(searchText.text, context.read<PostProvider>().count);
          }
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    searchText.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var model = context.read<PostProvider>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Top NY Times Stories'),
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Row(
                children: [
                  SearchBar(searchText: searchText, model: model),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _isCategory = !_isCategory;
                        });
                      },
                      icon: const Icon(
                        Icons.category,
                      ))
                ],
              ),
              if (_isCategory) ...[
                Card(
                  child: Wrap(
                    children: section.map((e) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              model.section = e;
                              _isCategory = !_isCategory;
                            });
                          },
                          child: Chip(
                            label: Text(e),
                            elevation: 1,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
              StreamBuilder(
                stream: context
                    .read<PostProvider>()
                    .sortList(searchText.text, model.section)
                    .asStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.error != null) {
                    return const Center(
                      child: Text('Error'),
                    );
                  } else {
                    return Consumer<PostProvider>(
                      builder: (context, model, child) {
                        return Stack(
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: model.results.length,
                                itemBuilder: (ctx, index) {
                                  var result = model.results[index];
                                  log(result.toString());
                                  return PostCard(result: result);
                                }),
                            if (snapshot.connectionState ==
                                ConnectionState.done) ...[
                              Positioned(
                                bottom: 120,
                                left: (MediaQuery.of(context).size.width * 0.5),
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Color(0xFFE4E4E4),
                                    color: Color(0xFF087924),
                                  ),
                                ),
                              )
                            ]
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
