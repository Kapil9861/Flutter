import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entitites/trip.dart';
import '../providers/trip_provider.dart';

// ignore: must_be_immutable
class AddTripScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController(text: "City 1");
  final _descController = TextEditingController(text: "Best city ever");
  final _locationController = TextEditingController(text: "Paris");
  final _pictureController = TextEditingController(
      text:
          'https://images.unsplash.com/photo-1499856871958-5b9627545d1a?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D');
  List<String> pictures = [];
  Future<int> getNextId() async {
    final prefs = await SharedPreferences.getInstance();
    int currentId = (prefs.getInt('nextTripId') ?? 0);
    await prefs.setInt('nextTripId', currentId + 1);
    return currentId;
  }

  AddTripScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var dateTime = DateFormat('EEE, M/d/yyyy h:mm a').format(DateTime.now());
    print(DateTime.now());
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.green,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(labelText: 'Title'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: TextFormField(
                    controller: _descController,
                    decoration: const InputDecoration(labelText: 'Description'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: TextFormField(
                    controller: _locationController,
                    decoration: const InputDecoration(labelText: 'Location'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: TextFormField(
                    controller: _pictureController,
                    decoration: const InputDecoration(labelText: 'Photo'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 14, 7, 229),
                      ),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () async {
                      pictures.add(_pictureController.text);
                      if (_formKey.currentState!.validate()) {
                        final id = await getNextId();
                        final newTrip = Trip(
                          title: _titleController.text,
                          description: _descController.text,
                          date: DateTime.now(),
                          location: _locationController.text,
                          photos: pictures,
                          id: id,
                        );
                        ref
                            .read(tripListNotifierProvider.notifier)
                            .addNewTrip(newTrip);
                        ref.read(tripListNotifierProvider.notifier).loadTrips();
                      }
                    },
                    child: const Text(
                      'Add Trip',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
