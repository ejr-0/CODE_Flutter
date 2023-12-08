import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: ListBody(
        children: [
          Container(
            width: size.width,
            height: 2,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "El Nido, officially the Municipality of El Nido (Cuyonon: Banwa i'ang El Nido, Tagalog: Bayan ng El Nido), is a 1st class municipality in the province of Palawan, Philippines. According to the 2020 census, it has a population of 50,494 people.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
                color: Colors.blueGrey,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "It is about 420 kilometres south-west of Manila, and 269 kilometres north-east of Puerto Princesa, capital of Palawan. A managed resource protected area, it is known for its white-sand beaches, coral reefs, and limestone cliffs, as well as for being the gateway to the Bacuit archipelago.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
                color: Colors.blueGrey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
