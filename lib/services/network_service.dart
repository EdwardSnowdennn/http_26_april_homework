import 'dart:convert';
import 'dart:html';
import 'package:http_26_april_homework/models/comments_model.dart';
import 'package:http/http.dart';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http_26_april_homework/models/comments_model.dart';

class NetworkService{
  // URL
  static const String baseUrl='https://jsonplaceholder.typicode.com';

  // HEADERS
static Map<String,String>headers={
  'Content-type':'application/json; charset=UTF-8'
};

// APIS
static const String apiPosts='/comments';
static const String apiPost='/comments/';

// METHODS
static Future<String>GET(String api,Map<String,String>headers)async{
  Uri uri=Uri.https(baseUrl, api);
  Response response=await get (uri,headers: headers);
  if(response.statusCode==200 || response.statusCode==201){
    return response.body;
  }
  else{
    throw Exception("Network error");
  }

}

static Future<String>POST(String api,Map<String,String>headers,Map<String,dynamic>body)async{
  Uri uri = Uri.https(baseUrl, api);
  Response response=await post(uri,headers: headers,body: body);
if(response.statusCode==200 || response.statusCode==201){
  return response.body;
}
else{
  throw Exception("Network error");
}
}

static Future<String>PUT(String api,Map<String,String>headers,Map<String,dynamic>body)async{
  Uri uri=Uri.https(baseUrl, api);
  Response response=await put(uri,headers: headers,body: body);
  if(response.statusCode==200 || response.statusCode==201){
    return response.body;
  }
  else{
    throw Exception("Network error");
  }
}

static Future<String>PATCH(String api,Map<String,String>headers,Map<String,dynamic>body)async{
  Uri uri=Uri.https(baseUrl, api);
  Response response=await patch(uri,headers: headers,body: body);
  if(response.statusCode==200 || response.statusCode==201){
    return response.body;
  }
  else{
    throw Exception("Network error");
  }
}

static Future<String> DELETE(String api,Map<String,String>headers,Map<String,dynamic>body)async{
  Uri uri=Uri.https(baseUrl, api);
  Response response=await delete(uri,headers: headers,body: body);
  if(response.statusCode==200 || response.statusCode==201){
    return response.body;
  }
  else{
    throw Exception("Network error");
  }
}

// PARSING
static List<Comments>parseCommentList(String body){
  List json=jsonDecode(body);
  List<Comments>comments=json.map((map) => Comments.fromJson(map)).toList();
  return comments;
}
static Comments parseComments(String body){
Map<String,dynamic>json=jsonDecode(body);
Comments comments=Comments.fromJson(json);
return comments;
}



}