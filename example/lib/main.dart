import 'package:ind_utils/ind_utils.dart';

void main() {
  PrintLogger.success('Operation successful');
  PrintLogger.error({'error': 'Details'});
  PrintLogger.warning(['Warning 1', 'Warning 2']);
  PrintLogger.denied({'permission': 'camera'});
  //
  printLog("Success", {'permission': 'camera'}).success;
  printLog("Error ", ['Warning 1', 'Warning 2']).error;
  //
}