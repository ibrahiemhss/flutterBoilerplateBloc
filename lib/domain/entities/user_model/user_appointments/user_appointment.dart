class UserAppointments {
  var appointment_id;
  var doctor_name;
  var doctor_specialization;
  var doctor_phone;
  var clinic_address;
  var observations;
  var doctor_image;
  var date_and_time;
  var is_confirmed;
  var price;
  var created_at;
  var doctor_id;
  var status;
  var status_id;
  var serial_number;
  var period_index;
  var main_complaint;
  var stars;
  bool available_for_chat;

  UserAppointments({
    this.appointment_id,
    this.doctor_name,
    this.doctor_specialization,
    this.doctor_phone,
    this.clinic_address,
    this.observations,
    this.doctor_image,
    this.date_and_time,
    this.is_confirmed,
    this.price,
    this.created_at,
    this.doctor_id,
    this.status_id,
    this.status,
    this.serial_number,
    this.period_index,
    this.main_complaint,
    this.stars,
    this.available_for_chat,
  });

  factory UserAppointments.fromJson(Map<String, dynamic> json) {
    return new UserAppointments(
      appointment_id: json['appointment_id'],
      doctor_name: json['doctor_name'],
      doctor_id: json['doctor_id'],
      doctor_specialization: json['doctor_specialization'],
      doctor_phone: json['doctor_phone'],
      clinic_address: json['clinic_address'],
      observations: json['observations'],
      doctor_image: json['doctor_image'],
      date_and_time: json['date_and_time'],
      is_confirmed: json['is_confirmed'],
      price: json['price'],
      created_at: json['created_at'],
      status: json['status'],
      status_id: json['status_id'],
      serial_number: json['serial_number'],
      period_index: json['period_index'],
      main_complaint: json['main_complaint'],
      available_for_chat: json['available_for_chat'],
    );
  }

  UserAppointments.fromMap(Map<String, dynamic> map)
      : appointment_id = map['appointment_id'],
        doctor_name = map['doctor_name'],
        doctor_id = map['doctor_id'],
        doctor_specialization = map['doctor_specialization'],
        doctor_phone = map['doctor_phone'],
        clinic_address = map['clinic_address'],
        observations = map['observations'],
        doctor_image = map['doctor_image'],
        date_and_time = map['date_and_time'],
        is_confirmed = map['is_confirmed'],
        price = map['price'],
        status = map['status'],
        status_id = map['status_id'],
        serial_number = map['serial_number'],
        period_index = map['period_index'],
        main_complaint = map['main_complaint'],
        created_at = map['created_at'],
        available_for_chat = map['available_for_chat'];
}
