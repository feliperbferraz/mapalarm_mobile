import 'dart:html';
import 'dart:convert' show UTF8, JSON;
import 'packages/json_object/json_object.dart';
import 'packages/dbcrypt/dbcrypt.dart';

main(){
//  final mapOptions = new MapOptions()
//    ..zoom = 11
//    ..center = new LatLng(-22.908, -43.197)
//    ..mapTypeId = MapTypeId.ROADMAP
//  ;
//  final map = new GMap(querySelector("#map-canvas"), mapOptions);



//   FormElement form = querySelector('#signupForm');
//    form.onSubmit.listen((e)
//
    print("OK0!");

   handle(Event e) async {
     e.preventDefault();
     FormElement form = e.target as FormElement;
     print("FORM");
     var jsonData = new JsonObject();

     InputElement aux1 = querySelector('#username');
     InputElement aux2 = querySelector('#email');
     InputElement aux3 = querySelector('#password');
     jsonData['name'] = aux1.value;
     jsonData['email'] = aux2.value;


//      var request =  new HttpRequest();
//          print("DEPOIS DO POST");
//          request.post('52.67.76.53', 80, '/signin');
     var url = "http://52.67.76.53:80";

     HttpRequest request = new HttpRequest(); // create a new XHR

     // add an event handler that is called when the request finishes
     request.onReadyStateChange.listen((_) {
       if (request.readyState == HttpRequest.DONE &&
           (request.status == 200 || request.status == 0)) {
         // data saved OK.
         print(request.responseText); // output the response from the server
       }
     });
      print("UHULL");
     // POST the data to the server
     // ignore: async_keyword_used_as_identifier

     request.open("POST", url, async : false);


     var plainPassword = aux3.value;
     var hashedPassword = new DBCrypt().hashpw(plainPassword, new DBCrypt().gensalt());
     print(hashedPassword);
     jsonData['password'] = hashedPassword;
     request.send(jsonData); // perform the async POST
     window.location.href = "dartlearning1.html" ;
   }


    handleLogin(Event e) async {
      e.preventDefault();
      FormElement form = e.target as FormElement;
      print("FORM");
      var jsonData = new JsonObject();

      InputElement aux1 = querySelector('#username');
      InputElement aux2 = querySelector('#password');
      var plainPassword = aux2.value;
      var hashedPassword = new DBCrypt().hashpw(plainPassword, new DBCrypt().gensalt());
      jsonData['username'] = aux1.value;
      jsonData['password'] = hashedPassword;


//      var request =  new HttpRequest();
//          print("DEPOIS DO POST");
//          request.post('52.67.76.53', 80, '/signin');
      var url = "http://52.67.76.53:80/login";

      HttpRequest request = new HttpRequest(); // create a new XHR

      // add an event handler that is called when the request finishes
      request.onReadyStateChange.listen((_) {
        if (request.readyState == HttpRequest.DONE &&
            (request.status == 200 || request.status == 0)) {
          // data saved OK.
          print(request.responseText); // output the response from the server
        }
      });
      print("UHULL");
      // POST the data to the server
      // ignore: async_keyword_used_as_identifier

      request.open("POST", url, async : false);
      request.send(jsonData); // perform the async POST
      print(request.response.toString());
      if(request.response.toString() == ""){
        print("VAZIO");
        window.alert("Usuario nao encontrado.");
      }else {
        var isCorrect = new DBCrypt().checkpw(
            aux2.value, request.response.toString());
        if (!isCorrect) {
          window.alert("Usuario nao encontrado.");
        }
        else if (isCorrect) {
          print("isCorrect");
          window.location.href = "dartlearning1.html";
        }
      }
    }


  var send = querySelector('form')
              .onSubmit.listen(handleLogin);


//  var sendSignin = querySelector('#siginForm')
//      .onSubmit.listen(handleLogin);
//     submitForm(Event e) async{
//    print("OK1!");
//    e.preventDefault();
//    jsonData["name"] = 'JSJSJS';
//      jsonData['email'] = ',cjndscjsmscdnc,s';
//
//      var request = await new HttpClient().post(
//          '52.67.76.53', 80, '/signin');
////      '54.233.131.184', 80, '/users');
//    request.headers.contentType = ContentType.JSON;
//    request.write(JSON.encode(jsonData));
//    HttpClientResponse response = await request.close();
//    await for (var contents in response.transform(UTF8.decoder)) {
//      print(contents);
//    }
//
//    e.stopPropagation();
//    print("OK2!");
//  };

}

