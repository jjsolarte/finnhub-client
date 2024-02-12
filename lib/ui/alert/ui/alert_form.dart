import 'package:finnhub_client/core/constants/stock_list.dart';
import 'package:finnhub_client/core/validators/text_validators.dart';
import 'package:finnhub_client/features/alert/bloc/alert_bloc.dart';
import 'package:finnhub_client/features/alert/model/alert_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertForm extends StatefulWidget {
  const AlertForm({Key? key}) : super(key: key);

  @override
  State<AlertForm> createState() => _AlertFormState();
}

class _AlertFormState extends State<AlertForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _valueController = TextEditingController();
  String? _selectedShare;
  bool _optionsAlert = false;

  void addAlert() {
    if (!_formKey.currentState!.validate() || _selectedShare == null) {
      setState(() {
        _optionsAlert = true;
      });
      return;
    }

    FocusManager.instance.primaryFocus?.unfocus();
    _optionsAlert = false;
    setState(() {});
    context.read<AlertBloc>().add(AlertAddAlertEvent(
        alertModel: AlertModel(
            share: _selectedShare!, value: int.parse(_valueController.text))));
    _valueController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              width: 300,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(30),
              ),
              child: DropdownButton<String>(
                value: _selectedShare,
                onChanged: (value) {
                  setState(() {
                    _selectedShare = value;
                  });
                },
                hint: const Center(
                  child: Text(
                    'Shares',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                underline: Container(),
                dropdownColor: Colors.deepPurple,
                icon: const Icon(
                  Icons.expand_circle_down_outlined,
                  color: Colors.deepPurple,
                ),
                isExpanded: true,
                items: StocksList.stocksList
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            e,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                selectedItemBuilder: (BuildContext context) =>
                    StocksList.stocksList
                        .map(
                          (e) => Center(
                            child: Text(
                              e,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.amber,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (_optionsAlert)
            const Text(
              'Select an option',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _valueController,
            keyboardType: TextInputType.number,
            validator: (_) =>
                TextValidators.textFieldValidator(_valueController.text),
            decoration: InputDecoration(
                hintText: 'Value (USD)',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: addAlert,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add Alert',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
