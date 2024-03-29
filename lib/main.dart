
import 'package:flungry/pages/flungry_landing.dart';
import 'package:flungry/pages/flungry_loading.dart';
import 'package:flungry/pages/flungry_order_complete.dart';
import 'package:flungry/pages/flungry_order_received.dart';
import 'package:flungry/pages/flungry_orderflow_up.dart';
import 'package:flungry/pages/flungry_screen1.dart';
import 'package:flungry/pages/flungry_screen2.dart';
import 'package:flungry/pages/flungry_screen3.dart';
import 'package:flungry/pages/flutter_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(child: const FluffyApp()));
}

class AppRoutes {

  static final router = GoRouter(
    routerNeglect: true,
    initialLocation: '/loading',
    routes: [
      GoRoute(
        path: '/loading',
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: FlungryLoading());
        }
      ),
      GoRoute(
        path: '/landing',
        builder: (context, state) {
          return const FlungryLandingPage();
        }
      ),
      GoRoute(
        path: '/order-complete',
        builder: (context, state) {
          return const FlungryOrderComplete();
        }
      ),
      GoRoute(
        path: '/order-screen',
        builder: (context, state) {
          return FlungryOrderScreen(
            screenIndex: int.parse(state.queryParams['screenIndex']!),
            pipeArtboard: state.queryParams['artboard']!,
            secs: int.parse(state.queryParams['secs']!),
          );
        }
      ),
      GoRoute(
        path: '/order-received',
        builder: (context, state) {
          return const FlungryOrderReceived();
        }
      ),

      // GoRoute(
      //   path: '/order-up',
      //   pageBuilder: (context, state) {
      //     return const NoTransitionPage(child: FlungryOrderFlowUp());
      //   }
      // ),
      // GoRoute(
      //   path: '/screen1',
      //   pageBuilder: (context, state) {
      //     return const NoTransitionPage(child: FlungryScreen1());
      //   }
      // ),
      // GoRoute(
      //   path: '/screen2',
      //   pageBuilder: (context, state) {
      //     return const NoTransitionPage(child: FlungryScreen2());
      //   }
      // ),
      // GoRoute(
      //   path: '/screen3',
      //   pageBuilder: (context, state) {
      //     return const NoTransitionPage(child: FlungryScreen3());
      //   }
      // )
    ]
  );

}

// wrapper screens
class FluffyApp extends StatelessWidget {
  const FluffyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Bukhari'
      ),
      debugShowCheckedModeBanner: false,
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routerDelegate: AppRoutes.router.routerDelegate,
    );
  }
}

