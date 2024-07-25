import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/features/data/model/trip_model.dart';

class TripLocalDataSource {
  final Box<TripModel> tripBox;

  TripLocalDataSource({required this.tripBox});

  List<TripModel> getTrip() {
    return tripBox.values.toList();
  }

  void addTrip(TripModel model) {
    tripBox.put(model.id, model);
  }

  void removeTrip(int tripId) {
    tripBox.delete(tripId);
  }

  void updateTrip(TripModel model) {
    tripBox.putAt(model.id, model);
  }
}
