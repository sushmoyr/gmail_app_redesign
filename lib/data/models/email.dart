import 'dart:math';

import 'package:gmail_app_redesign/data/models/user.dart';

class Email {
  final User sender;
  final String subject;
  final String body;
  final DateTime time;
  final bool starred;
  final bool unread;

  Email(
    this.sender,
    this.subject,
    this.body,
    this.time, {
    this.starred = false,
    this.unread = false,
  });
}

extension ExclusiveRandom on Random {
  int integer(int maxLimit) {
    int value = nextInt(maxLimit);
    return (value == 0) ? 0 : value;
  }
}

DateTime _getRandomDateTime() {
  Random random = Random();
  int month = random.integer(12);
  int day = random.integer(28);
  int hour = random.integer(24);
  int minute = random.integer(59);
  int second = random.integer(59);
  return DateTime(2022, month, day, hour, minute, second);
}

User _getRandomUser() {
  int index = Random().nextInt(users.length);
  return users[index];
}

List<Email> emails = [
  Email(
    _getRandomUser(),
    'Meeting at afternoon',
    'Attend the executive meeting tomorrow at afternoon meeting tomorrow.',
    _getRandomDateTime(),
    starred: Random().nextBool(),
    unread: Random().nextBool(),
  ),
  Email(
    _getRandomUser(),
    'Review Products',
    'Review and report the state of the products currently on development. This task should be finished withing 3 days.',
    _getRandomDateTime(),
    starred: Random().nextBool(),
    unread: Random().nextBool(),
  ),
  Email(
    _getRandomUser(),
    'Attend birthday party',
    'Hello Brother. I would like you to my fiance\'s Birthday party this weekend. Please make time and don\'t forget.',
    _getRandomDateTime(),
    starred: Random().nextBool(),
    unread: Random().nextBool(),
  ),
  Email(
    _getRandomUser(),
    'Exclusive offer for you',
    'There is an exclusive offer only for you. Check the attachment of the email.',
    _getRandomDateTime(),
    starred: Random().nextBool(),
    unread: Random().nextBool(),
  ),
  Email(
    _getRandomUser(),
    'Research',
    'The paper will be published in a conference soon. Call me when you are free.',
    _getRandomDateTime(),
    starred: Random().nextBool(),
    unread: Random().nextBool(),
  ),
  Email(
    _getRandomUser(),
    'Appointment reminder',
    'Reminder of the appointment you scheduled after 3 days. Appointment is not refundable at this period.',
    _getRandomDateTime(),
    starred: Random().nextBool(),
    unread: Random().nextBool(),
  ),
  Email(
    _getRandomUser(),
    'Electricity Bill',
    'Your electricity bill report is attached on this email.',
    _getRandomDateTime(),
    starred: Random().nextBool(),
    unread: Random().nextBool(),
  ),
  Email(
    _getRandomUser(),
    'Revision',
    'The last commit you made need a revision. Please revise and commit again.',
    _getRandomDateTime(),
    starred: Random().nextBool(),
    unread: Random().nextBool(),
  ),
  Email(
    _getRandomUser(),
    'Review documents',
    'The documents need to be reviewed fast.',
    _getRandomDateTime(),
    starred: Random().nextBool(),
    unread: Random().nextBool(),
  ),
  Email(
    _getRandomUser(),
    'Schedule a meeting',
    'Schedule a meeting with xxx for the upcoming project.',
    _getRandomDateTime(),
    starred: Random().nextBool(),
    unread: Random().nextBool(),
  ),
  Email(
    _getRandomUser(),
    'New Regulations',
    'We have updated our rules and regulations. The attachment of this email contains the updated regulations.',
    _getRandomDateTime(),
    starred: Random().nextBool(),
    unread: Random().nextBool(),
  ),
];
