import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key,required this.onChanged});

  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: CupertinoSearchTextField(
          itemColor: Theme
              .of(context)
              .colorScheme
              .primary,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Theme
                  .of(context)
                  .colorScheme
                  .secondary
                  .withOpacity(0),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Theme
                  .of(context)
                  .colorScheme
                  .primary)
          ),
          onChanged: onChanged,
          style: Theme
              .of(context)
              .textTheme
              .headlineMedium),
    );
  }
}
