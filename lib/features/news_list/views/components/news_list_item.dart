import 'package:flutter/material.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "Conflict",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          size: 15,
                        ),
                        Text(
                          "Gaza",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.bookmark_add_outlined),
              ),
            ],
          ),
          Text(
            "Gaza hospital evacuated after Israeli strike",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              "https://kagiproxy.com/img/kmOZQvRUo1GytiNPBeST5xou-0WBYn30Wf5C_ffsBeT-rBMDuYnzN1GtjLn5Jl333w3uyC95lfO87loCe08Vh9KhTRK1w_z8kYp-7NUEgXCanvszJvndqR0",
              // height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "28 reports",
            style: TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
