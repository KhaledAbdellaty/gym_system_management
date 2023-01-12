import 'package:flutter/material.dart';

bool isFullScreen(BuildContext context) =>
    MediaQuery.of(context).size.width > 990;

bool notFullScreen(BuildContext context) =>
    MediaQuery.of(context).size.width <= 990;

double defaultPadding = 16;
