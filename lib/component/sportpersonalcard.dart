import 'package:flutter/material.dart';
import 'package:nambu_admin/provider/sportpersonprovider.dart';
import 'package:provider/provider.dart';

class Sportpersonalcard extends StatelessWidget {
  final int index;

  Sportpersonalcard({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SportpersonProvider>(context);
    final person = provider.list[index];

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 70.0,
          decoration: BoxDecoration(
            color: provider.isBlueTeam ? Color(0xFFD0E8F2) : Color(0xFFF4C2C2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 15.0),
                Text(person.num.toString(),
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
                const SizedBox(width: 25.0),
                Expanded(
                    child: Text(person.name,
                        style: TextStyle(
                            fontSize: 19.0, fontWeight: FontWeight.w600))),
                Checkbox(
                  value: person.isChecked,
                  onChanged: (bool? value) {
                    provider.toggleCheck(index);
                  },
                  activeColor: Colors.yellowAccent,
                  checkColor: Colors.black,
                ),
                const SizedBox(width: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
