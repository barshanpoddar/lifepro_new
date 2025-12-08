import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lifepro_new/domain/entities/user_profile.dart';
import 'package:lifepro_new/presentation/profile/profile_state.dart';

class ProfileController extends StateNotifier<ProfileState> {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Debounce timers for text field updates
  Timer? _fullNameTimer;
  Timer? _emailTimer;
  Timer? _phoneTimer;

  // Pending values for debounced updates
  String? _pendingFullName;
  String? _pendingEmail;
  String? _pendingPhone;

  ProfileController() : super(const ProfileState()) {
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      final profileJson = await _secureStorage.read(key: 'userProfile');
      if (profileJson != null) {
        final profile = UserProfile.fromJson(json.decode(profileJson));
        state = state.copyWith(userProfile: profile);
      } else {
        state = state.copyWith(userProfile: UserProfile());
      }
    } catch (e) {
      state = state.copyWith(userProfile: UserProfile());
    }
  }

  void updateFullName(String fullName) {
    _pendingFullName = fullName;
    _fullNameTimer?.cancel();
    _fullNameTimer = Timer(const Duration(milliseconds: 500), () {
      if (_pendingFullName != null) {
        final newProfile = state.userProfile.copyWith(fullName: _pendingFullName!);
        state = state.copyWith(userProfile: newProfile);
        _validateField('fullName');
        _pendingFullName = null;
      }
    });
  }

  void updateEmail(String email) {
    _pendingEmail = email;
    _emailTimer?.cancel();
    _emailTimer = Timer(const Duration(milliseconds: 500), () {
      if (_pendingEmail != null) {
        final newProfile = state.userProfile.copyWith(email: _pendingEmail!);
        state = state.copyWith(userProfile: newProfile);
        _validateField('email');
        _pendingEmail = null;
      }
    });
  }

  void updatePhone(String phone) {
    _pendingPhone = phone;
    _phoneTimer?.cancel();
    _phoneTimer = Timer(const Duration(milliseconds: 500), () {
      if (_pendingPhone != null) {
        final newProfile = state.userProfile.copyWith(phoneNumber: _pendingPhone!);
        state = state.copyWith(userProfile: newProfile);
        _validateField('phone');
        _pendingPhone = null;
      }
    });
  }

  void _validateField(String field) {
    final errors = Map<String, String>.from(state.fieldErrors ?? {});
    switch (field) {
      case 'fullName':
        if (state.userProfile.fullName.isEmpty) {
          errors['fullName'] = 'Please enter your full name.';
        } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(state.userProfile.fullName)) {
          errors['fullName'] = 'Full name must not include special characters.';
        } else if (state.userProfile.fullName.split(' ').where((w) => w.isNotEmpty).length < 2) {
          errors['fullName'] = 'Please enter full name with at least first and last name.';
        } else {
          errors.remove('fullName');
        }
        break;
      case 'email':
        if (state.userProfile.email.isEmpty) {
          errors['email'] = 'Please enter your email.';
        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(state.userProfile.email)) {
          errors['email'] = 'Please enter a valid email address.';
        } else {
          errors.remove('email');
        }
        break;
      case 'phone':
        if (state.userProfile.phoneNumber.isEmpty) {
          errors['phone'] = 'Please enter your phone number.';
        } else {
          errors.remove('phone');
        }
        break;
    }
    state = state.copyWith(fieldErrors: errors);
  }

  bool get isFormValid {
    return (state.fieldErrors?.isEmpty ?? true) &&
        state.userProfile.fullName.isNotEmpty &&
        state.userProfile.email.isNotEmpty &&
        state.userProfile.phoneNumber.isNotEmpty;
  }

  Future<void> saveProfile() async {
    if (!isFormValid) return;
    state = state.copyWith(isSaving: true);

    try {
      // Sanitize inputs
      final sanitizedProfile = state.userProfile.copyWith(
        fullName: _sanitizeText(state.userProfile.fullName),
        email: _sanitizeEmail(state.userProfile.email),
        phoneNumber: _sanitizePhone(state.userProfile.phoneNumber),
      );

      // Save to secure storage
      await _secureStorage.write(
        key: 'userProfile',
        value: json.encode(sanitizedProfile.toJson()),
      );

      state = state.copyWith(
        userProfile: sanitizedProfile,
        isSaving: false,
        profileSaved: true,
      );
      Future.delayed(const Duration(seconds: 2), () {
        state = state.copyWith(profileSaved: false);
      });
    } catch (e) {
      state = state.copyWith(isSaving: false, errorMessage: e.toString());
    }
  }

  String _sanitizeText(String text) {
    return text.replaceAll(RegExp(r'[^a-zA-Z\s]'), '').trim();
  }

  String _sanitizeEmail(String email) {
    return email.trim().toLowerCase();
  }

  String _sanitizePhone(String phone) {
    return phone.replaceAll(RegExp(r'[^\d\s]'), '').trim();
  }

  void dismissSuccess() {
    state = state.copyWith(profileSaved: false);
  }

  @override
  void dispose() {
    _fullNameTimer?.cancel();
    _emailTimer?.cancel();
    _phoneTimer?.cancel();
    super.dispose();
  }
}

final profileControllerProvider =
    StateNotifierProvider<ProfileController, ProfileState>(
      (ref) => ProfileController(),
    );
