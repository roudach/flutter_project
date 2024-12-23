
import '../entities/entities.dart';

class MyUser {
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

  MyUser({
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

  static final empty = MyUser(
    userId: '',
    nom: '',
    prenom: '',
    email: '',
    age: 0,
    gender: '',
    tall: 0.0,
    weight: 0.0,
    chronicConditions: '',
    familyMedicalHistory: '',
    hasChronicConditions: false,
    chronicConditionsDetails: '',
    hasAllergies: false,
    allergiesDetails: '',
    takesMedications: false,
    medicationsDetails: '',
    smokingStatus: '',
    alcoholConsumption: '',
    physicalActivityLevels: 0,
    stepsPerDay: '',
    sleepHoursPerNight: 0.0,
    numberOfMealsPerDay: 0,
    waterIntakePerDay: 0.0,
    bloodPressure: '',
  );

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId:userId,
      nom: nom,
      prenom: prenom,
      email: email,
      age: age,
      gender: gender,
      tall: tall,
      weight: weight,
      // ibm: ibm,
      chronicConditions: chronicConditions,
      familyMedicalHistory: familyMedicalHistory,
      hasChronicConditions: hasChronicConditions,
      chronicConditionsDetails: chronicConditionsDetails,
      hasAllergies: hasAllergies,
      allergiesDetails: allergiesDetails,
      takesMedications: takesMedications,
      medicationsDetails: medicationsDetails,
      smokingStatus: smokingStatus,
      alcoholConsumption: alcoholConsumption,
      physicalActivityLevels: physicalActivityLevels,
      stepsPerDay: stepsPerDay,
      sleepHoursPerNight: sleepHoursPerNight,
      numberOfMealsPerDay: numberOfMealsPerDay,
      waterIntakePerDay: waterIntakePerDay,
      bloodPressure: bloodPressure,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      userId: entity.userId,
      nom: entity.nom,
      prenom: entity.prenom,
      email: entity.email,
      age: entity.age,
      gender: entity.gender,
      tall: entity.tall,
      weight: entity.weight,
      chronicConditions: entity.chronicConditions,
      familyMedicalHistory: entity.familyMedicalHistory,
      hasChronicConditions: entity.hasChronicConditions,
      chronicConditionsDetails: entity.chronicConditionsDetails,
      hasAllergies: entity.hasAllergies,
      allergiesDetails: entity.allergiesDetails,
      takesMedications: entity.takesMedications,
      medicationsDetails: entity.medicationsDetails,
      smokingStatus: entity.smokingStatus,
      alcoholConsumption: entity.alcoholConsumption,
      physicalActivityLevels: entity.physicalActivityLevels,
      stepsPerDay: entity.stepsPerDay,
      sleepHoursPerNight: entity.sleepHoursPerNight,
      numberOfMealsPerDay: entity.numberOfMealsPerDay,
      waterIntakePerDay: entity.waterIntakePerDay,
      bloodPressure: entity.bloodPressure,
    );
  }
  @override
  String toString() {
     return 'MyUser{nom: $nom, prenom: $prenom,email: $email, age: $age, gender: $gender, tall: $tall, weight: $weight, '
           'ibm: $ibm, chronicConditions: $chronicConditions, familyMedicalHistory: $familyMedicalHistory, '
           'hasChronicConditions: $hasChronicConditions, chronicConditionsDetails: $chronicConditionsDetails, '
           'hasAllergies: $hasAllergies, allergiesDetails: $allergiesDetails, takesMedications: $takesMedications, '
           'medicationsDetails: $medicationsDetails, smokingStatus: $smokingStatus, alcoholConsumption: $alcoholConsumption, '
           'physicalActivityLevels: $physicalActivityLevels, stepsPerDay: $stepsPerDay, sleepHoursPerNight: $sleepHoursPerNight, '
           'numberOfMealsPerDay: $numberOfMealsPerDay, waterIntakePerDay: $waterIntakePerDay, bloodPressure: $bloodPressure}';
  }
  }

