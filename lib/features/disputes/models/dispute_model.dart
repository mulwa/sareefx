enum DisputeStatus { pending, complete }

enum DisputeFilter { all, pending, complete }

class Dispute {
  final DisputeStatus status;
  final String description;
  final DateTime date;

  Dispute({
    required this.status,
    required this.description,
    required this.date,
  });
}
