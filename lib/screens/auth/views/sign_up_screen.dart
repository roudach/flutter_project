import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/components/my_text_field.dart';
import 'package:flutter_project/screens/auth/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final chronicConditionsController = TextEditingController();
  final familyMedicalHistoryController = TextEditingController();
  final allergiesController = TextEditingController();
  final medicationsController = TextEditingController();
  final smokingStatusController = TextEditingController();
  final alcoholConsumptionController = TextEditingController();
  final physicalActivityLevelsController = TextEditingController();
  final stepsPerDayController = TextEditingController();
  final sleepHoursPerNightController = TextEditingController();
  final numberOfMealsPerDayController = TextEditingController();
  final waterIntakePerDayController = TextEditingController();
  final bloodPressureController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
	IconData iconPassword = CupertinoIcons.eye_fill;
	bool obscurePassword = true;
	bool signUpRequired = false;

	bool containsUpperCase = false;
	bool containsLowerCase = false;
	bool containsNumber = false;
	bool containsSpecialChar = false;
	bool contains8Length = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
			listener: (context, state) {
				if(state is SignUpSuccess) {
					setState(() {
					  signUpRequired = false;
					});
					// Navigator.pop(context);
				} else if(state is SignUpProcess) {
					setState(() {
					  signUpRequired = true;
					});
				}  else if(state is SignUpFailure) {
					return;
				} 
			},
			child: Form(
						key: _formKey,
						child: Center(
							child: Column(
								children: [
									const SizedBox(height: 20),
									SizedBox(
										width: MediaQuery.of(context).size.width * 0.9,
										child: MyTextField(
											controller: emailController,
											hintText: 'Email',
											obscureText: false,
											keyboardType: TextInputType.emailAddress,
											prefixIcon: const Icon(CupertinoIcons.mail_solid),
											validator: (val) {
												if(val!.isEmpty) {
													return 'Please fill in this field';													
												} else if(!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$').hasMatch(val)) {
													return 'Please enter a valid email';
												}
												return null;
											}
										),
									),
									const SizedBox(height: 10),
									SizedBox(
										width: MediaQuery.of(context).size.width * 0.9,
										child: MyTextField(
											controller: passwordController,
											hintText: 'Password',
											obscureText: obscurePassword,
											keyboardType: TextInputType.visiblePassword,
											prefixIcon: const Icon(CupertinoIcons.lock_fill),
											onChanged: (val) {
												if(val!.contains(RegExp(r'[A-Z]'))) {
													setState(() {
														containsUpperCase = true;
													});
												} else {
													setState(() {
														containsUpperCase = false;
													});
												}
												if(val.contains(RegExp(r'[a-z]'))) {
													setState(() {
														containsLowerCase = true;
													});
												} else {
													setState(() {
														containsLowerCase = false;
													});
												}
												if(val.contains(RegExp(r'[0-9]'))) {
													setState(() {
														containsNumber = true;
													});
												} else {
													setState(() {
														containsNumber = false;
													});
												}
												if(val.contains(RegExp(r'^(?=.*?[!@#$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^])'))) {
													setState(() {
														containsSpecialChar = true;
													});
												} else {
													setState(() {
														containsSpecialChar = false;
													});
												}
												if(val.length >= 8) {
													setState(() {
														contains8Length = true;
													});
												} else {
													setState(() {
														contains8Length = false;
													});
												}
												return null;
											},
											suffixIcon: IconButton(
												onPressed: () {
													setState(() {
														obscurePassword = !obscurePassword;
														if(obscurePassword) {
															iconPassword = CupertinoIcons.eye_fill;
														} else {
															iconPassword = CupertinoIcons.eye_slash_fill;
														}
													});
												},
												icon: Icon(iconPassword),
											),
											validator: (val) {
												if(val!.isEmpty) {
													return 'Please fill in this field';			
												} else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$').hasMatch(val)) {
													return 'Please enter a valid password';
												}
												return null;
											}
										),
									),
									const SizedBox(height: 10),
									Row(
										mainAxisAlignment: MainAxisAlignment.spaceEvenly,
										crossAxisAlignment: CrossAxisAlignment.start,
										children: [
											Column(
											crossAxisAlignment: CrossAxisAlignment.start,
												children: [
													Text(
														"⚈  1 uppercase",
														style: TextStyle(
															color: containsUpperCase
																? Colors.green
																: Theme.of(context).colorScheme.onSurface
														),
													),
													Text(
														"⚈  1 lowercase",
														style: TextStyle(
															color: containsLowerCase
																? Colors.green
																: Theme.of(context).colorScheme.onSurface
														),
													),
													Text(
														"⚈  1 number",
														style: TextStyle(
															color: containsNumber
																? Colors.green
																: Theme.of(context).colorScheme.onSurface
														),
													),
												],
											),
											Column(
												crossAxisAlignment: CrossAxisAlignment.start,
												children: [
													Text(
														"⚈  1 special character",
														style: TextStyle(
															color: containsSpecialChar
																? Colors.green
																: Theme.of(context).colorScheme.onSurface
														),
													),
													Text(
														"⚈  8 minimum character",
														style: TextStyle(
															color: contains8Length
																? Colors.green
																: Theme.of(context).colorScheme.onSurface
														),
													),
												],
											),
										],
									),
									const SizedBox(height: 10),
									SizedBox(
										width: MediaQuery.of(context).size.width * 0.9,
										child: MyTextField(
											controller: nameController,
											hintText: 'Name',
											obscureText: false,
											keyboardType: TextInputType.name,
											prefixIcon: const Icon(CupertinoIcons.person_fill),
											validator: (val) {
												if(val!.isEmpty) {
													return 'Please fill in this field';													
												} else if(val.length > 30) {
													return 'Name too long';
												}
												return null;
											}
										),
									),
                  const SizedBox(height: 10),
									SizedBox(
										width: MediaQuery.of(context).size.width * 0.9,
										child: MyTextField(
											controller: ageController,
											hintText: 'Age',
											obscureText: false,
											keyboardType: TextInputType.number,
											prefixIcon: const Icon(CupertinoIcons.time_solid),
											validator: (val) {
												if(val!.isEmpty) {
													return 'Please fill in this field';													
												} else if(val.length > 30) {
													return 'Name too long';
												}
												return null;
											}
										),
									),
                  const SizedBox(height: 10),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    InkWell(
      onTap: () {
        setState(() {
          genderController.text = 'Male';
        });
      },
      child: Column(
        children: [
          Icon(
            CupertinoIcons.person_fill,
            color: genderController.text == 'Male' ? Colors.blue : Colors.grey,
            size: 50,
          ),
          Text(
            'Male',
            style: TextStyle(
              color: genderController.text == 'Male' ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    ),
    InkWell(
      onTap: () {
        setState(() {
          genderController.text = 'Female';
        });
      },
      child: Column(
        children: [
          Icon(
            CupertinoIcons.person_2_fill,
            color: genderController.text == 'Female' ? Colors.pink : Colors.grey,
            size: 50,
          ),
          Text(
            'Female',
            style: TextStyle(
              color: genderController.text == 'Female' ? Colors.pink : Colors.grey,
            ),
          ),
        ],
      ),
    ),
  ],
),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: heightController,
                      hintText: 'Height (in meters)',
                      obscureText: false,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      prefixIcon: const Icon(CupertinoIcons.arrow_up_arrow_down),
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: weightController,
                      hintText: 'Weight (in kilograms)',
                      obscureText: false,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      // prefixIcon: const Icon(CupertinoIcons.scale_fill),
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: chronicConditionsController,
                      hintText: 'Chronic Conditions',
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      prefixIcon: const Icon(CupertinoIcons.heart_fill),
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: familyMedicalHistoryController,
                      hintText: 'Family Medical History',
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      prefixIcon: const Icon(CupertinoIcons.book_fill),
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: allergiesController,
                      hintText: 'Allergies',
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      prefixIcon: const Icon(CupertinoIcons.bandage_fill),
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: medicationsController,
                      hintText: 'Medications',
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      // prefixIcon: const Icon(CupertinoIcons.pills_fill),
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: smokingStatusController,
                      hintText: 'Smoking Status',
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      prefixIcon: const Icon(CupertinoIcons.smoke_fill),
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: alcoholConsumptionController,
                      hintText: 'Alcohol Consumption',
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      // prefixIcon: const Icon(CupertinoIcons.wineglass_fill),
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: physicalActivityLevelsController,
                      hintText: 'Physical Activity Levels',
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      prefixIcon: const Icon(CupertinoIcons.bolt_fill),
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: stepsPerDayController,
                      hintText: 'Steps Per Day',
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      prefixIcon: const Icon(CupertinoIcons.map_fill),
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: sleepHoursPerNightController,
                      hintText: 'Sleep Hours Per Night',
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      prefixIcon: const Icon(CupertinoIcons.moon_fill),
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: numberOfMealsPerDayController,
                      hintText: 'Number of Meals Per Day',
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      // prefixIcon: const Icon(CupertinoIcons.fork_knife),
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: waterIntakePerDayController,
                      hintText: 'Water Intake Per Day (in liters)',
                      obscureText: false,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      prefixIcon: const Icon(CupertinoIcons.drop_fill),
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: bloodPressureController,
                      hintText: 'Blood Pressure',
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      prefixIcon: const Icon(CupertinoIcons.heart_fill),
                    ),
									SizedBox(height: MediaQuery.of(context).size.height * 0.02),
									!signUpRequired
										? SizedBox(
												width: MediaQuery.of(context).size.width * 0.5,
												child: TextButton(
													// onPressed: () {
													// 	if (_formKey.currentState!.validate()) {
													// 		MyUser myUser = MyUser.empty;
													// 	// 	myUser = myUser.copyWith(
													// 	// 		email: emailController.text,
													// 	// 		name: nameController.text,
													// 	// 	);
													// 		setState(() {
													// 			context.read<SignUpBloc>().add(
													// 				SignUpRequired(
													// 					myUser,
													// 					passwordController.text
													// 				)
													// 			);
													// 		});																			
													// 	}
													// },
                          onPressed: () {
  if (_formKey.currentState!.validate()) {
    MyUser myUser = MyUser(
       nom: nameController.text,
                                      prenom: '',
                                      email: emailController.text,
                                      age: int.parse(ageController.text),
                                      gender: genderController.text,
                                      tall: double.parse(heightController.text),
                                      weight: double.parse(weightController.text),
                                      chronicConditions: chronicConditionsController.text,
                                      familyMedicalHistory: familyMedicalHistoryController.text,
                                      hasChronicConditions: chronicConditionsController.text.isNotEmpty,
                                      chronicConditionsDetails: chronicConditionsController.text,
                                      hasAllergies: allergiesController.text.isNotEmpty,
                                      allergiesDetails: allergiesController.text,
                                      takesMedications: medicationsController.text.isNotEmpty,
                                      medicationsDetails: medicationsController.text,
                                      smokingStatus: smokingStatusController.text,
                                      alcoholConsumption: alcoholConsumptionController.text,
                                      physicalActivityLevels: int.parse(physicalActivityLevelsController.text),
                                      stepsPerDay: stepsPerDayController.text,
                                      sleepHoursPerNight: double.parse(sleepHoursPerNightController.text),
                                      numberOfMealsPerDay: int.parse(numberOfMealsPerDayController.text),
                                      waterIntakePerDay: double.parse(waterIntakePerDayController.text),
                                      bloodPressure: bloodPressureController.text,
                                      userId: '',
    );

    setState(() {
      context.read<SignUpBloc>().add(
        SignUpRequired(
          myUser,
          passwordController.text,
        ),
      );
    });
  }
},

													style: TextButton.styleFrom(
														elevation: 3.0,
														backgroundColor: Theme.of(context).colorScheme.primary,
														foregroundColor: Colors.white,
														shape: RoundedRectangleBorder(
															borderRadius: BorderRadius.circular(60)
														)
													),
													child: const Padding(
														padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
														child: Text(
															'Sign Up',
															textAlign: TextAlign.center,
															style: TextStyle(
																color: Colors.white,
																fontSize: 16,
																fontWeight: FontWeight.w600
															),
														),
													)
												),
											)
										: const CircularProgressIndicator()
								],
							),
						),
				),
		);
  }
}