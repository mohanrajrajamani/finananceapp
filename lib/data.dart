
import 'package:flutter/cupertino.dart';
import 'package:my_sample_project/speciality.dart';

List<SpecialityModel> getSpeciality(){

  List<SpecialityModel> specialities = new List<SpecialityModel>();
  SpecialityModel specialityModel = new SpecialityModel();

  //1
  specialityModel.noOfDoctors = 10;
  specialityModel.speciality = "Cough & Cold";
  specialityModel.imgAssetPath = "assets/images/card_bg_1.png";
  specialityModel.backgroundColor = Color(0xffFBB97C);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  //2
  specialityModel.noOfDoctors = 17;
  specialityModel.speciality = "Heart Specialist";
  specialityModel.imgAssetPath = "assets/images/card_bg_2.png";
  specialityModel.backgroundColor = Color(0xffF69383);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  return specialities;
}