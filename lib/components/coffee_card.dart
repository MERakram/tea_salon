import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {
  const CoffeeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, bottom: 25),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/coffee.jpg'),
            ),
            const SizedBox(height: 4,),
            const Text('Coffee'),
            const SizedBox(height: 4,),
            Text(
              'With milk',
              style: TextStyle(color: Colors.grey[500]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                const Text('\$ 4.5'),
                Container(
                  color: Colors.orange,
                  child: IconButton(onPressed: (){}, icon: const Icon(Icons.add)))
              ]
            )
          ],
        ),
      ),
    );
  }
}
