import 'package:flutter/material.dart';
import 'package:streams_exercises/features/time/time_repository.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({
    super.key,
    required this.timeRepository,
  });

  final TimeRepository timeRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Screen'),
      ),
      body: Center(
        child: StreamBuilder<DateTime>(
          stream: timeRepository.dateTimeStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading time...");
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final time = snapshot.data!;
              return Text(
                  'Current time: ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}',
                  style: Theme.of(context).textTheme.headlineMedium);
            } else {
              return const Text("No time available.");
            }
          },
        ),
      ),
    );
  }
}
