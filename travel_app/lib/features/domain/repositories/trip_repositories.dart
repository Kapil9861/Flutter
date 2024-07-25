import 'package:travel_app/features/domain/entities/trip.dart';

abstract class TripRepositories {
  Future<List<Trip>> getTrips();
  Future<void> addTrip(Trip trip);
  Future<void> removeTrip(int tripId);
  Future<void> updateTrip(Trip trip);
}
