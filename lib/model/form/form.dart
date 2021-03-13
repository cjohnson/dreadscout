import 'file:///C:/Workspace/dreadscout/lib/model/form/form_datum.dart';
import 'package:dreadscout/utility/namespaced_key.dart';

class Form {
  final NamespacedKey key;
  final Map<NamespacedKey, FormDatum> data;

  Form(this.key, this.data);
}