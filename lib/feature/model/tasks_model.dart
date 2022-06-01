import 'package:equatable/equatable.dart';

class Tasks extends Equatable {
  final String title;
  final String description;

  bool? isDone;
  bool? isDeleted;
  Tasks({
    required this.title,
    required this.description,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Tasks copyWith({
    String? title,
    String? description,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Tasks(
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Tasks.fromMap(Map<String, dynamic> map) {
    return Tasks(
      title: map['title'] ?? '',
      description: map['description'],
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
    );
  }

  @override
  List<Object?> get props => [title, description, isDone, isDeleted];
}
