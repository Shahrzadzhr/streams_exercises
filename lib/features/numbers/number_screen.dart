import 'package:flutter/material.dart';
import 'package:streams_exercises/features/numbers/number_repository.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({
    super.key,
    required this.numberRepository,
  });

  final NumberRepository numberRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Screen'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: numberRepository.getNumberStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading numbers...");
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return Text('Current number: ${snapshot.data}');
            } else {
              return const Text("No more numbers.");
            }
          },
        ),
      ),
    );
  }
}
