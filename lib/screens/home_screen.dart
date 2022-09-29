import 'package:cached_network_image/cached_network_image.dart';
import 'package:everything_space/providers/providers.dart';
import 'package:everything_space/services/api_calls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final picOfDay = ref.watch(picofDayProvider);
    final videoId = ref.watch(videoIdProvider);

    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        showLiveFullscreenButton: false,
        autoPlay: true,
        controlsVisibleAtStart: true,
        loop: true,
        mute: true,
      ),
    );

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
          const Divider(
            color: Color(0xFFFFFDD0),
          ),
          picOfDay.title == ''
              ? ElevatedButton(
                  onPressed: () => picOfTheDay(ref),
                  child: const Text('Call the Api'),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              picOfDay.title,
              style: const TextStyle(
                fontFamily: 'Jua',
                fontSize: 30,
                color: Color.fromARGB(255, 136, 241, 91),
              ),
            ),
          ),
          picOfDay.url != '' && picOfDay.mediaType == 'image'
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: CachedNetworkImage(imageUrl: picOfDay.url),
                  ),
                )
              : const SizedBox.shrink(),
          picOfDay.url != '' && picOfDay.mediaType == 'video'
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: YoutubePlayer(
                    controller: controller,
                    showVideoProgressIndicator: true,
                  ),
                )
              : const SizedBox.shrink(),
          picOfDay.explanation == ''
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Call The API to get Info',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    picOfDay.explanation,
                    style: const TextStyle(
                      fontFamily: 'Courgette',
                      fontSize: 18,
                      color: Color.fromARGB(255, 241, 91, 136),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
