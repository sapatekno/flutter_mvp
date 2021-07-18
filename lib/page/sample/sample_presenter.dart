import 'package:flutter_mvp/base/base_presenter.dart';

abstract class SampleContract extends BaseContract {
  /// TODO * This is Just Example, Feel Free To Remove
  void sampleSampleContractMethod(String message);
}

class SamplePresenter extends BasePresenter<SampleContract> {
  /// TODO * This is Just Example, Feel Free To Remove
  sampleSamplePresenterMethod() {
    view.sampleSampleContractMethod('This Message From Sample Presenter Then Sent To View Via Sample Contract.');
  }
}
