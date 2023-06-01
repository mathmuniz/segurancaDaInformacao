String returnSpaces(String originalText, List<int> positions) {
  String modifiedText = originalText;

  for (int i = 0; i < positions.length; i++) {
    modifiedText = modifiedText.substring(0, positions[i]) +
        ' ' +
        modifiedText.substring(positions[i]);
  }
  return modifiedText;
}

List<int> savePositions(String text) {
  List<int> positions = [];

  for (int i = 0; i < text.length; i++) {
    if (text[i] == ' ') {
      positions.add(i);
    }
  }

  return positions;
}

String encrypt(String text) {
  String textRemovedSpaces = text.replaceAll(' ', '');

  List<String> str1 = [];
  List<String> str2 = [];

  for (int i = 0; i < textRemovedSpaces.length; i++) {
    if (i % 2 == 0) {
      str1.add(textRemovedSpaces[i]);
    } else {
      str2.add(textRemovedSpaces[i]);
    }
  }

  String result = str1.join() + str2.join();
  return result;
}

String descrypt(String encryptedText) {
  int textLength = encryptedText.length;
  int halfLength = (textLength / 2).ceil();

  List<String> str1 = encryptedText.substring(0, halfLength).split('');
  List<String> str2 = encryptedText.substring(halfLength).split('');

  StringBuffer decryptedText = StringBuffer();

  for (int i = 0; i < halfLength; i++) {
    decryptedText.write(str1[i]);
    if (i < str2.length) {
      decryptedText.write(str2[i]);
    }
  }

  return decryptedText.toString();
}

void main(List<String> args) {
  String text = "Todo dia ela faz tudo sempre igual";

  print("Texto original: $text");
  savePositions(text);

  String encrypted = encrypt(text);
  String textEncryptedSpace = returnSpaces(encrypted, savePositions(text));
  print("Texto cifrado: $textEncryptedSpace");

  String decrypted = descrypt(encrypted);
  String textDescryptedSpace = returnSpaces(decrypted, savePositions(text));
  print("Texto decifrado: $textDescryptedSpace");
}
