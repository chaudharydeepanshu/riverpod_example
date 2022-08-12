import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dependent_class.dart';
import 'independent_class.dart';
import 'models.dart';
import 'providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenCreator(
        screen: Screen(screenColor: Colors.yellow),
      ),
    );
  }
}

class ScreenCreator extends ConsumerWidget {
  const ScreenCreator({Key? key, this.screen}) : super(key: key);

  final Screen? screen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final IndependentClass readIndependentClassStateProviderValue =
        ref.read(independentClassStateProvider);
    readIndependentClassStateProviderValue.initialiseScreenFromCreator(
        screen: screen);

    final DependentClass readDependentClassStateProviderValue =
        ref.read(dependentClassStateProvider);
    readDependentClassStateProviderValue.initialiseScreenButton();

    return const HomeScreen();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final IndependentClass watchIndependentClassStateProviderValue =
            ref.watch(independentClassStateProvider);

        final DependentClass watchDependentClassStateProviderValue =
            ref.watch(dependentClassStateProvider);

        return Container(
          color: watchIndependentClassStateProviderValue.screen.screenColor!,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    watchIndependentClassStateProviderValue.screen.screenText!),
                ElevatedButton(
                  onPressed: () =>
                      watchDependentClassStateProviderValue.onButtonOnTap(),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          watchDependentClassStateProviderValue
                              .screenButton.screenButtonColor)),
                  child: Text(watchDependentClassStateProviderValue
                      .screenButton.screenButtonText),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
