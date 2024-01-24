import "package:flutter/material.dart";

class Flux {
  final int id;
  final DateTime completedDate;
  final int seconds;

  const Flux({
    required this.id,
    required this.completedDate,
    required this.seconds,
  });
}
