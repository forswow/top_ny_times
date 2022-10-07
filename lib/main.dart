import 'package:flutter/material.dart';
import 'package:nytimes/data/data.dart';
import 'package:nytimes/screens/section_screen.dart';
import 'package:nytimes/screens/top_stories_screen.dart';
import 'package:nytimes/screens/web_post_screen.dart';
import 'package:provider/provider.dart';

import 'providers/post_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => PostProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true),
        title: 'TOP: NY Times',
        routes: {
          TopStoriesScreen.routeName: (ctx) => const TopStoriesScreen(),
          SectionScreen.routeName: (ctx) => const SectionScreen(),
          WebPostScreen.routeName: (ctx) => const WebPostScreen(),
        },
      ),
    );
  }
}
