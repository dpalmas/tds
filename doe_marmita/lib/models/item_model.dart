class Item {
  String title;
  double range;
  double value;
  int star;
  String imgUrl;

  Item({this.title, this.range, this.value, this.star, imgUrl});

  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    range = json['range'];
    value = json['value'];
    star = json['star'];

    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['range'] = this.range;
    data['imgUrl'] = this.imgUrl;
    return data;
  }
}
