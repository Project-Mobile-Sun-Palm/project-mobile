class Images{
  late String _url;
  late String _name;

  Images(this._url, this._name);

  Images.fromJson(Map<String, Object?> json){
    _url = json['url'] as String;
    _name = json['name'] as String;
  }

  Images copyWith(String? url, String? name){
    return Images(
      url ?? _url,
      name ?? _name
    );
  }

  Map<String, Object?> toJson() {
    return {
      'url': _url,
      'name': _name,
    };
  }

  String getUrl(){
    return _url;
  }

  void setUrl(String? url){
    _url = url ?? _url;
  }

  String getName(){
    return _name.replaceAll(RegExp(r'_'), ' ');
  }

  void setName(String? name){
    _name = name ?? _name;
  }
}