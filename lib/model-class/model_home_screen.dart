import 'package:flutter/material.dart';

import 'model/company_model.dart';
import 'widget/company_widget.dart';

class HomePageModelClass extends StatefulWidget {
  const HomePageModelClass({super.key});

  @override
  State<HomePageModelClass> createState() => _HomePageModelClassState();
}

class _HomePageModelClassState extends State<HomePageModelClass> {
  var compnay = Company.companyList();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Company List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: List.generate(compnay.length, (index) => CompanyWidget(data: compnay[index],)),
            ),
          ],
        ),
      ),
    );
  }
}