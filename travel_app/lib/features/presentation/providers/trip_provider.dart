import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:travel_app/features/data/data_sources/trip_local_datasource.dart';
import 'package:travel_app/features/data/model/trip_model.dart';
import 'package:travel_app/features/data/repositories/trip_repository_impl.dart';
import 'package:travel_app/features/domain/entities/trip.dart';
import 'package:travel_app/features/domain/repositories/trip_repositories.dart';
import 'package:travel_app/features/domain/use_cases/add_trip.dart';
import 'package:travel_app/features/domain/use_cases/get_trips.dart';
import 'package:travel_app/features/domain/use_cases/remove_trip.dart';
import 'package:travel_app/features/domain/use_cases/update_trip.dart';

final tripLocalDataSourceProvider = Provider<TripLocalDataSource>((reference) {
  final Box<TripModel> tripBox = Hive.box('trip');
  return TripLocalDataSource(tripBox: tripBox);
});

final tripRepositoryProvider = Provider<TripRepositories>((ref) {
  final localDataSource = ref.read(tripLocalDataSourceProvider);
  return TripRepositoryImpl(source: localDataSource);
});

final addTripProvider = Provider<AddTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return AddTrip(repository: repository);
});

final getTripProvider = Provider<GetTrips>((ref) {
  final repository = ref.read(tripRepositoryProvider);

  return GetTrips(repository: repository);
});

final removeTripProvider = Provider<RemoveTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return RemoveTrip(repository: repository);
});

final updateTripProvider = Provider<UpdateTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return UpdateTrip(repository: repository);
});

// TripListNotifierProvider that retrieves the trip list from the repository
final tripListNotifierProvider =
    StateNotifierProvider<TripListNotifier, List<Trip>>((ref) {
  final getTrips = ref.read(getTripProvider);
  final addTrip = ref.read(addTripProvider);
  final removeTrip = ref.read(removeTripProvider);
  final updateTrip = ref.read(updateTripProvider);
  return TripListNotifier(getTrips, addTrip, removeTrip, updateTrip);
});

class TripListNotifier extends StateNotifier<List<Trip>> {
  final GetTrips _getTrips;
  final AddTrip _addTrip;
  final RemoveTrip _removeTrip;
  final UpdateTrip _updateTrip;

  TripListNotifier(
      this._getTrips, this._addTrip, this._removeTrip, this._updateTrip)
      : super([]);

  Future<void> addNewTrip(Trip trip) async {
    await _addTrip.addTrip(trip);
    await loadTrip();
  }

  Future<void> removeTrip(int tripId) async {
    await _removeTrip.removeTrip(tripId);
    await loadTrip();
  }

  Future<void> updateTrip(Trip trip) async {
    await _updateTrip.updateTrip(trip);
    await loadTrip();
  }

  Future<void> loadTrip() async {
    final trips = await _getTrips.getTrips();
    state = trips;
  }
}
