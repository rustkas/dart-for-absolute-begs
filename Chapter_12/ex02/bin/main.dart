import 'package:ex02/population.dart';

void main() {
  final springfield = Population('Springfield', 2343);
  final hanover = Population('Hanover', 4000);
  final both = springfield & hanover;
  print(both); // Prints: Springfield & Hanover has a population of 6343
  hanover + 1000;
  print(hanover); // Prints: Hanover has a population of 5000
}
