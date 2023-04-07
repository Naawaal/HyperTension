class DailyCheckModel {
  int? bp;
  int? pr;
  String? date;

  DailyCheckModel({this.bp, this.pr, this.date});

  DailyCheckModel.fromJson(Map<String, dynamic> json) {
    bp = json['bp'];
    pr = json['pr'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bp'] = bp;
    data['pr'] = pr;
    data['date'] = date;
    return data;
  }
}
