import 'dart:convert';

class Dance {
  int id;
  var name;
  var choreographer;
  var rating;
  var level;
  var walls;
  var count;

  Dance.JSON(json) {
    this.id = json["index"];
    this.name = json["name"];
    this.choreographer = json["choreographer"];
    this.rating = json["rating"];
    this.level = json["level"];
    this.walls = json["walls"];
    this.count = json["count"];
  }

  Dance({this.id, this.name, this.choreographer, this.rating, this.level, this.walls, this.count});

}