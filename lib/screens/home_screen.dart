// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meme_stream/models/meme_model.dart';
import 'package:meme_stream/providers/memes_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final subredditTEC = TextEditingController();
  AsyncValue<List<MemeModel>> memes = const AsyncValue.data([]);
  int pos = 0;
  static int MAX_COUNT = 5;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    memes = ref.watch(
        getMemesProvider(subreddit: subredditTEC.text, count: MAX_COUNT));
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.9,
              height: size.height * 0.6,
              child: memes.when(
                data: (data) => Image.network(
                  data[pos < data.length ? pos : (pos = 0)].preview.last,
                  fit: BoxFit.contain,
                  //TODO errorBuilder does not appear to work
                  errorBuilder: (context, exception, stackTrace) => const Text(
                      '404 Image Not found :(\nClick Generate to generate a new meme'),
                ),
                error: (error, st) {
                  return Center(
                      child: Text(
                    "Please Enter a valid subreddit that contains images.",
                    style: TextStyle(fontSize: 30, color: Colors.amber[800]),
                    textAlign: TextAlign.center,
                  ));
                },
                loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: subredditTEC,
                decoration: const InputDecoration(
                    hintText: "Enter subreddit. Leave empty for random."),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if ((MemesApi.subreddit == subredditTEC.text) &&
                    pos < MAX_COUNT - 1) {
                  setState(() {
                    pos = pos + 1;
                  });
                } else {
                  if (MAX_COUNT == 50) {
                    setState(() {
                      MAX_COUNT = 5;
                    });
                  }
                  try {
                    setState(() {
                      memes = ref.read(getMemesProvider(
                          subreddit: subredditTEC.text, count: MAX_COUNT + 1));
                      pos = 0;
                      MAX_COUNT = MAX_COUNT + 1;
                    });
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[300],
                foregroundColor: Colors.white,
              ),
              child: const Text("Generate"),
            ),
          ],
        ),
      ),
    );
  }
}
