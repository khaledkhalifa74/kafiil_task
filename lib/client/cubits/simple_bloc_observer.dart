import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver{
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print(transition);
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print(change);
    }
  }
}