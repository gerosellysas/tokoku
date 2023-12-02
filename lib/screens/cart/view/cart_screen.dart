import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoku/bloc/transaction/transaction.bloc.dart';
import 'package:tokoku/res/resources.dart';
import 'package:tokoku/screens/cart/view/cart_button.dart';
import 'package:tokoku/screens/cart/view/cart_card.dart';
import 'package:tokoku/screens/cart/view/cart_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        automaticallyImplyLeading: false,
        elevation: 4.0,
        shadowColor: AppColors.lightGrey.withOpacity(0.32),
        leadingWidth: AppSize.responsive(48),
        leading: AppIconButton(
          icon: AppImages.back,
          color: AppColors.material,
          onPressed: () {},
        ),
        titleSpacing: 0.0,
        title: Text(
          'Shopping Cart',
          style: AppFonts.semibold(
            color: AppColors.material,
            size: 16,
          ),
        ),
        actions: [
          AppIconButton(
            icon: AppImages.delete,
            color: AppColors.material,
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BlocBuilder<TransactionBloc, TransactionState>(
            builder: (context, state) {
              return CartList(
                itemCount: 20,
                itemBuilder: (context, i) {
                  return const CartCard();
                },
              );
            },
          ),
          const CartButton(),
        ],
      ),
    );
  }
}
