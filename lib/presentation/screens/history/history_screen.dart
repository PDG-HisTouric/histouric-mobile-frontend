import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';
import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  final String historyId;

  const HistoryScreen({super.key, required this.historyId});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  bool _isPlaying = false;
  bool _isAudioLoaded = false;
  late final AudioPlayer _audioPlayer;
  late final UrlSource _urlSource;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  String _positionFormatted = "00:00";
  String _remainderFormatted = "00:00";

  Story? history;

  HistoryText? currentHistoryText;
  HistoryImage? currentHistoryImage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(historyInfoProvider.notifier)
          .loadHistory(widget.historyId)
          .then((history) => _initAudioPlayer(history.audio.audioUri));
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _initAudioPlayer(String audioUri) async {
    _audioPlayer = AudioPlayer();
    _urlSource = UrlSource(audioUri);
    _audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        _duration = event;
      });
    });
    _audioPlayer.onPositionChanged.listen((event) {
      String tempPositionFormatted = _formatTimeFromSeconds(event.inSeconds);
      String tempRemainderFormatted =
          _formatTimeFromSeconds(_duration.inSeconds - event.inSeconds);
      print("actual: $tempPositionFormatted");
      print("lo que falta: $tempRemainderFormatted");
      HistoryText? currentText = _getCurrentTextSegment(event);
      HistoryImage? currentImage = _getCurrentHistoryImage(event);
      setState(() {
        _position = event;
        if (currentText != currentHistoryText) {
          currentHistoryText = currentText;
        }
        if (currentImage != currentHistoryImage) {
          currentHistoryImage = currentImage;
        }
        _remainderFormatted = tempRemainderFormatted;
        _positionFormatted = tempPositionFormatted;
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
    setState(() {
      _isPlaying = true;
    });
    await _audioPlayer.play(_urlSource);
    if (!_isAudioLoaded) {
      setState(() {
        _isAudioLoaded = true;
      });
    }
  }

  Future<void> _pause() async {
    await _audioPlayer.pause();
    setState(() {
      _isPlaying = false;
    });
  }

  HistoryImage? _getCurrentHistoryImage(Duration position) {
    HistoryImage? newHistoryImage;
    for (var historyImage in history!.images!) {
      if (position >= Duration(seconds: historyImage.startTime)) {
        newHistoryImage = historyImage;
      } else {
        break;
      }
    }
    return newHistoryImage;
  }

  String _formatTimeFromSeconds(int totalSeconds) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(totalSeconds ~/ 3600);
    final minutes = twoDigits(totalSeconds ~/ 60);
    final seconds = twoDigits(totalSeconds % 60);

    return [
      if (totalSeconds ~/ 3600 > 0) hours,
      minutes,
      seconds,
    ].join(":");
  }

  HistoryText? _getCurrentTextSegment(Duration position) {
    HistoryText? newHistoryText;
    for (var historyText in history!.texts) {
      if (position >= Duration(seconds: historyText.startTime)) {
        newHistoryText = historyText;
      } else {
        break;
      }
    }
    return newHistoryText;
  }

  @override
  Widget build(BuildContext context) {
    final history = ref.watch(historyInfoProvider)[widget.historyId];
    final height = MediaQuery.of(context).size.height;
    const int audioPlayerHeight = 210;

    if (history == null) {
      return const SafeArea(
        child: Scaffold(
          body: Center(child: CircularProgressIndicator(strokeWidth: 2.0)),
        ),
      );
    }

    this.history = history;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            history.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFFE7C18B),
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
            Column(
              children: [
                if (currentHistoryImage != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 200,
                      child: PageView.builder(
                          itemCount: history.images?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                      currentHistoryImage!.imageUri,
                                      fit: BoxFit.contain, loadingBuilder:
                                          (context, child, loadingProgress) {
                                    if (loadingProgress != null) {
                                      return const SizedBox(
                                        height: 200,
                                        width: 200,
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      );
                                    }
                                    return FadeIn(child: child);
                                  }),
                                ),
                              ],
                            );
                          }),
                    ),
                  ),
                if (currentHistoryText == null)
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: height - audioPlayerHeight - 170),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: NeuBox(
                            child: Text(
                              'Presiona play para escuchar la historia',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (currentHistoryText != null)
                  Expanded(
                    child: FadeIn(
                      duration: const Duration(milliseconds: 700),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: NeuBox(
                            child: SingleChildScrollView(
                              child: Text(currentHistoryText!.content,
                                  style: const TextStyle(fontSize: 16),
                                  textAlign: TextAlign.justify),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 210),
              ],
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
                      'Escucha la historia',
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
                            _positionFormatted,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _remainderFormatted,
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
                        await _audioPlayer
                            .seek(Duration(seconds: value.toInt()));
                        setState(() {});
                      },
                      inactiveColor: Colors.black.withOpacity(0.2),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              _audioPlayer.seek(
                                _position - const Duration(seconds: 10),
                              );
                              setState(() {});
                            },
                            icon: const Icon(Icons.replay_10_outlined),
                          ),
                          SizedBox(
                            width: 48,
                            height: 48,
                            child: Center(
                              child: _isPlaying && !_isAudioLoaded
                                  ? const CircularProgressIndicator()
                                  : IconButton(
                                      onPressed: () {
                                        _isPlaying ? _pause() : _play();
                                      },
                                      icon: Icon(
                                        _isPlaying
                                            ? Icons.pause_circle_filled
                                            : Icons.play_circle_filled,
                                      ),
                                    ),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
