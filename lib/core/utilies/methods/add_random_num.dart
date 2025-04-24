import 'dart:math';

int generateRandomInt() {
  final random = Random();
  // Generate a random integer between 0 (inclusive) and a large number (exclusive)
  // You can adjust the upper bound as needed.
  return random.nextInt(120);
}