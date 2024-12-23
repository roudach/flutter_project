
class MyUserEntity {
  String userId;
  String nom;
  String prenom;
  String email;
  int age;
  String gender;
  double tall; // in meters
  double weight; // in kilograms
  double get ibm => weight / (tall * tall * tall);
  String chronicConditions;
  String familyMedicalHistory;
  bool hasChronicConditions;
  String chronicConditionsDetails;
  bool hasAllergies;
  String allergiesDetails;
  bool takesMedications;
  String medicationsDetails;
  String smokingStatus;
  String alcoholConsumption;
  int physicalActivityLevels;
  String stepsPerDay;
  double sleepHoursPerNight;
  int numberOfMealsPerDay;
  double waterIntakePerDay; // in liters
  String bloodPressure;

  MyUserEntity({
    required this.userId,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.age,
    required this.gender,
    required this.tall,
    required this.weight,
    required this.chronicConditions,
    required this.familyMedicalHistory,
    required this.hasChronicConditions,
    required this.chronicConditionsDetails,
    required this.hasAllergies,
    required this.allergiesDetails,
    required this.takesMedications,
    required this.medicationsDetails,
    required this.smokingStatus,
    required this.alcoholConsumption,
    required this.physicalActivityLevels,
    required this.stepsPerDay,
    required this.sleepHoursPerNight,
    required this.numberOfMealsPerDay,
    required this.waterIntakePerDay,
    required this.bloodPressure,
  });
  Map<String, Object> toDocument() {
    return {
      'userId' : userId,
      'nom': nom,
      'prenom': prenom,
      'email' : email,
      'age': age,
      'gender': gender,
      'tall': tall,
      'weight': weight,
      'ibm': ibm,
      'chronicConditions': chronicConditions,
      'familyMedicalHistory': familyMedicalHistory,
      'hasChronicConditions': hasChronicConditions,
      'chronicConditionsDetails': chronicConditionsDetails,
      'hasAllergies': hasAllergies,
      'allergiesDetails': allergiesDetails,
      'takesMedications': takesMedications,
      'medicationsDetails': medicationsDetails,
      'smokingStatus': smokingStatus,
      'alcoholConsumption': alcoholConsumption,
      'physicalActivityLevels': physicalActivityLevels,
      'stepsPerDay': stepsPerDay,
      'sleepHoursPerNight': sleepHoursPerNight,
      'numberOfMealsPerDay': numberOfMealsPerDay,
      'waterIntakePerDay': waterIntakePerDay,
      'bloodPressure': bloodPressure,
    };
  }
  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      userId: doc['userId']?? '',
      nom: doc['nom'] ?? '',
      prenom: doc['prenom'] ?? '',
      email: doc['email'] ?? '',
      age: doc['age'] ?? 0,
      gender: doc['gender'] ?? '',
      tall: doc['tall'] ?? 0.0,
      weight: doc['weight'] ?? 0.0,
      chronicConditions: doc['chronicConditions'] ?? '',
      familyMedicalHistory: doc['familyMedicalHistory'] ?? '',
      hasChronicConditions: doc['hasChronicConditions'] ?? false,
      chronicConditionsDetails: doc['chronicConditionsDetails'] ?? '',
      hasAllergies: doc['hasAllergies'] ?? false,
      allergiesDetails: doc['allergiesDetails'] ?? '',
      takesMedications: doc['takesMedications'] ?? false,
      medicationsDetails: doc['medicationsDetails'] ?? '',
      smokingStatus: doc['smokingStatus'] ?? '',
      alcoholConsumption: doc['alcoholConsumption'] ?? '',
      physicalActivityLevels: doc['physicalActivityLevels'] ?? 0,
      stepsPerDay: doc['stepsPerDay'] ?? '',
      sleepHoursPerNight: doc['sleepHoursPerNight'] ?? 0.0,
      numberOfMealsPerDay: doc['numberOfMealsPerDay'] ?? 0,
      waterIntakePerDay: doc['waterIntakePerDay'] ?? 0.0,
      bloodPressure: doc['bloodPressure'] ?? '',
    );
  }

  }