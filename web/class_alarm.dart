//get para o servidor passando como param email e retorna 'response'
//que sera um json com os alarme e todas as suas informacoes
import 'dart:convert';
var response = {};
var jsonData = JSON.decode(response);
var a1 = new Alarm.fromJson(jsonData);

class Alarm {
  String label;
  num lat;
  num long;
  num radio;
  String address;
  bool active;

  Alarm(this.label, this.lat, this.long, this.address, this.active);

  // Named constructor
  Alarm.fromJson(Map json) {
    label = json['label'];
    lat = json['lat'];
    long = json['long'];
    radio = json['radio'];
    address = json['address'];
    active = json['active'];
    //...
  }
  num     get latitude                => lat;
          set latitude(num value)     => lat = value;
  num     get distance                => radio;
          set distance(num value)     => radio = value;
  num     get longitude               => long;
          set longitude(num value)    => long = value;
  String  get name                    => label;
          set name(String value)      => label = value;
  String  get local                   => address;
          set local(String value)     => address = value;
  bool    get status                  => active;
          set status(bool value)      => active = value;
}