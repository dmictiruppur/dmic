import 'package:flutter/material.dart';
import 'package:kannada_devangar/core/colors.dart';

class AppBarTitle extends StatelessWidget {
  final String ProfileTitle;

  const AppBarTitle(this.ProfileTitle);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildTitle(this.ProfileTitle.toString()),
    );
  }

  Widget _buildTitle(String profileTitle) {
    return new Text(
      profileTitle,
      style: new TextStyle(
        fontWeight: FontWeight.w700,
        color: TassistWhite,
        fontSize: 25.0,
        letterSpacing: 1.0,
      ),
    );
  }
}
