import 'package:car_on_sale/src/data/repositories/auction_repository_impl.dart';
import 'package:car_on_sale/src/domain/services/challenge_service.dart';
import 'package:car_on_sale/src/data/sources/auction_local_data_source.dart';
import 'package:car_on_sale/src/data/sources/auction_remote_data_source.dart';
import 'package:car_on_sale/src/domain/entities/auction_data.dart';
import 'package:car_on_sale/src/presentation/bloc/auction_bloc.dart';
import 'package:car_on_sale/src/presentation/pages/auction_data_page.dart';
import 'package:car_on_sale/src/presentation/pages/user_identification_page.dart';
import 'package:car_on_sale/src/presentation/pages/vin_input_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final auctionLocalDataSource = AuctionLocalDataSource();
            final auctionRemoteDataSource = AuctionRemoteDataSource(CosChallenge.httpClient);
            final auctionRepository = AuctionRepositoryImpl(
              remoteDataSource: auctionRemoteDataSource,
              localDataSource: auctionLocalDataSource,
            );
            return AuctionBloc(auctionRepository);
          },
        ),
      ],
      child: MaterialApp(
        title: 'CarOnSale Challenge',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => UserIdentificationPage(),
          '/vinInput': (context) => const VinInputPage(),
          '/auctionData': (context) => AuctionDataPage(
                auctionData: ModalRoute.of(context)!.settings.arguments as AuctionData,
              ),
        },
      ),
    );
  }
}
