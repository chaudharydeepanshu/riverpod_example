import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dependent_class.dart';
import 'independent_class.dart';

final independentClassStateProvider =
    ChangeNotifierProvider((ref) => IndependentClass());

final dependentClassStateProvider = ChangeNotifierProvider((ref) {
  // We use `ref.watch` to read to another provider, and we pass it the provider
  // that we want to consume. Here: independentClassStateProvider
  final IndependentClass watchIndependentClassStateProviderValue =
      ref.watch(independentClassStateProvider);

  // We can then use the result to do something based on the value of `independentClassStateProvider`.
  return DependentClass(
      watchIndependentClassStateProviderValue:
          watchIndependentClassStateProviderValue);
});
