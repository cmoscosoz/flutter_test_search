import 'package:dev_test_2degrees/src/cubits/address_qualification/address_qualification_cubit.dart';
import 'package:dev_test_2degrees/src/cubits/adress_search/address_search_cubit.dart';
import 'package:dev_test_2degrees/src/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutocompleteAddressSearch extends StatelessWidget {
  const AutocompleteAddressSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Autocomplete<Address>(
            optionsBuilder: (TextEditingValue textEditingValue) async {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<Address>.empty();
              }

              final cubit = context.read<AddressSearchCubit>();

              await cubit.performSearch(textEditingValue.text);

              final newState = cubit.state;

              if (newState is SearchStateSuccess) {
                return newState.addresses;
              }

              return [];
            },
            displayStringForOption: (Address option) => option.addressText,
            fieldViewBuilder:
                (context, controller, focusNode, onFieldSubmitted) {
              return TextField(
                controller: controller,
                focusNode: focusNode,
                decoration: InputDecoration(
                  labelText: 'Search Address',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => context
                        .read<AddressSearchCubit>()
                        .onTextChange(controller.text.trim()),
                  ),
                ),
              );
            },
            optionsViewBuilder: (context, onSelected, options) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 4.0,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Address option = options.elementAt(index);
                        return ListTile(
                          title: Text(option.addressText),
                          subtitle:
                              Text('${option.suburb}, ${option.postCode}'),
                          onTap: () {
                            onSelected(option);
                            context
                                .read<AddressQualificationCubit>()
                                .getQualification(
                                  locationId: option.locationId,
                                );
                          },
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        BlocBuilder<AddressSearchCubit, AddressSearchState>(
          builder: (context, state) {
            if (state is SearchStateEmpty) {
              return const Text('Search for an address');
            }

            if (state is SearchStateError) {
              return Text('${state.error}');
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
