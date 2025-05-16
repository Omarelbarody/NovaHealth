import 'package:NovaHealth/features/Profile%20Data/presentation/widgets/profile_data_body.dart';
import 'package:flutter/material.dart';

class ProfileDataView extends StatelessWidget {
  const ProfileDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileDataBody(),
    );
  }
}