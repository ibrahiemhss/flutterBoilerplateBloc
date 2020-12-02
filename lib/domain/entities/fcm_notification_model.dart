// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

String FcmNotificationToJson(FcmNotificationModel data) => json.encode(data.toJson());

class FcmNotificationModel {
  String isFCM;
  String deviceRegId;
  String messageTitle;
  String messageBody;
  String typeKey;
  String senderName;
  String sentAt;
  String patientId;
  String theDate;
  String date;
  String patientName;
  String appointmentId;
  String doctorId;
  String senderId;
  String isDoctor;
  String periodIndex;

  FcmNotificationModel({
    this.isFCM,
    this.deviceRegId,
    this.messageTitle,
    this.messageBody,
    this.typeKey,
    this.senderName,
    this.sentAt,
    this.patientId,
    this.theDate,
    this.date,
    this.patientName,
    this.appointmentId,
    this.doctorId,
    this.senderId,
    this.isDoctor,
    this.periodIndex,
  });

  factory FcmNotificationModel.fromJson(Map<String, dynamic> json) => FcmNotificationModel(
    isFCM: json["isFCM"],
    deviceRegId: json["device_reg_id"],
    messageTitle: json["message_title"],
    messageBody: json["message_body"],
    typeKey: json["type_key"],
    senderName: json["sender_name"],
    sentAt: json["sent_at"],
    patientId: json["patient_id"],
    theDate: json["the_date"],
    date: json["date"],
    patientName: json["patient_name"],
    appointmentId: json["appointment_id"],
    doctorId: json["doctor_id"],
    senderId: json["sender_id"],
    isDoctor: json["is_doctor"],
    periodIndex: json["period_index"],
  );

  Map<String, dynamic> toJson() => {
    "device_reg_id": deviceRegId,
    "message_title": messageTitle,
    "message_body": messageBody,
    "type_key": typeKey,
    "sender_name": senderName,
    "sent_at": sentAt,
    "patient_id": patientId,
    "the_date": theDate,
    "date": date,
    "patient_name": patientName,
    "appointment_id": appointmentId,
    "doctor_id": doctorId,
    "sender_id": senderId,
    "is_doctor": isDoctor,
    "period_index": periodIndex,
  };

}
