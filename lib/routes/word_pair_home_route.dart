import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/routes/getx_test/my_controller.dart';
import 'package:get/get.dart';

class WordPairRoute extends StatefulWidget {
  const WordPairRoute({super.key});

  @override
  State<WordPairRoute> createState() => _WordPairRouteState();
}

class _WordPairRouteState extends State<WordPairRoute> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const GeneratorPage();
        break;
      case 1:
        page = const FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Word Pair Page'),
          leading: BackButton(onPressed: _onBackPressed),
        ),
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }

  void _onBackPressed() {
    Get.delete<MyController>();
    Navigator.maybePop(context);
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myController = Get.put(MyController());
    var favourites = myController.favourites;

    if (favourites.isEmpty) {
      return const Center(
        child: Text('No Favourite found!!!'),
      );
    }

    return Obx(
      () => ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text('You have ${myController.favourites.length} favorite'),
          ),
          for (var pair in favourites)
            ListTile(
              leading: IconButton(
                icon: const Icon(Icons.delete_outline, semanticLabel: 'Delete'),
                onPressed: () {
                  myController.removeFavorite(pair);
                },
              ),
              title: Text(pair.asPascalCase),
            ),
        ],
      ),
    );
  }
}

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var myController = Get.put(MyController());

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 3,
            child: HistoryListView(),
          ),
          Obx(() => Column(
                children: [
                  const SizedBox(height: 10),
                  BigCard(pair: myController.current.value),
                  const SizedBox(height: 10),
                  Text('history:  ${myController.history.length}'),
                  Text('favourites: ${myController.favourites.length}'),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          myController.toggleFavorite();
                        },
                        icon: Icon(myController.getFavouriteIcon()),
                        label: Text('Like'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          myController.getNext();
                        },
                        child: Text('Next'),
                      ),
                    ],
                  ),
                ],
              )),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.onPrimary);

    return Card(
      color: theme.colorScheme.primary,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asPascalCase,
          style: style,
          semanticsLabel: pair.asPascalCase,
        ),
      ),
    );
  }
}

class HistoryListView extends StatefulWidget {
  const HistoryListView({Key? key}) : super(key: key);

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  /// Needed so that [MyAppState] can tell [AnimatedList] below to animate
  /// new items.
  final _key = GlobalKey();
  static const Gradient _maskingGradient = LinearGradient(
    // This gradient goes from fully transparent to fully opaque black...
    colors: [Colors.transparent, Colors.black],
    // ... from the top (transparent) to half (0.5) of the way to the bottom.
    stops: [0.0, 0.5],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    var myController = Get.put(MyController());
    myController.historyListKey = _key;

    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      // This blend mode takes the opacity of the shader (i.e. our gradient)
      // and applies it to the destination (i.e. our animated list).
      blendMode: BlendMode.dstIn,
      child: AnimatedList(
        key: _key,
        reverse: true,
        padding: EdgeInsets.only(top: 100),
        initialItemCount: myController.history.length,
        itemBuilder: (context, index, animation) {
          final pair = myController.history[index];
          return SizeTransition(
            sizeFactor: animation,
            child: Center(
              child: Obx(
                () => TextButton.icon(
                  onPressed: () {
                    myController.toggleFavorite(pair);
                  },
                  icon: myController.favourites.contains(pair)
                      ? const Icon(Icons.favorite, size: 12)
                      : const SizedBox(),
                  label: Text(
                    pair.asLowerCase,
                    semanticsLabel: pair.asPascalCase,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
