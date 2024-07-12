import 'package:ecommerce_route/domain/di/di.dart';
import 'package:ecommerce_route/ui/screens/products/product_widget.dart';
import 'package:ecommerce_route/ui/screens/products/products_view_model.dart';
import 'package:ecommerce_route/ui/utils/app_assets.dart';
import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:ecommerce_route/ui/utils/base_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  static const String routeName = "products";

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsViewModel viewModel = getIt();

  @override
  void initState() {
    super.initState();
    viewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppAssets.route),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (text) {
                      viewModel.search(text);
                    },
                    controller: viewModel.searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.white,
                      hintText: "what do you search for?",
                      hintStyle: GoogleFonts.poppins(
                          color: AppColors.primary.withOpacity(0.6),
                          fontSize: 14),
                      prefixIcon: Image.asset(AppAssets.searchIcon),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    AppAssets.shoppingIcon,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder(
              bloc: viewModel,
              builder: (context, state) {
                if (state is BaseLoadingState) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                  );
                } else if (state is BaseSuccessState) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.8),
                      itemBuilder: (context, index) =>
                          ProductWidget(state.products, index),
                      itemCount: state.products.products!.length,
                    ),
                  );
                } else {
                  return const Expanded(
                    child: Center(
                        child: Text(
                      "No data found !!",
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 28,
                          fontWeight: FontWeight.w500),
                    )),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
