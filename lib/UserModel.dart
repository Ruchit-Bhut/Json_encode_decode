class UserModel{
  late String id;
  late String fullname;
  late String email;

  UserModel({required this.id,required this.fullname,required this.email});

  //Map to Object
  UserModel.fromMap(Map<String,dynamic> map ){
    id = map['id'];
    fullname = map['fullname'];
    email = map['email'];
  }

  //Object to Map
  Map<String,dynamic> toMap(){
    return{
      "id" : id,
      "fullname" : fullname,
      "email" : email,
    };
  }
}