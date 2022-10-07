import 'package:flutter/material.dart';
import 'package:nytimes/screens/section_screen.dart';
import 'package:nytimes/screens/web_post_screen.dart';

import '../model/model.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.result,
  }) : super(key: key);

  final Results result;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(WebPostScreen.routeName,
          arguments: [result.title!, result.url!]),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    result.title!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(result.abstract!),
                ],
              ),
            ),
            result.multimedia?[0].url != null
                ? Image.network(
                    result.multimedia![0].url!,
                    fit: BoxFit.cover,
                  )
                : const Placeholder(
                    fallbackHeight: 200,
                  ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pushNamed(
                          SectionScreen.routeName,
                          arguments: result.section!),
                      child: Text(
                        result.section!.replaceFirst(result.section![0],
                            result.section![0].toUpperCase()),
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
