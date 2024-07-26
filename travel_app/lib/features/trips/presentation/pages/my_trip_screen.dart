import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/features/trips/presentation/pages/update_trip.dart';

import '../providers/trip_provider.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/travel_card.dart';

class MyTripsScreen extends ConsumerWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripList = ref.watch(tripListNotifierProvider);

    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          CustomSearchBar(),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: tripList.length,
            itemBuilder: (context, index) {
              final trip = tripList[index];
              return TravelCard(
                imageUrl: trip.photos[0],
                title: trip.title,
                description: trip.description,
                date: trip.date,
                location: trip.location,
                onDelete: () {
                  ref.read(tripListNotifierProvider.notifier).removeTrip(index);
                  ref.read(tripListNotifierProvider.notifier).loadTrips();
                },
                onUpdate: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return UpdateTripScreen(trip: trip);
                      },
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
