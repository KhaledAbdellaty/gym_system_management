import 'package:gym_managment/core/object_box.dart';
import 'package:gym_managment/data/model/subscribe.dart';
import '../../objectbox.g.dart';

class SusbcribesRepo {
  SusbcribesRepo._();
  static SusbcribesRepo? _instance;

  static SusbcribesRepo get instance => _instance ?? SusbcribesRepo._();

  List<SubscribeModel> getSubscribes() {
    return ObjectBox.subscribeBox.getAll();
  }

  Stream<List<SubscribeModel>> getSubscribesStream() {
    final builder = ObjectBox.subscribeBox.query()..order(SubscribeModel_.id);
    return builder.watch(triggerImmediately: true).map((event) => event.find());
  }
}
