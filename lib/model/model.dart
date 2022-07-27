abstract class Model {
  late int id;
  static fromMap() {}
  toMap() {}
}

class SignUpUser {
  String name;
  String email;
  String password;
  String phone;
  bool man;
  int age;
  int current_weight;
  int future_weight;
  int height;
  String level;
  List<String> features;
  List<String> zones;

  SignUpUser(
      this.name,
      this.email,
      this.password,
      this.phone,
      this.man,
      this.age,
      this.current_weight,
      this.future_weight,
      this.height,
      this.level,
      this.features,
      this.zones);
}

class LoginUser {
  String login;
  String password;

  LoginUser(this.login, this.password);
}

class TokenData {
  late bool authorized;
  late int userId;
  late String email;
  late int exp;

  TokenData.decode(Map<String, dynamic> data)
      :authorized = data['authorized'],
        userId = data['userId'],
        email = data['email'],
        exp = data['exp'];
}

// Личный кабинет
class User {
  int id;
  String name;
  String email;
  String password;
  String phone;

  User({required this.id, required this.name, required this.email, required this.password, required this.phone});

  User.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    name = json['name'],
    email = json['email'],
    password = json['password'],
    phone = json['phone'];
}

class Exercise {
  int id;
  String name;
  String dmodel;
  double point; // time on video
  int workout_id;

  Exercise(this.id, this.name, this.dmodel, this.point, this.workout_id);

  Exercise.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    name = json['name'],
    dmodel = json['dmodel'],
    point = json['point'],
    workout_id = json['workout_id'];
}

class Workout extends Model{

  static String table = "workouts";

  int id;
  String name;
  String duration;
  String video;
  int complexity;
  String description;

  Workout({required this.id, required this.name, required this.duration, required this.video, required this.complexity, required this.description});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'duration': duration,
      'video': video,
      'complexity': complexity,
      'description': description
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  static Workout fromMap(Map<String, dynamic> map) {
    return Workout(
        id: map['id'],
        name: map['name'],
        duration: map['duration'],
        video: map['video'],
        complexity: map['complexity'],
        description: map['description']
    );
  }

}

