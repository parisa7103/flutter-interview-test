import 'package:flutter_interview_test/domain/validators/todo_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Check that added todo is not empty', () {
    expect(TodoValidator.isNotEmpty("123"), true);
    expect(TodoValidator.isNotEmpty("abc"), true);
    expect(TodoValidator.isNotEmpty(""), false);
    expect(TodoValidator.isNotEmpty("     "), false);
  });

  test('Check that added to-do does not contain any special characters', () {
    expect(TodoValidator.containsSpecialCharacters("hello"), false);
    expect(TodoValidator.containsSpecialCharacters("hello 1_"), true);
    expect(TodoValidator.containsSpecialCharacters("@_@"), true);
  });

  // write a test for deleting a todo
}
