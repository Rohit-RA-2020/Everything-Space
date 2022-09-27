import 'package:everything_space/models/pic_of_day.dart';
import 'package:riverpod/riverpod.dart';

final picofDayProvider = StateProvider(
  (ref) => PicOfTheDay(
    date: DateTime.now(),
    explanation: '',
    mediaType: '',
    serviceVersion: '',
    title: '',
    url: '',
  ),
);

final videoIdProvider = StateProvider((ref) => '');