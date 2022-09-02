class Detail {
  final String title;
  final List<PartDetail> partDetails;

  Detail({
    required this.title,
    required this.partDetails,
  });
}

class PartDetail {
  final String title;
  final String condition;
  final String action;

  PartDetail(
      {required this.title, required this.condition, required this.action});
}
