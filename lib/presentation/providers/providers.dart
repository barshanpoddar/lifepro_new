import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifepro_new/core/services/local_storage_service.dart';
import 'package:lifepro_new/core/services/hive_storage_service.dart';
import 'package:lifepro_new/core/services/sos_service.dart';
import 'package:lifepro_new/core/services/auth_service.dart';
import 'package:lifepro_new/domain/repositories/wellbeing_repository.dart';
import 'package:lifepro_new/data/repositories/wellbeing_repository_impl.dart';

// Service Providers
final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  return HiveLocalStorageService();
});

final authServiceProvider = Provider<AuthService>((ref) {
  final storage = ref.watch(localStorageServiceProvider);
  return AuthService(storage);
});

final sosServiceProvider = Provider<SOSService>((ref) {
  return SOSService();
});

// Repository Providers
final wellbeingRepositoryProvider = Provider<WellbeingRepository>((ref) {
  final storage = ref.watch(localStorageServiceProvider);
  return WellbeingRepositoryImpl(storage);
});

// Initialization Provider (to be awaited in main)
final appInitProvider = FutureProvider<void>((ref) async {
  await ref.read(localStorageServiceProvider).init();
});

// Authentication State Provider
final authStateProvider = FutureProvider<bool>((ref) async {
  final authService = ref.watch(authServiceProvider);
  return await authService.isLoggedIn();
});
