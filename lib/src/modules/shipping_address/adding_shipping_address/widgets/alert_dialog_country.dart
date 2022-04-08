import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:flutter/material.dart';

List<String> listCountries = [
  'Russia',
  'Antarctica',
  'Canada',
  'China',
  'United States',
  'Brazil',
  'Australia',
  'India'
];
AlertDialog alertDialogCountry(BuildContext context) {
  return AlertDialog(
      scrollable: true,
      title: const Text('Country'),
      actions: [
        TextButton(
            onPressed: () => XCoordinator.pop(context),
            child: const Text('CANCEL')),
        TextButton(
            onPressed: () => XCoordinator.pop(context), child: const Text('OK'))
      ],
      content: SizedBox(
        height: 350,
        width: 300.0,
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(listCountries[index]),
              onTap: () {},
            );
          },
          itemCount: listCountries.length,
          separatorBuilder: (context, index) => const Divider(),
        ),
      ));
}
