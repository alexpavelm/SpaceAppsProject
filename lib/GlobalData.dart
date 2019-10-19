import 'LocationData.dart';

class GlobalData {
  List<LocationData> cityList;
  void create() {
    cityList = new List();
    cityList.add(new LocationData("Amsterdam", "Netherlands", ["rainy", "rainy", "rainy", "cloudy", "cloudy"], [13, 15, 13, 13, 15], 23, []));
    cityList.add(new LocationData("Shanghai", "China", ["sunny", "cloudy", "cloudy", "cloudy", "rainy"], [20, 23, 23, 20, 23], 127, []));
    cityList.add(new LocationData("Beijing", "China", ["sunny", "sunny", "sunny", "cloudy", "cloudy"], [18, 16, 18, 19, 11], 215, []));
    cityList.add(new LocationData("Karachi", "Pakistan", ["sunny", "sunny", "sunny", "sunny", "sunny"], [36, 35, 34, 34, 34], 164, []));
    cityList.add(new LocationData("Istanbul", "Turkey", ["sunny", "cloudy", "sunny", "rainy", "rainy"], [20, 20, 19, 19, 19], 114, []));
    cityList.add(new LocationData("Dhaka", "Bangladesh", ["cloudy", "cloudy", "sunny", "cloudy", "sunny"], [29, 29, 29, 28, 29], 184, []));
    cityList.add(new LocationData("Tokyo", "Japan", ["cloudy", "cloudy", "rainy", "cloudy", "cloudy"], [25, 23, 16, 23, 20], 70, []));
    cityList.add(new LocationData("Moscow", "Russia", ["cloudy", "cloudy", "cloudy", "cloudy", "cloudy"], [14, 14, 8, 14, 11], 60, []));
    cityList.add(new LocationData("Manila", "Philippines", ["rainy", "rainy", "sunny", "sunny", "sunny"], [31, 30, 30, 30, 29], 55, []));
    cityList.add(new LocationData("Tianjin", "China", ["cloudy", "sunny", "cloudy", "cloudy", "cloudy"], [22, 20, 22, 24, 17], 194, []));
    cityList.add(new LocationData("Bucharest", "Romania", ["sunny", "sunny", "sunny", "sunny", "sunny"], [24, 22, 23, 21, 21], 74, []));
  }
}