class User {
  int id;
  String name;
  String surname;
  String mail;
  String phone;
  String password;
  String districtID;
  String token;
  String userType;

  User.forRegister(this.name, this.surname, this.mail, this.phone,
      this.password, this.districtID);
  User.forLogin(this.mail, this.password);
  User();

  Map toJsonRegister() {
    return {
      "name": name,
      "surname": surname,
      "mail": mail,
      "phone": phone,
      "password": password,
      "districtID": districtID
    };
  }


}
