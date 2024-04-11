
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoginProvider extends ChangeNotifier
{
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value)
  {
    _loading = value;
    notifyListeners();
  }

  void login(String email,String password) async
  {
    setLoading(true);
    try
    {
      Response response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': email,
          'password': password
        }
      );
      if(response.statusCode == 200)
        {
          setLoading(false);
          print('successful');
        }
      else
        {
          setLoading(false);
          print('fail');
        }
    }
    catch(e)
    {
      setLoading(false);
      print(e.toString());
    }
  }
}