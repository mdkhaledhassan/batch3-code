import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/cuustom_text_field_widget.dart';

// ignore: must_be_immutable
class Screen2 extends StatefulWidget {
  Screen2({super.key, this.index});
  String? index;

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {

  final key = GlobalKey<ScaffoldState>();

  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController nummberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: GestureDetector(
          onTap: () {
            key.currentState!.openDrawer();
          },
          child: Icon(Icons.menu)),
      ),
      drawer: Drawer(
        backgroundColor: Colors.teal,
        width: 200,
        child: Column(
          children: [
            Text('influxdev'),
            Text('influxdev'),
            Text('influxdev'),
            Text('influxdev'),
            Text('influxdev'),
            Text('influxdev'),
            Text('influxdev'),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.search)
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: (){
              key.currentState!.closeDrawer();
            }, child: Text('Close'))
          ],
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
              height: 30,
            ),
            Text(widget.index.toString()),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Back')),
            SizedBox(
              height: 30,
            ),
              CustomTextFieldWidget(
                controller: nameController,
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email),
                obscureText: false,
                validator: (p0) {
                  if(p0!.isEmpty)
                  {
                    return 'Please enter your email';
                  }
                  else
                  {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFieldWidget(
                controller: nummberController,
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock),
                obscureText: true,
                validator: (p0) {
                  if(p0!.isEmpty)
                  {
                    return 'Please enter your password';
                  }
                  else
                  {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (){
                if(formKey.currentState!.validate())
                {
                  print('Hello');
                }
              }, child: Text('Submit')),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/test.jpeg',fit: BoxFit.fitHeight,)),
                SizedBox(
                height: 50,
              ),
              Container(
                height: 100,
                width: 100,
                child: Image.network('https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png',)),
                SizedBox(
                height: 50,
              ),
              Container(
                height: 100,
                width: 100,
                child: SvgPicture.asset('assets/images/calling.svg',fit: BoxFit.contain,height: 100,width: 100,)),
                SizedBox(
                  height: 50,
                ),

                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.teal,
                  // backgroundImage: AssetImage('assets/images/test.jpeg')
                  // backgroundImage: NetworkImage('https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png'),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset('assets/images/test.jpeg')),
                ),

                SizedBox(
                  height: 50,
                ),

                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset('assets/images/test.jpeg',fit: BoxFit.cover,)),
                ),
                SizedBox(
                  height: 50,
                ),

                CircularProgressIndicator(
                  color: Colors.red,
                )
            ],
          ),
        ),
      )
      
      
      //row widget

      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     Icon(Icons.home),
      //     Icon(Icons.menu),
      //     Icon(Icons.search),
      //     Icon(Icons.book),
      //     Icon(Icons.people),
      //   ],
      // )

      //column widget
      
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text('influxdev'),
      //     Text('influxdevinfluxdev'),
      //     Text('influxdevinfluxdevinfluxdev'),
      //     Text('influxdevinfluxdevinfluxdevinfluxdev'),
      //     Text('influxdevinfluxdevinfluxdevinfluxdevinfluxdev'),
      //   ],
      // ),
    );
  }
}