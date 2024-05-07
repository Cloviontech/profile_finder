// pi_my_clients


// // To parse this JSON data, do
// //
// //     final piMyClients = piMyClientsFromJson(jsonString);

// import 'dart:convert';

// List<PiMyClients> piMyClientsFromJson(String str) => List<PiMyClients>.from(json.decode(str).map((x) => PiMyClients.fromJson(x)));

// String piMyClientsToJson(List<PiMyClients> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class PiMyClients {
//     int id;
//     String uid;
//     String email;
//     String mobile;
//     String password;
//     String referralCode;
//     dynamic coin;
//     String createdTime;
//     int otp;
//     int userOtp;
//     String createdDate;
//     String idCard1;
//     String name;
//     String address;
//     int height;
//     int weight;
//     String gender;
//     String marital;
//     String physical;
//     String religion;
//     int age;
//     String birthPlace;
//     String birthCountry;
//     String birthTime;
//     String birthCity;
//     String origin;
//     String rCountry;
//     String rState;
//     String rStatus;
//     String denomination;
//     String bloodGroup;
//     String idCard2;
//     dynamic profileforwho;
//     String templeName;
//     String templeStreet;
//     String templePostCode;
//     String templeCountry;
//     String templeCity;
//     String templePhoneNumber;
//     String templeDiocese;
//     String templeLocalAdmin;
//     String emergencyName;
//     String emergencyRelation;
//     String emergencyPhoneNumber;
//     String emergencyEmail;
//     String emergencyMaritalStatus;
//     String emergencyOccupations;
//     String profilePicture;
//     String maritalStatus;
//     String physicalMentalStatus;
//     String primaryEmail;
//     String primaryPhoneNumber;
//     DateTime dob;
//     String whyMarry;
//     String behindDecision;
//     String educationSchool;
//     String educationYear;
//     String educationCourse;
//     String educationMajor;
//     String areYouWorkingNow;
//     String companyName;
//     String position;
//     String profession;
//     String salaryRange;
//     String yourIntrest;
//     String nonIntrest;
//     String complexion;
//     String foodTaste;
//     String dailyDietPlan;
//     String carriyingAfterMarriage;
//     String tobacco;
//     String alcohol;
//     String drugs;
//     String criminalOffence;
//     String primaryCountry;
//     String selfie;
//     String fullSizeImage;
//     String familyImage;
//     String gallery;
//     String horoscope;
//     String profileTag;
//     String treetMypartner;
//     String treetTheirSide;
//     String orphan;
//     String disable;
//     String whichorgan;
//     String familyStatus;
//     String fatherName;
//     String fatherCountry;
//     String fatherCity;
//     String fatherJob;
//     String fatherFamilyName;
//     String motherName;
//     String motherCountry;
//     String motherCity;
//     String motherJob;
//     String motherFamilyName;
//     String siblingName;
//     String siblingRelation;
//     String siblingYoungOrOld;
//     String siblingOccupation;
//     String siblingMarital;
//     String siblingEmail;
//     String siblingDob;
//     String siblingJob;
//     String aboutCandidate;
//     String currentStatus;
//     String contactFatherName;
//     String contactFatherStreet;
//     String contactFatherZipcode;
//     String contactFatherCountry;
//     String contactFatherCity;
//     String contactFatherHousename;
//     String contactMotherHousename;
//     String contactEmail;
//     String contactPhone;
//     String whatsapp;
//     String facebook;
//     String linkedin;
//     String instagram;
//     String youtube;
//     String twitter;
//     String website;
//     dynamic registeredDate;
//     String myInvestigator;
//     List<String> questin;
//     List<String> answer;
//     String rating;
//     String feedback;
//     String myManager;
//     String complaints;
//     String complaintsReplay;
//     dynamic status;
//     dynamic reason;
//     dynamic otp1;
//     dynamic userOtp1;

//     PiMyClients({
//         required this.id,
//         required this.uid,
//         required this.email,
//         required this.mobile,
//         required this.password,
//         required this.referralCode,
//         required this.coin,
//         required this.createdTime,
//         required this.otp,
//         required this.userOtp,
//         required this.createdDate,
//         required this.idCard1,
//         required this.name,
//         required this.address,
//         required this.height,
//         required this.weight,
//         required this.gender,
//         required this.marital,
//         required this.physical,
//         required this.religion,
//         required this.age,
//         required this.birthPlace,
//         required this.birthCountry,
//         required this.birthTime,
//         required this.birthCity,
//         required this.origin,
//         required this.rCountry,
//         required this.rState,
//         required this.rStatus,
//         required this.denomination,
//         required this.bloodGroup,
//         required this.idCard2,
//         required this.profileforwho,
//         required this.templeName,
//         required this.templeStreet,
//         required this.templePostCode,
//         required this.templeCountry,
//         required this.templeCity,
//         required this.templePhoneNumber,
//         required this.templeDiocese,
//         required this.templeLocalAdmin,
//         required this.emergencyName,
//         required this.emergencyRelation,
//         required this.emergencyPhoneNumber,
//         required this.emergencyEmail,
//         required this.emergencyMaritalStatus,
//         required this.emergencyOccupations,
//         required this.profilePicture,
//         required this.maritalStatus,
//         required this.physicalMentalStatus,
//         required this.primaryEmail,
//         required this.primaryPhoneNumber,
//         required this.dob,
//         required this.whyMarry,
//         required this.behindDecision,
//         required this.educationSchool,
//         required this.educationYear,
//         required this.educationCourse,
//         required this.educationMajor,
//         required this.areYouWorkingNow,
//         required this.companyName,
//         required this.position,
//         required this.profession,
//         required this.salaryRange,
//         required this.yourIntrest,
//         required this.nonIntrest,
//         required this.complexion,
//         required this.foodTaste,
//         required this.dailyDietPlan,
//         required this.carriyingAfterMarriage,
//         required this.tobacco,
//         required this.alcohol,
//         required this.drugs,
//         required this.criminalOffence,
//         required this.primaryCountry,
//         required this.selfie,
//         required this.fullSizeImage,
//         required this.familyImage,
//         required this.gallery,
//         required this.horoscope,
//         required this.profileTag,
//         required this.treetMypartner,
//         required this.treetTheirSide,
//         required this.orphan,
//         required this.disable,
//         required this.whichorgan,
//         required this.familyStatus,
//         required this.fatherName,
//         required this.fatherCountry,
//         required this.fatherCity,
//         required this.fatherJob,
//         required this.fatherFamilyName,
//         required this.motherName,
//         required this.motherCountry,
//         required this.motherCity,
//         required this.motherJob,
//         required this.motherFamilyName,
//         required this.siblingName,
//         required this.siblingRelation,
//         required this.siblingYoungOrOld,
//         required this.siblingOccupation,
//         required this.siblingMarital,
//         required this.siblingEmail,
//         required this.siblingDob,
//         required this.siblingJob,
//         required this.aboutCandidate,
//         required this.currentStatus,
//         required this.contactFatherName,
//         required this.contactFatherStreet,
//         required this.contactFatherZipcode,
//         required this.contactFatherCountry,
//         required this.contactFatherCity,
//         required this.contactFatherHousename,
//         required this.contactMotherHousename,
//         required this.contactEmail,
//         required this.contactPhone,
//         required this.whatsapp,
//         required this.facebook,
//         required this.linkedin,
//         required this.instagram,
//         required this.youtube,
//         required this.twitter,
//         required this.website,
//         required this.registeredDate,
//         required this.myInvestigator,
//         required this.questin,
//         required this.answer,
//         required this.rating,
//         required this.feedback,
//         required this.myManager,
//         required this.complaints,
//         required this.complaintsReplay,
//         required this.status,
//         required this.reason,
//         required this.otp1,
//         required this.userOtp1,
//     });

//     factory PiMyClients.fromJson(Map<String, dynamic> json) => PiMyClients(
//         id: json["id"],
//         uid: json["uid"],
//         email: json["email"],
//         mobile: json["mobile"],
//         password: json["password"],
//         referralCode: json["referral_code"],
//         coin: json["coin"],
//         createdTime: json["created_time"],
//         otp: json["otp"],
//         userOtp: json["user_otp"],
//         createdDate: json["created_date"],
//         idCard1: json["id_card_1"],
//         name: json["name"],
//         address: json["address"],
//         height: json["height"],
//         weight: json["weight"],
//         gender: json["gender"],
//         marital: json["marital"],
//         physical: json["physical"],
//         religion: json["religion"],
//         age: json["age"],
//         birthPlace: json["birth_place"],
//         birthCountry: json["birth_country"],
//         birthTime: json["birth_time"],
//         birthCity: json["birth_city"],
//         origin: json["origin"],
//         rCountry: json["r_country"],
//         rState: json["r_state"],
//         rStatus: json["r_status"],
//         denomination: json["denomination"],
//         bloodGroup: json["blood_group"],
//         idCard2: json["id_card_2"],
//         profileforwho: json["profileforwho"],
//         templeName: json["temple_name"],
//         templeStreet: json["temple_street"],
//         templePostCode: json["temple_post_code"],
//         templeCountry: json["temple_country"],
//         templeCity: json["temple_city"],
//         templePhoneNumber: json["temple_phone_number"],
//         templeDiocese: json["temple_diocese"],
//         templeLocalAdmin: json["temple_local_admin"],
//         emergencyName: json["emergency_name"],
//         emergencyRelation: json["emergency_relation"],
//         emergencyPhoneNumber: json["emergency_phone_number"],
//         emergencyEmail: json["emergency_email"],
//         emergencyMaritalStatus: json["emergency_marital_status"],
//         emergencyOccupations: json["emergency_occupations"],
//         profilePicture: json["profile_picture"],
//         maritalStatus: json["marital_status"],
//         physicalMentalStatus: json["physical_mental_status"],
//         primaryEmail: json["primary_email"],
//         primaryPhoneNumber: json["primary_phone_number"],
//         dob: DateTime.parse(json["dob"]),
//         whyMarry: json["why_marry"],
//         behindDecision: json["behind_decision"],
//         educationSchool: json["education_school"],
//         educationYear: json["education_year"],
//         educationCourse: json["education_course"],
//         educationMajor: json["education_major"],
//         areYouWorkingNow: json["are_you_working_now"],
//         companyName: json["company_name"],
//         position: json["position"],
//         profession: json["profession"],
//         salaryRange: json["salary_range"],
//         yourIntrest: json["your_intrest"],
//         nonIntrest: json["non_intrest"],
//         complexion: json["complexion"],
//         foodTaste: json["food_taste"],
//         dailyDietPlan: json["daily_diet_plan"],
//         carriyingAfterMarriage: json["carriying_after_marriage"],
//         tobacco: json["tobacco"],
//         alcohol: json["alcohol"],
//         drugs: json["drugs"],
//         criminalOffence: json["criminal_offence"],
//         primaryCountry: json["primary_country"],
//         selfie: json["selfie"],
//         fullSizeImage: json["full_size_image"],
//         familyImage: json["family_image"],
//         gallery: json["gallery"],
//         horoscope: json["horoscope"],
//         profileTag: json["profile_tag"],
//         treetMypartner: json["treet_mypartner"],
//         treetTheirSide: json["treet_their_side"],
//         orphan: json["orphan"],
//         disable: json["disable"],
//         whichorgan: json["whichorgan"],
//         familyStatus: json["family_status"],
//         fatherName: json["father_name"],
//         fatherCountry: json["father_country"],
//         fatherCity: json["father_city"],
//         fatherJob: json["father_job"],
//         fatherFamilyName: json["father_family_name"],
//         motherName: json["mother_name"],
//         motherCountry: json["mother_country"],
//         motherCity: json["mother_city"],
//         motherJob: json["mother_job"],
//         motherFamilyName: json["mother_family_name"],
//         siblingName: json["sibling_name"],
//         siblingRelation: json["sibling_relation"],
//         siblingYoungOrOld: json["sibling_young_or_old"],
//         siblingOccupation: json["sibling_occupation"],
//         siblingMarital: json["sibling_marital"],
//         siblingEmail: json["sibling_email"],
//         siblingDob: json["sibling_dob"],
//         siblingJob: json["sibling_job"],
//         aboutCandidate: json["about_candidate"],
//         currentStatus: json["current_status"],
//         contactFatherName: json["contact_father_name"],
//         contactFatherStreet: json["contact_father_street"],
//         contactFatherZipcode: json["contact_father_zipcode"],
//         contactFatherCountry: json["contact_father_country"],
//         contactFatherCity: json["contact_father_city"],
//         contactFatherHousename: json["contact_father_housename"],
//         contactMotherHousename: json["contact_mother_housename"],
//         contactEmail: json["contact_email"],
//         contactPhone: json["contact_phone"],
//         whatsapp: json["whatsapp"],
//         facebook: json["facebook"],
//         linkedin: json["linkedin"],
//         instagram: json["instagram"],
//         youtube: json["youtube"],
//         twitter: json["twitter"],
//         website: json["website"],
//         registeredDate: json["registered_date"],
//         myInvestigator: json["my_investigator"],
//         questin: List<String>.from(json["Questin"].map((x) => x)),
//         answer: List<String>.from(json["answer"].map((x) => x)),
//         rating: json["rating"],
//         feedback: json["feedback"],
//         myManager: json["my_manager"],
//         complaints: json["complaints"],
//         complaintsReplay: json["complaints_replay"],
//         status: json["status"],
//         reason: json["reason"],
//         otp1: json["otp1"],
//         userOtp1: json["user_otp1"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "uid": uid,
//         "email": email,
//         "mobile": mobile,
//         "password": password,
//         "referral_code": referralCode,
//         "coin": coin,
//         "created_time": createdTime,
//         "otp": otp,
//         "user_otp": userOtp,
//         "created_date": createdDate,
//         "id_card_1": idCard1,
//         "name": name,
//         "address": address,
//         "height": height,
//         "weight": weight,
//         "gender": gender,
//         "marital": marital,
//         "physical": physical,
//         "religion": religion,
//         "age": age,
//         "birth_place": birthPlace,
//         "birth_country": birthCountry,
//         "birth_time": birthTime,
//         "birth_city": birthCity,
//         "origin": origin,
//         "r_country": rCountry,
//         "r_state": rState,
//         "r_status": rStatus,
//         "denomination": denomination,
//         "blood_group": bloodGroup,
//         "id_card_2": idCard2,
//         "profileforwho": profileforwho,
//         "temple_name": templeName,
//         "temple_street": templeStreet,
//         "temple_post_code": templePostCode,
//         "temple_country": templeCountry,
//         "temple_city": templeCity,
//         "temple_phone_number": templePhoneNumber,
//         "temple_diocese": templeDiocese,
//         "temple_local_admin": templeLocalAdmin,
//         "emergency_name": emergencyName,
//         "emergency_relation": emergencyRelation,
//         "emergency_phone_number": emergencyPhoneNumber,
//         "emergency_email": emergencyEmail,
//         "emergency_marital_status": emergencyMaritalStatus,
//         "emergency_occupations": emergencyOccupations,
//         "profile_picture": profilePicture,
//         "marital_status": maritalStatus,
//         "physical_mental_status": physicalMentalStatus,
//         "primary_email": primaryEmail,
//         "primary_phone_number": primaryPhoneNumber,
//         "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
//         "why_marry": whyMarry,
//         "behind_decision": behindDecision,
//         "education_school": educationSchool,
//         "education_year": educationYear,
//         "education_course": educationCourse,
//         "education_major": educationMajor,
//         "are_you_working_now": areYouWorkingNow,
//         "company_name": companyName,
//         "position": position,
//         "profession": profession,
//         "salary_range": salaryRange,
//         "your_intrest": yourIntrest,
//         "non_intrest": nonIntrest,
//         "complexion": complexion,
//         "food_taste": foodTaste,
//         "daily_diet_plan": dailyDietPlan,
//         "carriying_after_marriage": carriyingAfterMarriage,
//         "tobacco": tobacco,
//         "alcohol": alcohol,
//         "drugs": drugs,
//         "criminal_offence": criminalOffence,
//         "primary_country": primaryCountry,
//         "selfie": selfie,
//         "full_size_image": fullSizeImage,
//         "family_image": familyImage,
//         "gallery": gallery,
//         "horoscope": horoscope,
//         "profile_tag": profileTag,
//         "treet_mypartner": treetMypartner,
//         "treet_their_side": treetTheirSide,
//         "orphan": orphan,
//         "disable": disable,
//         "whichorgan": whichorgan,
//         "family_status": familyStatus,
//         "father_name": fatherName,
//         "father_country": fatherCountry,
//         "father_city": fatherCity,
//         "father_job": fatherJob,
//         "father_family_name": fatherFamilyName,
//         "mother_name": motherName,
//         "mother_country": motherCountry,
//         "mother_city": motherCity,
//         "mother_job": motherJob,
//         "mother_family_name": motherFamilyName,
//         "sibling_name": siblingName,
//         "sibling_relation": siblingRelation,
//         "sibling_young_or_old": siblingYoungOrOld,
//         "sibling_occupation": siblingOccupation,
//         "sibling_marital": siblingMarital,
//         "sibling_email": siblingEmail,
//         "sibling_dob": siblingDob,
//         "sibling_job": siblingJob,
//         "about_candidate": aboutCandidate,
//         "current_status": currentStatus,
//         "contact_father_name": contactFatherName,
//         "contact_father_street": contactFatherStreet,
//         "contact_father_zipcode": contactFatherZipcode,
//         "contact_father_country": contactFatherCountry,
//         "contact_father_city": contactFatherCity,
//         "contact_father_housename": contactFatherHousename,
//         "contact_mother_housename": contactMotherHousename,
//         "contact_email": contactEmail,
//         "contact_phone": contactPhone,
//         "whatsapp": whatsapp,
//         "facebook": facebook,
//         "linkedin": linkedin,
//         "instagram": instagram,
//         "youtube": youtube,
//         "twitter": twitter,
//         "website": website,
//         "registered_date": registeredDate,
//         "my_investigator": myInvestigator,
//         "Questin": List<dynamic>.from(questin.map((x) => x)),
//         "answer": List<dynamic>.from(answer.map((x) => x)),
//         "rating": rating,
//         "feedback": feedback,
//         "my_manager": myManager,
//         "complaints": complaints,
//         "complaints_replay": complaintsReplay,
//         "status": status,
//         "reason": reason,
//         "otp1": otp1,
//         "user_otp1": userOtp1,
//     };
// }



// To parse this JSON data, do
//
//     final piMyClients = piMyClientsFromJson(jsonString);

import 'dart:convert';

List<PiMyClients> piMyClientsFromJson(String str) => List<PiMyClients>.from(json.decode(str).map((x) => PiMyClients.fromJson(x)));

String piMyClientsToJson(List<PiMyClients> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PiMyClients {
    int? id;
    String? uid;
    String? email;
    String? mobile;
    String? password;
    String? referralCode;
    dynamic coin;
    String? createdTime;
    int? otp;
    int? userOtp;
    String? createdDate;
    String? idCard1;
    String? name;
    String? address;
    int? height;
    int? weight;
    String? gender;
    String? marital;
    String? physical;
    String? religion;
    int? age;
    String? birthPlace;
    String? birthCountry;
    String? birthTime;
    String? birthCity;
    String? origin;
    String? rCountry;
    String? rState;
    String? rStatus;
    String? denomination;
    String? bloodGroup;
    String? idCard2;
    dynamic profileforwho;
    String? templeName;
    String? templeStreet;
    String? templePostCode;
    String? templeCountry;
    String? templeCity;
    String? templePhoneNumber;
    String? templeDiocese;
    String? templeLocalAdmin;
    String? emergencyName;
    String? emergencyRelation;
    String? emergencyPhoneNumber;
    String? emergencyEmail;
    String? emergencyMaritalStatus;
    String? emergencyOccupations;
    String? profilePicture;
    String? maritalStatus;
    String? physicalMentalStatus;
    String? primaryEmail;
    String? primaryPhoneNumber;
    DateTime? dob;
    String? whyMarry;
    String? behindDecision;
    String? educationSchool;
    String? educationYear;
    String? educationCourse;
    String? educationMajor;
    String? areYouWorkingNow;
    String? companyName;
    String? position;
    String? profession;
    String? salaryRange;
    String? yourIntrest;
    String? nonIntrest;
    String? complexion;
    String? foodTaste;
    String? dailyDietPlan;
    String? carriyingAfterMarriage;
    String? tobacco;
    String? alcohol;
    String? drugs;
    String? criminalOffence;
    String? primaryCountry;
    String? selfie;
    String? fullSizeImage;
    String? familyImage;
    String? gallery;
    String? horoscope;
    String? profileTag;
    String? treetMypartner;
    String? treetTheirSide;
    String? orphan;
    String? disable;
    String? whichorgan;
    String? familyStatus;
    String? fatherName;
    String? fatherCountry;
    String? fatherCity;
    String? fatherJob;
    String? fatherFamilyName;
    String? motherName;
    String? motherCountry;
    String? motherCity;
    String? motherJob;
    String? motherFamilyName;
    String? siblingName;
    String? siblingRelation;
    String? siblingYoungOrOld;
    String? siblingOccupation;
    String? siblingMarital;
    String? siblingEmail;
    String? siblingDob;
    String? siblingJob;
    String? aboutCandidate;
    String? currentStatus;
    String? contactFatherName;
    String? contactFatherStreet;
    String? contactFatherZipcode;
    String? contactFatherCountry;
    String? contactFatherCity;
    String? contactFatherHousename;
    String? contactMotherHousename;
    String? contactEmail;
    String? contactPhone;
    String? whatsapp;
    String? facebook;
    String? linkedin;
    String? instagram;
    String? youtube;
    String? twitter;
    String? website;
    dynamic registeredDate;
    String? myInvestigator;
    List<String>? questin;
    List<String>? answer;
    String? rating;
    String? feedback;
    String? myManager;
    String? complaints;
    String? complaintsReplay;
    dynamic status;
    dynamic reason;
    dynamic otp1;
    dynamic userOtp1;

    PiMyClients({
        this.id,
        this.uid,
        this.email,
        this.mobile,
        this.password,
        this.referralCode,
        this.coin,
        this.createdTime,
        this.otp,
        this.userOtp,
        this.createdDate,
        this.idCard1,
        this.name,
        this.address,
        this.height,
        this.weight,
        this.gender,
        this.marital,
        this.physical,
        this.religion,
        this.age,
        this.birthPlace,
        this.birthCountry,
        this.birthTime,
        this.birthCity,
        this.origin,
        this.rCountry,
        this.rState,
        this.rStatus,
        this.denomination,
        this.bloodGroup,
        this.idCard2,
        this.profileforwho,
        this.templeName,
        this.templeStreet,
        this.templePostCode,
        this.templeCountry,
        this.templeCity,
        this.templePhoneNumber,
        this.templeDiocese,
        this.templeLocalAdmin,
        this.emergencyName,
        this.emergencyRelation,
        this.emergencyPhoneNumber,
        this.emergencyEmail,
        this.emergencyMaritalStatus,
        this.emergencyOccupations,
        this.profilePicture,
        this.maritalStatus,
        this.physicalMentalStatus,
        this.primaryEmail,
        this.primaryPhoneNumber,
        this.dob,
        this.whyMarry,
        this.behindDecision,
        this.educationSchool,
        this.educationYear,
        this.educationCourse,
        this.educationMajor,
        this.areYouWorkingNow,
        this.companyName,
        this.position,
        this.profession,
        this.salaryRange,
        this.yourIntrest,
        this.nonIntrest,
        this.complexion,
        this.foodTaste,
        this.dailyDietPlan,
        this.carriyingAfterMarriage,
        this.tobacco,
        this.alcohol,
        this.drugs,
        this.criminalOffence,
        this.primaryCountry,
        this.selfie,
        this.fullSizeImage,
        this.familyImage,
        this.gallery,
        this.horoscope,
        this.profileTag,
        this.treetMypartner,
        this.treetTheirSide,
        this.orphan,
        this.disable,
        this.whichorgan,
        this.familyStatus,
        this.fatherName,
        this.fatherCountry,
        this.fatherCity,
        this.fatherJob,
        this.fatherFamilyName,
        this.motherName,
        this.motherCountry,
        this.motherCity,
        this.motherJob,
        this.motherFamilyName,
        this.siblingName,
        this.siblingRelation,
        this.siblingYoungOrOld,
        this.siblingOccupation,
        this.siblingMarital,
        this.siblingEmail,
        this.siblingDob,
        this.siblingJob,
        this.aboutCandidate,
        this.currentStatus,
        this.contactFatherName,
        this.contactFatherStreet,
        this.contactFatherZipcode,
        this.contactFatherCountry,
        this.contactFatherCity,
        this.contactFatherHousename,
        this.contactMotherHousename,
        this.contactEmail,
        this.contactPhone,
        this.whatsapp,
        this.facebook,
        this.linkedin,
        this.instagram,
        this.youtube,
        this.twitter,
        this.website,
        this.registeredDate,
        this.myInvestigator,
        this.questin,
        this.answer,
        this.rating,
        this.feedback,
        this.myManager,
        this.complaints,
        this.complaintsReplay,
        this.status,
        this.reason,
        this.otp1,
        this.userOtp1,
    });

    factory PiMyClients.fromJson(Map<String, dynamic> json) => PiMyClients(
        id: json["id"],
        uid: json["uid"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        referralCode: json["referral_code"],
        coin: json["coin"],
        createdTime: json["created_time"],
        otp: json["otp"],
        userOtp: json["user_otp"],
        createdDate: json["created_date"],
        idCard1: json["id_card_1"],
        name: json["name"],
        address: json["address"],
        height: json["height"],
        weight: json["weight"],
        gender: json["gender"],
        marital: json["marital"],
        physical: json["physical"],
        religion: json["religion"],
        age: json["age"],
        birthPlace: json["birth_place"],
        birthCountry: json["birth_country"],
        birthTime: json["birth_time"],
        birthCity: json["birth_city"],
        origin: json["origin"],
        rCountry: json["r_country"],
        rState: json["r_state"],
        rStatus: json["r_status"],
        denomination: json["denomination"],
        bloodGroup: json["blood_group"],
        idCard2: json["id_card_2"],
        profileforwho: json["profileforwho"],
        templeName: json["temple_name"],
        templeStreet: json["temple_street"],
        templePostCode: json["temple_post_code"],
        templeCountry: json["temple_country"],
        templeCity: json["temple_city"],
        templePhoneNumber: json["temple_phone_number"],
        templeDiocese: json["temple_diocese"],
        templeLocalAdmin: json["temple_local_admin"],
        emergencyName: json["emergency_name"],
        emergencyRelation: json["emergency_relation"],
        emergencyPhoneNumber: json["emergency_phone_number"],
        emergencyEmail: json["emergency_email"],
        emergencyMaritalStatus: json["emergency_marital_status"],
        emergencyOccupations: json["emergency_occupations"],
        profilePicture: json["profile_picture"],
        maritalStatus: json["marital_status"],
        physicalMentalStatus: json["physical_mental_status"],
        primaryEmail: json["primary_email"],
        primaryPhoneNumber: json["primary_phone_number"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        whyMarry: json["why_marry"],
        behindDecision: json["behind_decision"],
        educationSchool: json["education_school"],
        educationYear: json["education_year"],
        educationCourse: json["education_course"],
        educationMajor: json["education_major"],
        areYouWorkingNow: json["are_you_working_now"],
        companyName: json["company_name"],
        position: json["position"],
        profession: json["profession"],
        salaryRange: json["salary_range"],
        yourIntrest: json["your_intrest"],
        nonIntrest: json["non_intrest"],
        complexion: json["complexion"],
        foodTaste: json["food_taste"],
        dailyDietPlan: json["daily_diet_plan"],
        carriyingAfterMarriage: json["carriying_after_marriage"],
        tobacco: json["tobacco"],
        alcohol: json["alcohol"],
        drugs: json["drugs"],
        criminalOffence: json["criminal_offence"],
        primaryCountry: json["primary_country"],
        selfie: json["selfie"],
        fullSizeImage: json["full_size_image"],
        familyImage: json["family_image"],
        gallery: json["gallery"],
        horoscope: json["horoscope"],
        profileTag: json["profile_tag"],
        treetMypartner: json["treet_mypartner"],
        treetTheirSide: json["treet_their_side"],
        orphan: json["orphan"],
        disable: json["disable"],
        whichorgan: json["whichorgan"],
        familyStatus: json["family_status"],
        fatherName: json["father_name"],
        fatherCountry: json["father_country"],
        fatherCity: json["father_city"],
        fatherJob: json["father_job"],
        fatherFamilyName: json["father_family_name"],
        motherName: json["mother_name"],
        motherCountry: json["mother_country"],
        motherCity: json["mother_city"],
        motherJob: json["mother_job"],
        motherFamilyName: json["mother_family_name"],
        siblingName: json["sibling_name"],
        siblingRelation: json["sibling_relation"],
        siblingYoungOrOld: json["sibling_young_or_old"],
        siblingOccupation: json["sibling_occupation"],
        siblingMarital: json["sibling_marital"],
        siblingEmail: json["sibling_email"],
        siblingDob: json["sibling_dob"],
        siblingJob: json["sibling_job"],
        aboutCandidate: json["about_candidate"],
        currentStatus: json["current_status"],
        contactFatherName: json["contact_father_name"],
        contactFatherStreet: json["contact_father_street"],
        contactFatherZipcode: json["contact_father_zipcode"],
        contactFatherCountry: json["contact_father_country"],
        contactFatherCity: json["contact_father_city"],
        contactFatherHousename: json["contact_father_housename"],
        contactMotherHousename: json["contact_mother_housename"],
        contactEmail: json["contact_email"],
        contactPhone: json["contact_phone"],
        whatsapp: json["whatsapp"],
        facebook: json["facebook"],
        linkedin: json["linkedin"],
        instagram: json["instagram"],
        youtube: json["youtube"],
        twitter: json["twitter"],
        website: json["website"],
        registeredDate: json["registered_date"],
        myInvestigator: json["my_investigator"],
        questin: json["Questin"] == null ? [] : List<String>.from(json["Questin"]!.map((x) => x)),
        answer: json["answer"] == null ? [] : List<String>.from(json["answer"]!.map((x) => x)),
        rating: json["rating"],
        feedback: json["feedback"],
        myManager: json["my_manager"],
        complaints: json["complaints"],
        complaintsReplay: json["complaints_replay"],
        status: json["status"],
        reason: json["reason"],
        otp1: json["otp1"],
        userOtp1: json["user_otp1"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "email": email,
        "mobile": mobile,
        "password": password,
        "referral_code": referralCode,
        "coin": coin,
        "created_time": createdTime,
        "otp": otp,
        "user_otp": userOtp,
        "created_date": createdDate,
        "id_card_1": idCard1,
        "name": name,
        "address": address,
        "height": height,
        "weight": weight,
        "gender": gender,
        "marital": marital,
        "physical": physical,
        "religion": religion,
        "age": age,
        "birth_place": birthPlace,
        "birth_country": birthCountry,
        "birth_time": birthTime,
        "birth_city": birthCity,
        "origin": origin,
        "r_country": rCountry,
        "r_state": rState,
        "r_status": rStatus,
        "denomination": denomination,
        "blood_group": bloodGroup,
        "id_card_2": idCard2,
        "profileforwho": profileforwho,
        "temple_name": templeName,
        "temple_street": templeStreet,
        "temple_post_code": templePostCode,
        "temple_country": templeCountry,
        "temple_city": templeCity,
        "temple_phone_number": templePhoneNumber,
        "temple_diocese": templeDiocese,
        "temple_local_admin": templeLocalAdmin,
        "emergency_name": emergencyName,
        "emergency_relation": emergencyRelation,
        "emergency_phone_number": emergencyPhoneNumber,
        "emergency_email": emergencyEmail,
        "emergency_marital_status": emergencyMaritalStatus,
        "emergency_occupations": emergencyOccupations,
        "profile_picture": profilePicture,
        "marital_status": maritalStatus,
        "physical_mental_status": physicalMentalStatus,
        "primary_email": primaryEmail,
        "primary_phone_number": primaryPhoneNumber,
        "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "why_marry": whyMarry,
        "behind_decision": behindDecision,
        "education_school": educationSchool,
        "education_year": educationYear,
        "education_course": educationCourse,
        "education_major": educationMajor,
        "are_you_working_now": areYouWorkingNow,
        "company_name": companyName,
        "position": position,
        "profession": profession,
        "salary_range": salaryRange,
        "your_intrest": yourIntrest,
        "non_intrest": nonIntrest,
        "complexion": complexion,
        "food_taste": foodTaste,
        "daily_diet_plan": dailyDietPlan,
        "carriying_after_marriage": carriyingAfterMarriage,
        "tobacco": tobacco,
        "alcohol": alcohol,
        "drugs": drugs,
        "criminal_offence": criminalOffence,
        "primary_country": primaryCountry,
        "selfie": selfie,
        "full_size_image": fullSizeImage,
        "family_image": familyImage,
        "gallery": gallery,
        "horoscope": horoscope,
        "profile_tag": profileTag,
        "treet_mypartner": treetMypartner,
        "treet_their_side": treetTheirSide,
        "orphan": orphan,
        "disable": disable,
        "whichorgan": whichorgan,
        "family_status": familyStatus,
        "father_name": fatherName,
        "father_country": fatherCountry,
        "father_city": fatherCity,
        "father_job": fatherJob,
        "father_family_name": fatherFamilyName,
        "mother_name": motherName,
        "mother_country": motherCountry,
        "mother_city": motherCity,
        "mother_job": motherJob,
        "mother_family_name": motherFamilyName,
        "sibling_name": siblingName,
        "sibling_relation": siblingRelation,
        "sibling_young_or_old": siblingYoungOrOld,
        "sibling_occupation": siblingOccupation,
        "sibling_marital": siblingMarital,
        "sibling_email": siblingEmail,
        "sibling_dob": siblingDob,
        "sibling_job": siblingJob,
        "about_candidate": aboutCandidate,
        "current_status": currentStatus,
        "contact_father_name": contactFatherName,
        "contact_father_street": contactFatherStreet,
        "contact_father_zipcode": contactFatherZipcode,
        "contact_father_country": contactFatherCountry,
        "contact_father_city": contactFatherCity,
        "contact_father_housename": contactFatherHousename,
        "contact_mother_housename": contactMotherHousename,
        "contact_email": contactEmail,
        "contact_phone": contactPhone,
        "whatsapp": whatsapp,
        "facebook": facebook,
        "linkedin": linkedin,
        "instagram": instagram,
        "youtube": youtube,
        "twitter": twitter,
        "website": website,
        "registered_date": registeredDate,
        "my_investigator": myInvestigator,
        "Questin": questin == null ? [] : List<dynamic>.from(questin!.map((x) => x)),
        "answer": answer == null ? [] : List<dynamic>.from(answer!.map((x) => x)),
        "rating": rating,
        "feedback": feedback,
        "my_manager": myManager,
        "complaints": complaints,
        "complaints_replay": complaintsReplay,
        "status": status,
        "reason": reason,
        "otp1": otp1,
        "user_otp1": userOtp1,
    };
}
