import 'package:flutter/material.dart';
import 'package:flutter_mvp/base/base_config.dart';
import 'package:flutter_mvp/base/base_stateful_widget.dart';
import 'package:flutter_mvp/base/base_type.dart';
import 'package:flutter_mvp/page/sample/sample_presenter.dart';

class SampleView extends BaseStatefulWidget {
  const SampleView({Key? key}) : super(key: key);

  @override
  _SampleViewState createState() => _SampleViewState();
}

class _SampleViewState extends BaseState<SampleView, SamplePresenter> implements SampleContract {
  final BaseType _baseType = BaseConfig.APP_BASE_TYPE;
  TextEditingController _outputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    onInitState(context: context, presenter: SamplePresenter(), view: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          ),
          title: Text(BaseConfig.APP_NAME)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
            child: Text(
              "Version : ${_baseType.name}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 0),
            child: TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.indigo)),
              onPressed: () => _outputController.text = '',
              child: Text(
                'Reset',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 0),
            child: TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.indigo)),
              onPressed: () => presenter.sampleBasePresenterMethod(),
              child: Text(
                'Call Method From Base Presenter',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 0),
            child: TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.indigo)),
              onPressed: () => presenter.sampleSamplePresenterMethod(),
              child: Text(
                'Call Method From Sample Presenter',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
            child: TextFormField(
              readOnly: true,
              textAlign: TextAlign.center,
              controller: _outputController,
              minLines: 3,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onViewCreated() {}

  /// TODO * This is Just Example, Feel Free To Remove
  @override
  void sampleBaseContractMethod(String message) => _outputController.text = message;

  /// TODO * This is Just Example, Feel Free To Remove
  @override
  void sampleSampleContractMethod(String message) {
    _outputController.text = message;
  }
}
