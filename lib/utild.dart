import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

CollectionReference<Map<String, dynamic>> userCollection = FirebaseFirestore.instance.collection('usuarios');
