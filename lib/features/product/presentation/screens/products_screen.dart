import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_appbar_widget.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../authentication/presentation/bloc/auth_bloc.dart';

import '../../../init/presentation/screens/welcome_screen.dart';
import '../../data/models/product.dart';
import '../../data/repositories/product_repository.dart';
import '../bloc/product_bloc.dart';
import '../widgets/error_widget.dart';
import '../widgets/product_card.dart';

// ignore: must_be_immutable
class ProductsScreen extends StatelessWidget {
  static const routeName = 'product/products-screen';

  ProductsScreen({super.key});

  final AuthBloc authBloc = AuthBloc();
  List<Product> productList = [];

  @override
  Widget build(BuildContext context) {
    final S lang = S.of(context);

    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: MultiBlocProvider(
            providers: [
              BlocProvider<ProductBloc>(
                create: (context) =>
                    ProductBloc(ProductRepository())..add(LoadProductsEvent()),
              ),
              BlocProvider<AuthBloc>(
                create: (context) => authBloc,
              ),
            ],
            child: MultiBlocListener(
              listeners: [
                BlocListener<AuthBloc, AuthState>(listener: (context, state) {
                  if (state is LogOutSuccessful) {
                    Navigator.of(context)
                        .pushReplacementNamed(WelcomeScreen.routeName);
                  } else if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Error: ${state.message}'),
                    ));
                  }
                })
              ],
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductsLoaded) {
                    productList = state.products;
                  }
                  return Scaffold(
                      appBar: AppBar(
                        flexibleSpace: const CustomAppbarWidget(),
                      ),
                      body: Stack(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 20, bottom: 10),
                              child: _buildBody(context, lang)),
                          Visibility(
                              visible: (state is ProductsLoading),
                              child: const CustomLoadingWidget()),
                          Visibility(
                              visible: state is ProductError,
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
        _productList(),
      ],
    );
  }

  Expanded _productList() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: productList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 1,
              horizontal: 1,
            ),
            child: ProductCard(product: productList[index]),
          );
        },
      ),
    );
  }
}
