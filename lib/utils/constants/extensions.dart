// import 'package:encrypt/encrypt.dart';
// import 'package:sareefx/core/core.dart';

// extension StringEncryption on String {
//   static final Key _key = Key.fromUtf8(
//     SareefConfig.instance!.values.globalEncryptionKey,
//   );
//   static final IV _iv = IV.fromUtf8(
//     '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00',
//   );

//   static final Encrypter _encrypter = Encrypter(
//     AES(_key, mode: AESMode.cbc),
//   );

//   String encryptString() {
//     final encrypted = _encrypter.encrypt(this, iv: _iv);
//     return encrypted.base64;
//   }

//   String decryptString() {
//     final decrypted = _encrypter.decrypt(
//       Encrypted.fromBase64(this),
//       iv: _iv,
//     );
//     return decrypted;
//   }
// }
