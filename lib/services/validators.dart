String? roleValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Role cannot be empty';
  }
  return null;
}

String? firstNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'First Name cannot be empty';
  }
  return null;
}

String? lastNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Last Name cannot be empty';
  }
  return null;
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email cannot be empty';
  } else if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}

String? phoneNumberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number cannot be empty';
  } else if (!RegExp(r'^\+?[0-9]{10,13}$').hasMatch(value)) {
    return 'Enter a valid phone number';
  }
  return null;
}

String? currentCityValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Current City cannot be empty';
  }
  return null;
}

String? experienceValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Experience cannot be empty';
  }
  return null;
}

String? bioValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Bio cannot be empty';
  }
  return null;
}


String? whyApplyValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please explain why you want to apply.';
  }
  return null;
}


String? expectationFromRoleValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please explain your expectations from this role.';
  }
  return null;
}

String? whatExpectFromUsValidator(String? value) {  
  if (value == null || value.trim().isEmpty) {
    return 'Please explain what you expect from us.';
  }
  return null;
}

// Optional: Link Validator 
String? linkValidator(String? value) {
  if (value != null && value.isNotEmpty) {  
      if (!Uri.tryParse(value)!.isAbsolute) {
          return 'Please enter a valid link (URL).';
      }

  return null;
}
  return null;
}