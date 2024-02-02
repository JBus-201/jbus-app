import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/wallet/card/bloc/card_bloc.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/add_card_text_fields/buttons/add_button.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/add_card_text_fields/containers/card_for_adding.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/add_card_text_fields/text_fields/card_holder_name_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/add_card_text_fields/text_fields/card_number_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/add_card_text_fields/text_fields/cvv_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/add_card_text_fields/text_fields/mm_text_field.dart';
import 'package:jbus_app/screens/wallet/card/widgets/text_fields/add_card_text_fields/text_fields/yy_text_field.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                foregroundColor: ourNavey,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                  (context, index) => BlocBuilder<CardBloc, CardState>(
                    builder: (context, state) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 8, left: 8, right: 8),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            AddButton(formKey: formKey),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        const CardContainerForAdding(),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 12, right: 12),
                                    child: Column(
                                      children: [
                                        CardNumberTextField(),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Expanded(
                                              child: MMTextField(),
                                            ),
                                            Expanded(
                                              child: YYTextField(),
                                            ),
                                          ],
                                        ),
                                        CVVTextField(),
                                        CardHolderNameTextField(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
