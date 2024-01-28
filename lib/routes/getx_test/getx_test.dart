import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/routes/getx_test/controllers/my_controller.dart';
import 'package:flutter_example/routes/getx_test/state_test_with_tasks.dart';
import 'package:get/get.dart';

class GetXTest extends StatefulWidget {
  const GetXTest({super.key});

  @override
  State<GetXTest> createState() => _GetXTestState();
}

class _GetXTestState extends State<GetXTest> {
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
      case 2:
        page = const StateTestWithTasks();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('GetX Test'),
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
                  NavigationRailDestination(
                    icon: Icon(Icons.checklist),
                    label: Text('State Test with Tasks'),
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
    var c = Get.put(MyController());

    if (c.favourites.isEmpty) {
      return const Center(
        child: Text('No Favourite found!!!'),
      );
    }

    return Obx(
      () => ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text('You have ${c.favourites.length} favorite'),
          ),
          for (var pair in c.favourites)
            ListTile(
              leading: IconButton(
                icon: const Icon(Icons.delete_outline, semanticLabel: 'Delete'),
                onPressed: () {
                  c.removeFavorite(pair);
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
    var c = Get.put(MyController());

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
                  BigCard(pair: c.current.value),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          c.toggleFavorite();
                        },
                        icon: Icon(c.getFavouriteIcon()),
                        label: Text('Like'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          c.getNext();
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
    var c = Get.put(MyController());
    c.historyListKey = _key;

    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      // This blend mode takes the opacity of the shader (i.e. our gradient)
      // and applies it to the destination (i.e. our animated list).
      blendMode: BlendMode.dstIn,
      child: AnimatedList(
        key: _key,
        reverse: true,
        padding: EdgeInsets.only(top: 100),
        initialItemCount: c.history.length,
        itemBuilder: (context, index, animation) {
          final pair = c.history[index];
          return SizeTransition(
            sizeFactor: animation,
            child: Center(
              child: Obx(
                () => TextButton.icon(
                  onPressed: () {
                    c.toggleFavorite(pair);
                  },
                  icon: c.favourites.contains(pair)
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
