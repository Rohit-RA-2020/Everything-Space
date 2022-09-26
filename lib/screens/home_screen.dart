import 'package:cached_network_image/cached_network_image.dart';
import 'package:everything_space/providers/providers.dart';
import 'package:everything_space/services/api_calls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final picOfDay = ref.watch(picofDayProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Astronomy Picture of the Day',
              style: TextStyle(
                fontFamily: 'Jua',
                fontSize: 40,
                color: Color(0xFFFFFDD0),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Astronomy Picture of the Day (APOD) is a website run by NASA that features a different astronomy-related image or photograph each day, along with a brief explanation written by a professional astronomer.',
              style: TextStyle(
                fontFamily: 'Jua',
                fontSize: 20,
                color: Color.fromARGB(255, 241, 141, 91),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => picOfTheDay(ref),
            child: const Text('Call the Api'),
          ),
          picOfDay.hdurl == ''
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Call The API to load image',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              : CachedNetworkImage(imageUrl: picOfDay.hdurl),
        ],
      ),
    );
  }
}
