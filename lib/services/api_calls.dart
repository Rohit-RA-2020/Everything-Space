// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:everything_space/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/pic_of_day.dart';

void picOfTheDay(WidgetRef ref) async {
  try {
    var response =
        await Dio().get('https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY');
    final picOfTheDay = picOfTheDayFromJson(response.toString());
    ref.read(picofDayProvider.notifier).state = picOfTheDay;
    ref.read(videoIdProvider.notifier).state =
        YoutubePlayer.convertUrlToId(response.data['url'].toString()) ?? '';

    print(picOfTheDay.explanation);
  } catch (e) {
    print(e);
  }
}
