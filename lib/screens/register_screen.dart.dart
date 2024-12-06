import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration/screens/register_success_screen.dart';
import '../providers/register_provider.dart';
import '../services/validators.dart';
import '../widgets/custom_form_field.dart';
import '../utils/appTheme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:registration/repositories/data_repo.dart' as api;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _resumeFilePath;

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppTheme.appBarColor,
        title: Text(
          "REGISTRATION FORM",
          style: AppTheme.lightTheme.appBarTheme.titleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: Center(
                    child: Text("Update Personal Details",
                        style: AppTheme.lightTheme.textTheme.titleMedium),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.05),
                  child: Container(
                    padding: EdgeInsets.all(width * 0.05),
                    decoration: BoxDecoration(
                      color: AppTheme.lightTheme.cardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        CustomFormField(
                          formTitleText: "Fill the name of the role",
                          labelText: "Enter the role",
                          hintText: "Fill the name of the role",
                          validator: roleValidator,
                          onChanged: (value) {
                            registerProvider.role = value;
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        CustomFormField(
                          formTitleText: "Enter the First Name",
                          labelText: "Enter the First Name",
                          hintText: "First Name",
                          validator: firstNameValidator,
                          onChanged: (value) {
                            registerProvider.firstName = value;
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        CustomFormField(
                          formTitleText: "Enter the Last Name",
                          labelText: "Enter the Last Name",
                          hintText: "Last Name",
                          validator: lastNameValidator,
                          onChanged: (value) {
                            registerProvider.lastName = value;
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        // Email
                        CustomFormField(
                          formTitleText: "Enter the Email",
                          labelText: "Enter the Email",
                          hintText: "example@gmail.com",
                          onChanged: (value) {
                            registerProvider.email = value;
                          },
                          validator: emailValidator,
                        ),
                        SizedBox(height: height * 0.02),
                        // Phone Number
                        CustomFormField(
                          formTitleText: "Enter the phone number",
                          labelText: "Enter the phone number",
                          hintText: "+91 0000000000",
                          onChanged: (value) {
                            registerProvider.phoneNumber = value;
                          },
                          validator: phoneNumberValidator,
                        ),
                        SizedBox(height: height * 0.02),
                        // Current City
                        CustomFormField(
                          formTitleText: "Enter the current city",
                          labelText: "Current City",
                          hintText: "Bangalore",
                          onChanged: (value) {
                            registerProvider.currentCity = value;
                          },
                          validator: currentCityValidator,
                        ),
                        SizedBox(height: height * 0.02),
                        // Experience
                        CustomFormField(
                          formTitleText: "Enter your Experience",
                          labelText: "Enter the experience",
                          hintText: "Add your experience",
                          onChanged: (value) {
                            registerProvider.experience = value;
                          },
                          validator: experienceValidator,
                        ),
                        SizedBox(height: height * 0.02),

                        // Your Bio
                        CustomFormField(
                          formTitleText: "Enter your bio",
                          maxLines: 3,
                          labelText: "Enter your bio",
                          hintText: "Add your bio",
                          validator: bioValidator,
                          onChanged: (value) {
                            registerProvider.bio = value;
                          },
                        ),

                        SizedBox(height: height * 0.02),

                        // Why do you want to apply for this role
                        CustomFormField(
                          formTitleText:
                              "Why do you want to apply for this role",
                          maxLines: 3,
                          labelText:
                              "Enter why do you want to apply for this role",
                          hintText: "Add Last Name",
                          validator: whyApplyValidator,
                          onChanged: (value) {
                            registerProvider.bio = value;
                          },
                        ),
                        SizedBox(height: height * 0.02),

                        // Why do you expect  for this role
                        CustomFormField(
                          formTitleText: "Why do you expect  for this role",
                          maxLines: 3,
                          labelText: "Enter Why do you expect  for this role",
                          hintText: "Add Last Name",
                          validator: expectationFromRoleValidator,
                          onChanged: (value) {
                            registerProvider.bio = value;
                          },
                        ),
                        SizedBox(height: height * 0.02),

                        // What expect from us
                        CustomFormField(
                          formTitleText: "What expect from us",
                          maxLines: 3,
                          labelText: "Enter What expect from us",
                          hintText: "Add Last Name",
                          validator: whatExpectFromUsValidator,
                          onChanged: (value) {
                            registerProvider.bio = value;
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        // Other Links
                        CustomFormField(
                          formTitleText: "Other Links",
                          maxLines: 3,
                          labelText: "Enter any Links",
                          hintText: "Add links",
                          validator: linkValidator,
                          onChanged: (value) {
                            registerProvider.bio = value;
                          },
                        ),
                        SizedBox(height: height * 0.02),

                        // File Picker Button
                         Container( 
                          width: double.infinity,
                          decoration: BoxDecoration(
                             color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),

                          child: ElevatedButton(
                            onPressed: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['pdf'],
                            );
                            if (result != null) {
                              setState(() {
                                _resumeFilePath = result.files.single.path;
                              });
                            }
                          },

                            style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black, 
                            elevation: 0, 
                            textStyle:const  TextStyle(fontWeight: FontWeight.bold),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(8.0), 
                             ),
                            ),

                            child: const Text('Choose Resume (PDF)'),

                          ),
                        ),
                        
                        SizedBox(height: height * 0.02),
                        

                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                             color: AppTheme.titleColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate() &&
                                  _resumeFilePath != null) {
                                registerProvider.isLoading = true;
                                try {
                                  final encodedPDF =
                                      api.convertPDF(path: _resumeFilePath!);
                                  final jsonData = api.encodeJson(
                                    phoneNumber:
                                        registerProvider.phoneNumber ?? '',
                                    bio: registerProvider.bio ?? '',
                                    currentCity:
                                        registerProvider.currentCity ?? '',
                                    experience: registerProvider.experience ?? '',
                                    email: registerProvider.email ?? '',
                                    encodedPDF: encodedPDF,
                                    roleName: registerProvider.role ?? '',
                                    firstName: registerProvider.firstName ?? '',
                                    lastName: registerProvider.lastName ?? '',
                                    applyForRole:
                                        registerProvider.applyForRole ?? '',
                                    expectFromRoleAndUs:
                                        registerProvider.expectFromRoleAndUs ??
                                            '',
                                    otherLinks: registerProvider.otherLinks ?? '',
                                    whatdoYouExpect:
                                        registerProvider.whatdoYouExpect ?? '',
                                  );
                                  final success =
                                      await api.dioClient(data: jsonData);
                                  if (success) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Registration successful!')));
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterSuccessScreen()));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Registration failed.')));
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Error: $e')));
                                } finally {
                                  registerProvider.isLoading = false;
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please correct errors and select a resume.')));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              side: BorderSide.none,
                              elevation: 0.0,
                              backgroundColor: AppTheme.titleColor,
                              minimumSize: const Size.fromHeight(50),
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                            child: registerProvider.isLoading
                                ? const CircularProgressIndicator()
                                : const Text("Submit"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
