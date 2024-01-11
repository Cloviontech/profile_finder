// To parse this JSON data, do
//
//     final blockedUsersByMe = blockedUsersByMeFromJson(jsonString);


// BlockedUsersByMe blockedUsersByMeFromJson(String str) => BlockedUsersByMe.fromJson(json.decode(str));

// String blockedUsersByMeToJson(BlockedUsersByMe data) => json.encode(data.toJson());

class BlockedUsersByMe {
    List<The0Ppqmbpewtl>? the0Ppqmbpewtl;

    BlockedUsersByMe({
        this.the0Ppqmbpewtl,
    });

    factory BlockedUsersByMe.fromJson(Map<String, dynamic> json, String uidf) => BlockedUsersByMe(
        the0Ppqmbpewtl: json[uidf] == null ? [] : 
        List<The0Ppqmbpewtl>.from(json[uidf]!.map((x) => 
        The0Ppqmbpewtl.fromJson(x))),
    );

    Map<String, dynamic> toJson(String uidf) => {
        uidf: the0Ppqmbpewtl == null ? [] : List<dynamic>.from(the0Ppqmbpewtl!.map((x) => x.toJson())),
    };
}

class The0Ppqmbpewtl {
    int? id;
    String? uid;
    String? email;
    String? mobile;
    String? password;
    String? referralCode;
    int? otp;
    int? userOtp;
    dynamic idCard1;
    dynamic name;
    dynamic address;
    dynamic height;
    dynamic weight;
    String? gender;
    dynamic marital;
    dynamic physical;
    dynamic religion;
    dynamic age;
    dynamic birthPlace;
    dynamic birthCountry;
    dynamic birthTime;
    dynamic birthCity;
    dynamic origin;
    dynamic rCountry;
    dynamic rState;
    dynamic rStatus;
    dynamic denomination;
    dynamic bloodGroup;
    dynamic idCard2;
    dynamic profileforwho;
    dynamic templeName;
    dynamic templeStreet;
    dynamic templePostCode;
    dynamic templeCountry;
    dynamic templeCity;
    dynamic templePhoneNumber;
    dynamic templeDiocese;
    dynamic templeLocalAdmin;
    dynamic emergencyName;
    dynamic emergencyRelation;
    dynamic emergencyPhoneNumber;
    dynamic emergencyEmail;
    dynamic emergencyMaritalStatus;
    dynamic emergencyOccupations;
    dynamic profilePicture;
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
    dynamic familyStatus;
    dynamic fatherName;
    dynamic fatherCountry;
    dynamic fatherCity;
    dynamic fatherJob;
    dynamic fatherFamilyName;
    dynamic motherName;
    dynamic motherCountry;
    dynamic motherCity;
    dynamic motherJob;
    dynamic motherFamilyName;
    dynamic siblingName;
    dynamic siblingRelation;
    dynamic siblingYoungOrOld;
    dynamic siblingOccupation;
    dynamic siblingMarital;
    dynamic siblingEmail;
    dynamic siblingDob;
    dynamic siblingJob;
    dynamic aboutCandidate;
    dynamic currentStatus;
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
    String? blockReason;

    The0Ppqmbpewtl({
        this.id,
        this.uid,
        this.email,
        this.mobile,
        this.password,
        this.referralCode,
        this.otp,
        this.userOtp,
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
        this.blockReason,
    });

    factory The0Ppqmbpewtl.fromJson(Map<String, dynamic> json) => The0Ppqmbpewtl(
        id: json["id"],
        uid: json["uid"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        referralCode: json["referral_code"],
        otp: json["otp"],
        userOtp: json["user_otp"],
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
        blockReason: json["block_reason"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "email": email,
        "mobile": mobile,
        "password": password,
        "referral_code": referralCode,
        "otp": otp,
        "user_otp": userOtp,
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
        "block_reason": blockReason,
    };
}
