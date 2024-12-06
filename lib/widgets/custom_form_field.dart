import 'package:flutter/material.dart';
import 'package:registration/utils/appTheme.dart';

class CustomFormField extends StatelessWidget {
    final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final String formTitleText;
  final int maxLines;
  final ValueChanged<String>? onChanged;
 

  const CustomFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.validator,
    required this.formTitleText,
    this.maxLines = 1,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formTitleText,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 5),
        Container( 
          decoration: BoxDecoration(
            color: AppTheme.lightTheme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(8), 
          ),
          child: TextFormField(
            validator: validator,
            maxLines: maxLines,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              border: InputBorder.none, 
              focusedBorder: InputBorder.none, 
              enabledBorder: InputBorder.none, 
              errorBorder: InputBorder.none, 
              disabledBorder: InputBorder.none,  
              contentPadding: const EdgeInsets.all(12.0),),

            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}