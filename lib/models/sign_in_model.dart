class Signin {
  String state;
  String no_rkm_medis;

  Signin({this.state, this.no_rkm_medis});

  Signin.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    no_rkm_medis = json['no_rkm_medis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['no_rkm_medis'] = this.no_rkm_medis;
    return data;
  }
}
