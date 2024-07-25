// fetch data from the datasource! locally and from remote or locally or only from remote as per the project setup
// Just remember that we can combine local and remote if needed
import 'package:travel_app/features/data/data_sources/trip_local_datasource.dart';
import 'package:travel_app/features/data/model/trip_model.dart';
import 'package:travel_app/features/domain/entities/trip.dart';
import 'package:travel_app/features/domain/repositories/trip_repositories.dart';

class TripRepositoryImpl implements TripRepositories {
  final TripLocalDataSource source;

  TripRepositoryImpl({required this.source});
  @override
  Future<void> addTrip(Trip trip) async {
    final tripModel = TripModel.fromEntity(trip);
    source.addTrip(tripModel);
  }

  @override
  Future<List<Trip>> getTrips() async {
    final tripModel = source.getTrip();
    List<Trip> trip = tripModel.map((model) => model.toEntity()).toList();
    return trip;
  }

  @override
  Future<void> removeTrip(int tripId) async {
    source.removeTrip(tripId);
  }

  @override
  Future<void> updateTrip(Trip trip) async {
    final tripModel = TripModel.fromEntity(trip);

    source.updateTrip(tripModel);
  }
}
