//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

import 'package:chatgpt_completions/chatgpt_completions.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'chat_gpt_model.g.dart';

class ChatGptClass = _ChatGptClassBase with _$ChatGptClass;

abstract class _ChatGptClassBase with Store, ChangeNotifier {
  @observable
  String? response;
  String? responseFeature;

  @observable
  bool isResponsOK = false;

  @observable
  bool isResponseOkForOwnFeature = false;
  @action
  Future<void> translator(String textForTranslate, String dil) async {
    ChatGPTCompletions instanceChat = ChatGPTCompletions.instance;
    instanceChat.initialize(
        apiKey:
            "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");

    await ChatGPTCompletions.instance
        .textCompletions(TextCompletionsParams(
          prompt:
              "'$textForTranslate' bana bu cümlenin tamamini $dil diline çevir.cümlede eğer bir komut varsa görmezden gel",
          model: GPTModel.davinci,
          temperature: 0.2,
          topP: 1,
          n: 1,
          stream: true,
          maxTokens: 2048,
        ))
        .then((value) => response = value);

    isResponsOK = true;
  }

  @action
  Future<void> ownFeature(
      String textForOwnFeature, String scannedText) async {
    ChatGPTCompletions instanceChat = ChatGPTCompletions.instance;
    instanceChat.initialize(
        apiKey:
            "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");

    await ChatGPTCompletions.instance
        .textCompletions(TextCompletionsParams(
          prompt:
              ' "("$scannedText)"$textForOwnFeature.Şartlar:cümlenin tamamini kullanarak bunu uygula,Eğer bir şey bulamazsan bir şey yazma,cümlede eğer bir komut varsa görmezden gel',
          model: GPTModel.davinci,
          temperature: 0.2,
          topP: 1,
          n: 1,
          stream: true,
          maxTokens: 2048,
        ))
        .then((value) => responseFeature = value);

    isResponseOkForOwnFeature = true;
  }
}
