import 'package:flutter/material.dart';
import 'package:my_sample_project/model/data.dart';
import 'package:my_sample_project/model/speciality.dart';


String selectedCategorie= "Adults";

class DashboardTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DashboardTabState();
}

class DashboardTabState extends State {
  List<String> categories = ["Adults", "Childrens", "Womens", "Mens"];
  List<SpecialityModel> specialities;

  @override
  void initState() {
    super.initState();

    specialities = getSpeciality();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Image.asset('assets/images/circular_image.png',
                width: double.infinity,
                colorBlendMode: BlendMode.dstATop,
                fit: BoxFit.fill),
          ),
          new Container(
            child: new Column(
              children: <Widget>[
                SizedBox(
                  height: 40.00,
                ),
                new Row(
                  children: <Widget>[
                    Expanded(
                      flex: 10,
                      child: ListTile(
                        title: Text(
                          'Aleena',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Proxima',
                              color: Colors.white),
                        ),
                        subtitle: Text(
                          'Good Morning',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/person4.png'),
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '29 February, Friday',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 250,
                child: ListView.builder(
                    itemCount: specialities.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return SpecialistTile(
                        imgAssetPath: specialities[index].imgAssetPath,
                        speciality: specialities[index].speciality,
                        noOfDoctors: specialities[index].noOfDoctors,
                        backColor: specialities[index].backgroundColor,
                      );
                    }),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
        ],
      ),
    );
  }
}


class SpecialistTile extends StatelessWidget {

  String imgAssetPath;
  String speciality;
  int noOfDoctors;
  Color backColor;
  SpecialistTile({@required this.imgAssetPath,@required this.speciality
    ,@required this.noOfDoctors, @required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(24)
      ),
      padding: EdgeInsets.only(top: 16,right: 16,left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(speciality, style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),),
          SizedBox(height: 6,),
          Text("$noOfDoctors Doctors", style: TextStyle(
            color: Colors.white,
            fontSize: 13
          ),),
          Image.asset(imgAssetPath, height: 160,fit: BoxFit.fitHeight,)
        ],
      ),
    );
  }
}