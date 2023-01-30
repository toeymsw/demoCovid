class CovidData {
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  
  CovidData({this.cases, this.todayCases, this.deaths, this.todayDeaths,this.recovered});
  factory CovidData.fromJson(Map<String, dynamic> json) {
    return CovidData(
      cases: json["cases"],
      todayCases: json["todayCases"],
      deaths: json["deaths"],
      todayDeaths: json["todayDeaths"],
      recovered: json["recovered"],
    );
  }
}
