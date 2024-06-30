class DataSheet{
  final int date;
  final String monthName;
  final String subjName;
  final String dayName;
  final String timeName;

  DataSheet(this.date, this.monthName, this.subjName, this.dayName, this.timeName);
}

List<DataSheet> dataSheet = [
  DataSheet(11, "Jan", "Computer Science", "Monday", "9:00am"),
  DataSheet(12, "Jan", "Software Lab", "Tuesday", "10:00am"),
  DataSheet(13, "Jan", "Mathematics", "Wednesday", "9:30am"),
  DataSheet(14, "Jan", "Social Science", "Thursday", "11:00am"),
  DataSheet(17, "Jan", "Chemistry", "Sunday", "9:00am"),
  DataSheet(18, "Jan", "Physics", "Monday", "10:30am"),
];