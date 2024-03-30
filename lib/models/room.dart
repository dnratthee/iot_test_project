class Room {
  int? roomId;
  late String? temp1;
  late String? temp2;
  late String? temp3;
  late String datesave;
  late String timesave;

  Room(
      {this.roomId,
      this.temp1,
      this.temp2,
      this.temp3,
      required this.datesave,
      required this.timesave});

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
