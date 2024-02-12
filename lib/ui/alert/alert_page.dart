import 'package:finnhub_client/ui/alert/ui/alert_form.dart';
import 'package:finnhub_client/ui/alert/ui/alert_manager.dart';
import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Add Price Alert',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const AlertForm(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.5,
                  child: const AlertManagerWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
