class Room {
  int? roomId;
  String? temp1;
  String? temp2;
  String? temp3;
  String? datesave;
  String? timesave;

  Room(
      {this.roomId,
      this.temp1,
      this.temp2,
      this.temp3,
      this.datesave,
      this.timesave});

  Room.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    temp1 = json['temp1'];
    temp2 = json['temp2'];
    temp3 = json['temp3'];
    datesave = json['datesave'];
    timesave = json['timesave'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['room_id'] = roomId;
    data['temp1'] = temp1;
    data['temp2'] = temp2;
    data['temp3'] = temp3;
    data['datesave'] = datesave;
    data['timesave'] = timesave;
    return data;
  }
}
