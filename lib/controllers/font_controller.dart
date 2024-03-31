import 'package:flutter/material.dart';

double defineFont(String message, var context, int defaultLenght) {
    if (message.length < defaultLenght) {
      return MediaQuery.of(context).size.width / defaultLenght;
    }
    return MediaQuery.of(context).size.width / (message.length);
}