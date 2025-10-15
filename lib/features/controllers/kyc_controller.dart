import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

// Controller
class KYCController extends GetxController {
  final pageController = PageController();
  final currentPage = 0.obs;
  final Rx<File?> idCardImage = Rx<File?>(null);
  final Rx<File?> selfieImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  void nextPage() {
    if (currentPage.value < 3) {
      pageController.animateToPage(
        currentPage.value + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      pageController.animateToPage(
        currentPage.value - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> pickIdFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      idCardImage.value = File(image.path);
      nextPage();
    }
  }

  Future<void> takeIdPhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      idCardImage.value = File(image.path);
      nextPage();
    }
  }

  Future<void> takeSelfie() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    );
    if (image != null) {
      selfieImage.value = File(image.path);
      nextPage();
    }
  }

  void changeIdImage() {
    idCardImage.value = null;
    previousPage();
  }

  void retakeSelfie() {
    selfieImage.value = null;
    previousPage();
  }

  void submitKYC() {
    if (idCardImage.value != null && selfieImage.value != null) {
      Get.snackbar(
        'Success',
        'KYC details submitted successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      // Navigate to next screen or reset
    } else {
      Get.snackbar(
        'Error',
        'Please complete all steps',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
