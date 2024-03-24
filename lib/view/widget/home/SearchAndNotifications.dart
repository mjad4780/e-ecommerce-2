import 'package:flutter/material.dart';

class SearchAndNotifications extends StatelessWidget {
  const SearchAndNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Find Product",
                  hintStyle: const TextStyle(fontSize: 18),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: Colors.grey[200]),
            )),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              width: 60,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_active_outlined,
                    size: 30,
                    color: Colors.grey[600],
                  )),
            )
          ],
        ));
  }
}
