import 'dart:io';
import 'dart:convert';

import 'package:mime/mime.dart';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:yejing/utils/ai_prompts.dart';

class FirebaseAIService {
  late final GenerativeModel _model;

  FirebaseAIService() {
    _model = FirebaseAI.googleAI().generativeModel(
      model: 'gemini-3.8-flash',
      generationConfig: GenerationConfig(
        temperature: 0.7,
        topK: 40,
        topP: 0.95,
        responseMimeType: 'application/json',
      ),
    );
  }

  Future<Map<String, dynamic>> analyzePlantImage(File imageFile) async {
    try {
      final imageBytes = await imageFile.readAsBytes();
      final mimeType =
          lookupMimeType(imageFile.path, headerBytes: imageBytes) ??
          'image/jpeg';

      final response = await _model.generateContent([
        Content.multi([
          TextPart(AIPrompts.plantDiseaseDetectionPrompt),
          TextPart('Analyze this plant image:'),
          InlineDataPart(mimeType, imageBytes),
        ]),
      ]);

      final responseText = response.text;
      if (responseText == null || responseText.isEmpty) {
        throw Exception('Empty response from AI service');
      }

      final Map<String, dynamic> result =
          jsonDecode(responseText) as Map<String, dynamic>;

      if (!result.containsKey('disease_name') ||
          !result.containsKey('severity') ||
          !result.containsKey('description') ||
          !result.containsKey('treatment')) {
        throw Exception('AI response missing required fields');
      }

      return result;
    } catch (e) {
      throw Exception('Plant analysis failed: $e');
    }
  }
}
