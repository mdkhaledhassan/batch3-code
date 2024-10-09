import 'package:flutter/material.dart';

import 'model/company_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.data});
  final Company data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 2),
                blurRadius: 10
              )
            ],
            image: DecorationImage(image: AssetImage(data.logo.toString()),fit: BoxFit.fill)
              ),),
              SizedBox(
                height: 30,
              ),
                  Text(data.title.toString()),
                  SizedBox(
                height: 16,
              ),
              Text(data.description.toString()),
              SizedBox(
                height: 16,
              ),
              Text('Market Value'),
              SizedBox(
                height: 16,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: data.marketValue.length,
                itemBuilder: (context, index) {
                  return Text('${index + 1}. ${data.marketValue[index]}');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}