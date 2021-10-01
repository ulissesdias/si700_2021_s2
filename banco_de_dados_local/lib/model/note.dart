class Note {
  String _title;
  String _description;

  Note() {
    _title = "";
    _description = "";
  }

  Note.fromMap(map) {
    this._title = map["title"];
    this._description = map["description"];
  }

  String get title => _title;
  String get description => _description;

  set title(String newTitle) {
    if (newTitle.length > 0) {
      this._title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length > 0) {
      this._description = newDescription;
    }
  }

  toMap() {
    var map = Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    return map;
  }
}
