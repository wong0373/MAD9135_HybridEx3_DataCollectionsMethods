import 'dart:convert';

class Students {
  List<Map<String, String>> people;

  Students(this.people);

  void sort(String field) {
    people.sort((a, b) => a[field]!.compareTo(b[field]!));
  }

  void output() {
    for (var person in people) {
      print(person);
    }
  }

  void plus(Map<String, String> person) {
    people.add(person);
  }

  void remove(String field, String value) {
    people.removeWhere((person) => person[field] == value);
  }
}

void main() {
  String json = '''
[
  {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
  {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
  {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
  {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
]
''';
  var people = List<Map<String, String>>.from(
      jsonDecode(json).map((person) => Map<String, String>.from(person)));

  Students students = Students(people);

  print('Initial list of students');
  students.output();

  print('Sort students by:');
  students.sort('first');
  students.output();

  print('Add a new student:');
  students.plus({
    "first": "Terry",
    "last": "Wong",
    "email": "wong0373@algonquinlive.com"
  });
  students.output();

  print('remove a student:');
  students.remove("first", "Adesh");
  students.output();
}
