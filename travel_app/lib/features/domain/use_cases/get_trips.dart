import 'package:travel_app/features/domain/entities/trip.dart';
import 'package:travel_app/features/domain/repositories/trip_repositories.dart';

class GetTrips {
  final TripRepositories repository;

  GetTrips({
    required this.repository,
  });

  Future<List<Trip>> call() {
    return repository.getTrips();
  }

  getTrips() {}
}
