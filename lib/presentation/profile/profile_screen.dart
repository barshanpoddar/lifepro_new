import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lifepro_new/domain/entities/user_profile.dart';
import 'package:lifepro_new/presentation/profile/profile_controller.dart';
import 'package:lifepro_new/presentation/screens/settings_screen.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _nicknameController;
  late TextEditingController _bioController;
  late TextEditingController _occupationController;
  late TextEditingController _countryController;
  late TextEditingController _cityController;
  late TextEditingController _timezoneController;

  @override
  void initState() {
    super.initState();
    final profileState = ref.read(profileControllerProvider);
    _fullNameController = TextEditingController(
      text: profileState.userProfile.fullName,
    );
    _emailController = TextEditingController(
      text: profileState.userProfile.email,
    );
    _phoneController = TextEditingController(
      text: profileState.userProfile.phoneWithCountryCode,
    );
    _nicknameController = TextEditingController(
      text: profileState.userProfile.nickname,
    );
    _bioController = TextEditingController(
      text: profileState.userProfile.bio,
    );
    _occupationController = TextEditingController(
      text: profileState.userProfile.occupation ?? '',
    );
    _countryController = TextEditingController(
      text: profileState.userProfile.country ?? '',
    );
    _cityController = TextEditingController(
      text: profileState.userProfile.city ?? '',
    );
    _timezoneController = TextEditingController(
      text: profileState.userProfile.timezone ?? '',
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _nicknameController.dispose();
    _bioController.dispose();
    _occupationController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _timezoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileControllerProvider);
    final profileController = ref.read(profileControllerProvider.notifier);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Picture Section
                  _ProfilePictureSection(
                    profilePictureUrl:
                        profileState.userProfile.profilePictureUrl,
                    onPickImage: () =>
                        _showImageSourceDialog(context, profileController),
                  ),
                  const SizedBox(height: 32),

                  // Basic Details Section
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Basic Details",
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _ProfileField(
                    label: 'Full Name',
                    icon: Icons.person,
                    controller: _fullNameController,
                    errorText: profileState.fieldErrors?['fullName'],
                    hint: 'Enter your full name',
                    onChanged: profileController.updateFullName,
                    keyboardType: TextInputType.name,
                  ),
                  _ProfileField(
                    label: 'Email',
                    icon: Icons.email,
                    controller: _emailController,
                    errorText: profileState.fieldErrors?['email'],
                    hint: 'Enter your email',
                    onChanged: profileController.updateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _ProfileField(
                    label: 'Phone Number',
                    icon: Icons.phone,
                    controller: _phoneController,
                    errorText: profileState.fieldErrors?['phone'],
                    hint: '+91 9876543210',
                    onChanged: profileController.updatePhone,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 32),

                  // Personal Section
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Personal",
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _DatePickerField(
                    label: 'Date of Birth',
                    icon: Icons.calendar_today,
                    selectedDate: profileState.userProfile.dob,
                    onChanged: profileController.updateDob,
                    ageText: profileController.ageDisplay,
                    errorText: profileState.fieldErrors?['dob'],
                  ),
                  _GenderDropdown(
                    label: 'Gender',
                    icon: Icons.wc,
                    selectedGender: profileState.userProfile.gender,
                    onChanged: profileController.updateGender,
                    errorText: profileState.fieldErrors?['gender'],
                  ),
                  _ProfileField(
                    label: 'Nickname',
                    icon: Icons.star,
                    controller: _nicknameController,
                    hint: 'Enter your nickname (optional)',
                    onChanged: profileController.updateNickname,
                  ),
                  _ProfileField(
                    label: 'Bio',
                    icon: Icons.description,
                    controller: _bioController,
                    errorText: profileState.fieldErrors?['bio'],
                    hint: 'Tell us about yourself (max 200 chars)',
                    onChanged: profileController.updateBio,
                    maxLines: 3,
                  ),
                  _ProfileField(
                    label: 'Occupation',
                    icon: Icons.work,
                    controller: _occupationController,
                    hint: 'Enter your occupation (optional)',
                    onChanged: (value) => profileController.updateOccupation(value.isEmpty ? null : value),
                  ),
                  _ProfileField(
                    label: 'Country',
                    icon: Icons.flag,
                    controller: _countryController,
                    hint: 'Enter your country (optional)',
                    onChanged: (value) => profileController.updateCountry(value.isEmpty ? null : value),
                  ),
                  _ProfileField(
                    label: 'City',
                    icon: Icons.location_city,
                    controller: _cityController,
                    hint: 'Enter your city (optional)',
                    onChanged: (value) => profileController.updateCity(value.isEmpty ? null : value),
                  ),
                  _ProfileField(
                    label: 'Timezone',
                    icon: Icons.schedule,
                    controller: _timezoneController,
                    hint: 'Enter your timezone (e.g., UTC+5.5) (optional)',
                    onChanged: (value) => profileController.updateTimezone(value.isEmpty ? null : value),
                  ),
                  const SizedBox(height: 40),

                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: profileController.isFormValid
                          ? profileController.saveProfile
                          : null,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: profileState.isSaving
                          ? const CircularProgressIndicator()
                          : const Text('Save Profile'),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Profile Options (shown after saving)
                  if (profileState.showProfileOptions) ...[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Profile Options",
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _ProfileOptionTile(
                      icon: Icons.person,
                      title: 'Personal Details',
                      subtitle: 'View and edit personal information',
                      onTap: () => _navigateToPersonalDetails(context),
                    ),
                    _ProfileOptionTile(
                      icon: Icons.group_add,
                      title: 'Add Member',
                      subtitle: 'Add family members or dependents',
                      onTap: () => _navigateToAddMember(context),
                    ),
                    _ProfileOptionTile(
                      icon: Icons.settings,
                      title: 'Settings',
                      subtitle: 'App settings and preferences',
                      onTap: () => _navigateToSettings(context),
                    ),
                    _ProfileOptionTile(
                      icon: Icons.logout,
                      title: 'Login Options',
                      subtitle: 'Logout or account management',
                      onTap: () => _showLoginOptions(context),
                    ),
                  ],
                ],
              ),
            ),

            // OTP Dialog
            if (profileState.showOtpDialog)
              _OtpDialog(
                onVerify: (otp) => profileController.verifyOtp(otp),
                onClose: profileController.closeOtpDialog,
                isLoading: false,
                error: profileState.errorMessage,
              ),

            // Email Verification Dialog
            if (profileState.showEmailVerificationDialog)
              _EmailVerificationDialog(
                onVerify: profileController.verifyEmail,
                onClose: profileController.closeEmailDialog,
              ),

            // Success Popup
            if (profileState.profileSaved)
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.check, color: Colors.white),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Profile Updated Successfully',
                          style: textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: profileController.dismissSuccess,
                        icon: const Icon(Icons.close, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showImageSourceDialog(
    BuildContext context,
    ProfileController controller,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Take Photo'),
                onTap: () {
                  Navigator.pop(context);
                  controller.pickProfilePicture(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  controller.pickProfilePicture(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToPersonalDetails(BuildContext context) {
    // Scroll to the top to show the profile form
    final scrollController = ScrollController();
    if (scrollController.hasClients) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Personal Details - Edit your profile above')),
    );
  }

  void _navigateToAddMember(BuildContext context) {
    // Navigate to add emergency contact screen or show dialog
    _showAddEmergencyContactDialog(context);
  }

  void _navigateToSettings(BuildContext context) {
    // Navigate to settings screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const SettingsScreen(),
      ),
    );
  }

  void _showLoginOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                  _showLogoutDialog(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('Change Password'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Change Password - Feature Coming Soon')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete Account'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Delete Account - Feature Coming Soon')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Implement logout logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logged out successfully')),
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  void _showAddEmergencyContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return _AddEmergencyContactDialog(
          onAddContact: (name, phone, relation) {
            ref.read(profileControllerProvider.notifier).addEmergencyContact(
              name,
              phone,
              relation,
            );
          },
        );
      },
    );
  }
}

class _ProfilePictureSection extends StatelessWidget {
  final String? profilePictureUrl;
  final VoidCallback onPickImage;

  const _ProfilePictureSection({
    required this.profilePictureUrl,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          backgroundImage: profilePictureUrl != null
              ? (profilePictureUrl!.startsWith('http')
                        ? CachedNetworkImageProvider(profilePictureUrl!)
                        : FileImage(File(profilePictureUrl!)))
                    as ImageProvider?
              : null,
          child: profilePictureUrl == null
              ? const Icon(Icons.person, size: 60, color: Colors.grey)
              : null,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: IconButton(
              icon: const Icon(Icons.camera_alt, color: Colors.white),
              onPressed: onPickImage,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileField extends StatefulWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final String? errorText;
  final String hint;
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final int? maxLines;

  const _ProfileField({
    required this.label,
    required this.icon,
    required this.controller,
    this.errorText,
    required this.hint,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.maxLines,
  });

  @override
  _ProfileFieldState createState() => _ProfileFieldState();
}

class _ProfileFieldState extends State<_ProfileField> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
          errorText: widget.errorText,
          prefixIcon: Icon(widget.icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: theme.colorScheme.surfaceContainerHighest,
        ),
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        onChanged: widget.onChanged,
      ),
    );
  }
}

class _DatePickerField extends StatelessWidget {
  final String label;
  final IconData icon;
  final DateTime? selectedDate;
  final Function(DateTime) onChanged;
  final String ageText;
  final String? errorText;

  const _DatePickerField({
    required this.label,
    required this.icon,
    this.selectedDate,
    required this.onChanged,
    required this.ageText,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            readOnly: true,
            decoration: InputDecoration(
              labelText: label,
              errorText: errorText,
              prefixIcon: Icon(icon),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHighest,
              suffixIcon: const Icon(Icons.calendar_today),
            ),
            controller: TextEditingController(
              text: selectedDate != null
                  ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                  : '',
            ),
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate:
                    selectedDate ??
                    DateTime.now().subtract(const Duration(days: 365 * 18)),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                onChanged(picked);
              }
            },
          ),
          if (ageText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 4),
              child: Text(
                ageText,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _GenderDropdown extends StatelessWidget {
  final String label;
  final IconData icon;
  final Gender? selectedGender;
  final Function(Gender) onChanged;
  final String? errorText;

  const _GenderDropdown({
    required this.label,
    required this.icon,
    this.selectedGender,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<Gender>(
        decoration: InputDecoration(
          labelText: label,
          errorText: errorText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: theme.colorScheme.surfaceContainerHighest,
        ),
        initialValue: selectedGender,
        items: Gender.values.map((gender) {
          return DropdownMenuItem(
            value: gender,
            child: Text(_genderDisplay(gender)),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) onChanged(value);
        },
      ),
    );
  }

  String _genderDisplay(Gender gender) {
    switch (gender) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.other:
        return 'Other';
      case Gender.preferNotToSay:
        return 'Prefer not to say';
    }
  }
}

class _OtpDialog extends StatefulWidget {
  final Function(String) onVerify;
  final VoidCallback onClose;
  final bool isLoading;
  final String? error;

  const _OtpDialog({
    required this.onVerify,
    required this.onClose,
    required this.isLoading,
    this.error,
  });

  @override
  _OtpDialogState createState() => _OtpDialogState();
}

class _OtpDialogState extends State<_OtpDialog> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Enter OTP',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('An OTP has been sent to your phone for verification.'),
            const SizedBox(height: 16),
            TextField(
              controller: _otpController,
              decoration: const InputDecoration(
                labelText: 'OTP',
                hintText: 'Enter 6-digit OTP',
              ),
              keyboardType: TextInputType.number,
              maxLength: 6,
            ),
            if (widget.error != null)
              Text(widget.error!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: widget.onClose,
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: widget.isLoading
                      ? null
                      : () => widget.onVerify(_otpController.text),
                  child: widget.isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Verify'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}

class _EmailVerificationDialog extends StatelessWidget {
  final VoidCallback onVerify;
  final VoidCallback onClose;

  const _EmailVerificationDialog({
    required this.onVerify,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Verify Email',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'A verification email has been sent to your email address.',
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: onClose, child: const Text('Cancel')),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: onVerify,
                  child: const Text('Mark as Verified'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ProfileOptionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: theme.colorScheme.primary),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}

typedef _AddContactCallback = void Function(String name, String phone, String relation);

class _AddEmergencyContactDialog extends StatefulWidget {
  final _AddContactCallback onAddContact;

  const _AddEmergencyContactDialog({required this.onAddContact});

  @override
  State<_AddEmergencyContactDialog> createState() =>
      _AddEmergencyContactDialogState();
}

class _AddEmergencyContactDialogState extends State<_AddEmergencyContactDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _relationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Add Emergency Contact',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter contact name',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
                hintText: 'Enter phone number',
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _relationController,
              decoration: const InputDecoration(
                labelText: 'Relation',
                hintText: 'e.g., Father, Mother, Spouse',
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (_nameController.text.isEmpty ||
                        _phoneController.text.isEmpty ||
                        _relationController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all fields'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    // Save the emergency contact
                    widget.onAddContact(
                      _nameController.text,
                      _phoneController.text,
                      _relationController.text,
                    );

                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Emergency contact added'),
                      ),
                    );
                  },
                  child: const Text('Add Contact'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _relationController.dispose();
    super.dispose();
  }
}
