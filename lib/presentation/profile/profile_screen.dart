import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifepro_new/presentation/profile/profile_controller.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    final profileState = ref.read(profileControllerProvider);
    _fullNameController = TextEditingController(text: profileState.userProfile.fullName);
    _emailController = TextEditingController(text: profileState.userProfile.email);
    _phoneController = TextEditingController(text: profileState.userProfile.phoneNumber);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
                    hint: 'Enter your phone number',
                    onChanged: profileController.updatePhone,
                    keyboardType: TextInputType.phone,
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
                ],
              ),
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
}

class _ProfileField extends StatefulWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final String? errorText;
  final String hint;
  final Function(String) onChanged;
  final TextInputType keyboardType;

  const _ProfileField({
    required this.label,
    required this.icon,
    required this.controller,
    this.errorText,
    required this.hint,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
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
        onChanged: widget.onChanged,
      ),
    );
  }
}
