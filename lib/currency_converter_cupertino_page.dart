import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    setState(() {
      result = double.tryParse(textEditingController.text) != null
          ? double.parse(textEditingController.text) * 270
          : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Currency Converter'),
        backgroundColor: CupertinoColors.systemGrey,
      ),
      backgroundColor: CupertinoColors.systemGrey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result != 0 ? result.toStringAsFixed(2) : '0',
              style: const TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.black,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoTextField(
                controller: textEditingController,
                placeholder: 'Enter amount',
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    CupertinoIcons.money_dollar,
                    color: CupertinoColors.black,
                  ),
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: CupertinoColors.systemGrey2,
                    width: 1.0,
                  ),
                ),
                style: const TextStyle(color: CupertinoColors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: CupertinoButton.filled(
                  onPressed: convert,
                  borderRadius: BorderRadius.circular(10),
                  child: const Text('Convert', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
