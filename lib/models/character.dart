import 'package:exam/models/power.dart';

class characters {
  String gender = '';
  String img = '';
  String sId = '';
  String name = '';
  List<Powers> powers  = [];
  int iV = 0;

  characters(
      {
      required this.gender, 
      required this.img,
      required this.sId,
      required this.name, 
      required this.powers, 
      required this.iV
        });

  characters.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    img = json['img'];
    sId = json['_id'];
    name = json['name'];
    if (json['psiPowers'] != null) {
      powers = [];
      json['psiPowers'].forEach((v) {
        powers.add(new Powers.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] =  this.gender;
    data['img'] =  this.img;
    data['_id'] =  this.sId;
    data['name'] =  this.name;
    data['psiPowers'] =  this.powers.map((v) => v.toJson()).toList();
    data['__v'] =  this.iV;
    return data;
  }
}