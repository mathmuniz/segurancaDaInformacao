String encryptVigenere(String text, String key) {
  String encryptedText = '';
  int keyIndex = 0;

  for (int i = 0; i < text.length; i++) {
    if (text[i] == ' ') {
      encryptedText += ' ';
      continue;
    }

    int textCharCode = text.codeUnitAt(i);
    int keyCharCode = key.codeUnitAt(keyIndex);
    int encryptedCharCode = (textCharCode + keyCharCode) % 26 + 65;

    if (encryptedCharCode < 65 || encryptedCharCode > 90) {
      encryptedText += text[i];
    } else {
      encryptedText += String.fromCharCode(encryptedCharCode);
    }

    keyIndex = (keyIndex + 1) % key.length;
  }

  return encryptedText;
}

String decryptVigenere(String encryptedText, String key) {
  String decryptedText = '';
  int keyIndex = 0;

  for (int i = 0; i < encryptedText.length; i++) {
    if (encryptedText[i] == ' ') {
      decryptedText += ' ';
      continue;
    }

    int encryptedCharCode = encryptedText.codeUnitAt(i);
    int keyCharCode = key.codeUnitAt(keyIndex);
    int decryptedCharCode = (encryptedCharCode - keyCharCode + 26) % 26 + 65;

    if (decryptedCharCode < 65 || decryptedCharCode > 90) {
      decryptedText += encryptedText[i];
    } else {
      decryptedText += String.fromCharCode(decryptedCharCode);
    }

    keyIndex = (keyIndex + 1) % key.length;
  }

  return decryptedText;
}

void main() {
  String text = 'hello world'.toUpperCase();
  String key = 'dead'.toUpperCase();

  String encryptedText = encryptVigenere(text, key);
  print('Texto criptografado: $encryptedText');

  String decryptedText = decryptVigenere(encryptedText, key);
  print('Texto descriptografado: $decryptedText');
}
