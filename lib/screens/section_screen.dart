import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/post_provider.dart';
import '../widgets/post_card.dart';

class SectionScreen extends StatelessWidget {
  static const routeName = '/section';
  const SectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of<PostCard>(context)!.settings.arguments as String;
    var model = context.read<PostProvider>();
    return Scaffold(
        appBar: AppBar(
          title: Text(arg),
        ),
        body: StreamBuilder(
          stream: model.sortList(arg, model.section).asStream(),
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
                  return ListView.builder(
                      itemCount: model.results.length,
                      itemBuilder: (ctx, index) {
                        var result = model.results[index];
                        log(result.toString());
                        return PostCard(result: result);
                      });
                },
              );
            }
          },
        ));
  }
}
