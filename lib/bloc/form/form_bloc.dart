import 'package:bloc/bloc.dart';
import 'package:dreadscout/model/form/form.dart';
import 'package:dreadscout/utility/namespaced_key.dart';

class FormChangeEvent<T> {
  NamespacedKey formElementKey;
  T newData;

  FormChangeEvent(this.formElementKey, this.newData);
}

class FormBloc extends Bloc<FormChangeEvent, Form> {
  FormBloc(Form initialState) : super(initialState);

  @override
  Stream<Form> mapEventToState(FormChangeEvent event) async* {
    state.data[event.formElementKey] = event.newData;
    yield state;
  }
}