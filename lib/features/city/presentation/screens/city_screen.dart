import 'dart:developer';

import 'package:demo_flutter_app/features/city/data/models/city.dart';
import 'package:demo_flutter_app/features/city/presentation/bloc/city_bloc.dart';
import 'package:demo_flutter_app/features/city/presentation/widgets/city_card.dart';
import 'package:demo_flutter_app/features/user/bloc/user_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/sizes.dart';
import '../../../../core/widgets/custom_appbar_widget.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../authentication/presentation/bloc/auth_bloc.dart';
import '../../../init/presentation/screens/welcome_screen.dart';
import '../../../product/presentation/screens/products_screen.dart';
import '../widgets/error_widget.dart';

// ignore: must_be_immutable
class CityScreen extends StatelessWidget {
  static const routeName = 'city/city-screen';

  CityScreen({super.key});

  final UserBloc userBloc = UserBloc();
  final AuthBloc authBloc = AuthBloc();
  List<City> cityList = [];

  @override
  Widget build(BuildContext context) {
    final S lang = S.of(context);

    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: MultiBlocProvider(
            providers: [
              BlocProvider<CityBloc>(
                create: (context) => CityBloc()..add(GetCities()),
              ),
              BlocProvider<UserBloc>(
                create: (context) => userBloc,
              ),
            ],
            child: MultiBlocListener(
              listeners: [
                BlocListener<UserBloc, UserState>(listener: (context, state) {
                  if (state is UserSuccess) {
                    Navigator.of(context)
                        .pushReplacementNamed(ProductsScreen.routeName);
                  } else if (state is UserFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Error: ${state.message}'),
                    ));
                  }
                })
              ],
              child: BlocBuilder<CityBloc, CityState>(
                builder: (context, state) {
                  if (state is CityLoaded) {
                    cityList = state.cities;
                  }
                  return Scaffold(
                      appBar: AppBar(
                        flexibleSpace: CustomAppbarWidget(
                          onTap: () {
                            authBloc.add(LogOut());
                            Navigator.of(context)
                                .pushReplacementNamed(WelcomeScreen.routeName);
                          },
                        ),
                      ),
                      body: Stack(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 20, bottom: 10),
                              child: _buildBody(context, lang)),
                          Visibility(
                              visible: (state is CityLoading),
                              child: const CustomLoadingWidget()),
                          Visibility(
                              visible: state is CityError,
                              child: const CustomErrorWidget(
                                  message: 'Oops! unexpected error')),
                        ],
                      ));
                },
              ),
            )));
  }

  Widget _buildBody(BuildContext context, S lang) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              lang.cityText,
              style: const TextStyle(
                fontSize: bigTextSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        _cityList(),
      ],
    );
  }

  Expanded _cityList() {
    return Expanded(
      flex: 7,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: cityList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 1,
              horizontal: 1,
            ),
            child: CityCard(
                city: cityList[index],
                onTap: () {
                  userBloc.add(AddUser(
                      cityName: cityList[index].name,
                      userId: FirebaseAuth.instance.currentUser!.uid));
                }),
          );
        },
      ),
    );
  }
}
