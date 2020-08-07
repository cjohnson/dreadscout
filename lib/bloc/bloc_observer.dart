import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';

class DreadScoutBlocObserver extends BlocObserver {
  final Logger systemLogger;

  DreadScoutBlocObserver(this.systemLogger);

  @override
  void onTransition(Bloc bloc, Transition transition) {
    systemLogger.info('${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    systemLogger.info('${cubit.runtimeType} $error $stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}