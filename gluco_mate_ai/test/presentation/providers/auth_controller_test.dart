import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:gluco_mate_ai/presentation/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockUserCredential extends Mock implements UserCredential {}

void main() {
  late ProviderContainer container;
  late MockFirebaseAuth mockAuth;

  setUp(() {
    mockAuth = MockFirebaseAuth();
    container = ProviderContainer(overrides: [
   authProvider.overrideWithValue(mockAuth),
    ]);
  });

  test('sign in with email succeeds', () async {
    final fakeCredential = MockUserCredential();
    when(() => mockAuth.signInWithEmailAndPassword(
          email: 'test@test.com',
          password: 'password',
        )).thenAnswer((_) async => fakeCredential);

    final auth = container.read(authControllerProvider);
    await auth.signInWithEmail('test@test.com', 'password');

    verify(() => mockAuth.signInWithEmailAndPassword(
          email: 'test@test.com',
          password: 'password',
        )).called(1);
  });

  test('register with email succeeds', () async {
    final fakeCredential = MockUserCredential();
    when(() => mockAuth.createUserWithEmailAndPassword(
          email: 'test@test.com',
          password: 'password',
        )).thenAnswer((_) async => fakeCredential);

    final auth = container.read(authControllerProvider);
    await auth.registerWithEmail('test@test.com', 'password');

    verify(() => mockAuth.createUserWithEmailAndPassword(
          email: 'test@test.com',
          password: 'password',
        )).called(1);
  });

  test('sign out succeeds', () async {
    when(() => mockAuth.signOut()).thenAnswer((_) async {});

    final auth = container.read(authControllerProvider);
    await auth.logout();

    verify(() => mockAuth.signOut()).called(1);
  });
}
