import 'LocationData.dart';

class GlobalData {
  List<LocationData> cityList;
  void create() {
    cityList = new List();
    cityList.add(new LocationData("Amsterdam", "Netherlands", "sunny", 30, 23, []));
    cityList.add(new LocationData("Shanghai", "China", "sunny", 30, 127, []));
    cityList.add(new LocationData("Beijing", "China", "sunny", 30, 215, []));
    cityList.add(new LocationData("Karachi", "Pakistan", "sunny", 30, 164, []));
    cityList.add(new LocationData("Istanbul", "Turkey", "sunny", 30, 114, []));
    cityList.add(new LocationData("Dhaka", "Bangladesh", "sunny", 30, 184, []));
    cityList.add(new LocationData("Tokyo", "Japan", "sunny", 30, 70, []));
    cityList.add(new LocationData("Moscow", "Russia", "sunny", 30, 60, []));
    cityList.add(new LocationData("Manila", "Philippines", "sunny", 30, 55, []));
    cityList.add(new LocationData("Tianjin", "China", "sunny", 30, 194, []));
    cityList.add(new LocationData("Bucharest", "Romania", "sunny", 30, 74, []));
  }
}