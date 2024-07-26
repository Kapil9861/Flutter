import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/features/trips/domain/entitites/trip.dart';

import '../providers/trip_provider.dart';

class UpdateTripScreen extends ConsumerStatefulWidget {
  const UpdateTripScreen({super.key, required this.trip});
  final Trip trip;

  @override
  ConsumerState<UpdateTripScreen> createState() => _UpdateTripScreenState();
}

class _UpdateTripScreenState extends ConsumerState<UpdateTripScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descController;
  late TextEditingController _locationController;
  late TextEditingController _pictureController;
  List<String> pictures = [];
  String profilPic =
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D";

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.trip.title);
    _descController = TextEditingController(text: widget.trip.description);
    _locationController = TextEditingController(text: widget.trip.location);
    _pictureController = TextEditingController(
        text: widget.trip.photos.isNotEmpty ? widget.trip.photos[0] : '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _locationController.dispose();
    _pictureController.dispose();
    super.dispose();
  }

  Future<int> getNextId() async {
    final prefs = await SharedPreferences.getInstance();
    int currentId = (prefs.getInt('nextTripId') ?? 0);
    await prefs.setInt('nextTripId', currentId + 1);
    return currentId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Fabrice 👋',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              'Travelling Today ?',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.network(
                profilPic,
                fit: BoxFit.cover,
                height: 60,
                width: 60,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
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
                      decoration:
                          const InputDecoration(labelText: 'Description'),
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
                          final updatedTrip = Trip(
                            title: _titleController.text,
                            description: _descController.text,
                            date: widget.trip.date,
                            location: _locationController.text,
                            photos: pictures.isNotEmpty
                                ? pictures
                                : widget.trip.photos,
                            id: widget.trip.id,
                          );
                          ref
                              .read(tripListNotifierProvider.notifier)
                              .updateTrip(updatedTrip);
                          ref
                              .read(tripListNotifierProvider.notifier)
                              .loadTrips();
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        'Update Trip',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
