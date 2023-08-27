import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  final String historyId;

  const HistoryScreen({super.key, required this.historyId});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  bool _isPlaying = false;
  late final AudioPlayer _audioPlayer;
  late final AssetSource _assetSource;

  Duration _duration = const Duration();
  Duration _position = const Duration();

  @override
  void initState() {
    super.initState();
    ref.read(historyInfoProvider.notifier).loadHistory(widget.historyId);
    _initAudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _initAudioPlayer() async {
    _audioPlayer = AudioPlayer();
    _assetSource = AssetSource('audios/01ElTerremotoDe1925.mp3');
    await _audioPlayer.setSourceAsset(_assetSource.path);
    _audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        _duration = event;
      });
    });
    _audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        _position = event;
      });
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _position = _duration;
        _isPlaying = false;
      });
    });
  }

  Future<void> _play() async {
    await _audioPlayer.play(_assetSource);
    setState(() {
      _isPlaying = true;
    });
  }

  Future<void> _pause() async {
    await _audioPlayer.pause();
    setState(() {
      _isPlaying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final history = ref.watch(historyInfoProvider)[widget.historyId];

    if (history == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(strokeWidth: 2.0)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(history.title),
        backgroundColor: const Color(0xFFCFAF86),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE7C18B), Color(0xFFA1887F)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: history.images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          history.images[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: NeuBox(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Sed euismod, nisl quis aliquam ultricies, nunc nisl '
                      'consequat nunc, sed aliquam nisl nunc eu nisi. '
                      'Suspendisse potenti. Nulla facilisi. '
                      'Sed euismod, nisl quis aliquam ultricies, nunc nisl '
                      'consequat nunc, sed aliquam nisl nunc eu nisi. '
                      'Suspendisse potenti. Nulla facilisi.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: NeuBox(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Sed euismod, nisl quis aliquam ultricies, nunc nisl '
                      'consequat nunc, sed aliquam nisl nunc eu nisi. '
                      'Suspendisse potenti. Nulla facilisi. '
                      'Sed euismod, nisl quis aliquam ultricies, nunc nisl '
                      'consequat nunc, sed aliquam nisl nunc eu nisi. '
                      'Suspendisse potenti. Nulla facilisi.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                const SizedBox(height: 200),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 600),
            width: MediaQuery.sizeOf(context).width,
            bottom: 0,
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(231, 193, 139, 1.0),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Reproducir',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${_position.inMinutes}:${_position.inSeconds.remainder(60)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${_duration.inMinutes}:${_duration.inSeconds.remainder(60)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Slider(
                    value: _position.inSeconds.toDouble(),
                    min: 0,
                    max: _duration.inSeconds.toDouble(),
                    onChanged: (value) async {
                      await _audioPlayer.seek(Duration(seconds: value.toInt()));
                      setState(() {});
                    },
                    inactiveColor: Colors.black.withOpacity(0.2),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            _audioPlayer.seek(const Duration());
                            setState(() {});
                          },
                          icon: const Icon(Icons.skip_previous_outlined),
                        ),
                        IconButton(
                          onPressed: () {
                            _audioPlayer.seek(
                              _position - const Duration(seconds: 10),
                            );
                            setState(() {});
                          },
                          icon: const Icon(Icons.replay_10_outlined),
                        ),
                        IconButton(
                          onPressed: () {
                            _isPlaying ? _pause() : _play();
                          },
                          icon: Icon(
                            _isPlaying
                                ? Icons.pause_circle_filled
                                : Icons.play_circle_filled,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _audioPlayer.seek(
                              _position + const Duration(seconds: 10),
                            );
                            setState(() {});
                          },
                          icon: const Icon(Icons.forward_10_outlined),
                        ),
                        IconButton(
                          onPressed: () {
                            _audioPlayer.seek(_duration);
                            setState(() {
                              _isPlaying = false;
                            });
                          },
                          icon: const Icon(Icons.skip_next_outlined),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFCFAF86),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Reproducir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Información',
          ),
        ],
      ),
    );
  }
}
