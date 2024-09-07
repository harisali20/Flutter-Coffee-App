import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:final_project/model.dart';
import 'package:http/http.dart' as http;

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  Future<List<Coffee>> fetchCoffee() async {
    List<Coffee> coffee = [];
    try {
      final response =
          await http.get(Uri.parse('https://fake-coffee-api.vercel.app/api'));
      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body);
        for (var item in body) {
          coffee.add(Coffee.fromJson(item));
        }
        return coffee;
      } else {
        throw 'Failed to load coffee';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              )),
          title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4,
                ),
                Text('Order',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins-SemiBold",
                        fontSize: 19.16,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 2,
                ),
                Text('You can get your desired size of coffee',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins-Regular",
                      fontSize: 10,
                    )),
              ]),
          backgroundColor: const Color(0xff1ABB9C),
        ),
        body: Container(
            color: const Color(0xffF1F2E9),
            child: SingleChildScrollView(
                child: FutureBuilder<List<Coffee>>(
              future: fetchCoffee(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 550,
                    child: Center(
                      child: SizedBox(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator(
                            strokeWidth: 5,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xff1ABB9C)),
                          )),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data != null) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final coffee = snapshot.data![index];
                      return Card(
                        child: ListTile(
                          leading: coffee.image.isNotEmpty
                              ? Image.network(coffee.image,
                                  width: 70, height: 50, fit: BoxFit.cover)
                              : null,
                          title: Text(coffee.name),
                          subtitle: Text(coffee.description),
                          trailing:
                              Text('\$${coffee.price.toStringAsFixed(2)}'),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No data available'));
                }
              },
            ))),
      ),
    );
  }
}
