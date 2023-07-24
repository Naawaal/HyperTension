class BpPrModel {
  int? bp;
  String? date;
  int? pr;

  BpPrModel({this.bp, this.date, this.pr});

  BpPrModel.fromJson(Map<String, dynamic> json) {
    bp = json['bp'];
    date = json['date'];
    pr = json['pr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bp'] = bp;
    data['date'] = date;
    data['pr'] = pr;
    return data;
  }
}
