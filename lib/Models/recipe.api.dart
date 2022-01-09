import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipes/Models/recipe.dart';

class RecipeApi {
  
//   var unirest = require("unirest");

// var req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

// req.query({
// 	"start": "0",
// 	"limit": "18",
// 	"tag": "list.recipe.popular"
// });

// req.headers({
	// "x-rapidapi-host": "yummly2.p.rapidapi.com",
	// "x-rapidapi-key": "934652f5f0msh0152c65b1de2463p14c0eejsnc0ffd8b30294",
	// "useQueryString": true
// });


  static Future<List<Recipe>> getRecipe() async{
   
    var uri = Uri.https('yummly2.p.rapidapi.com','/feeds/list',
    {"limit":"18","start":"0","tag":"list.recipe.popular"});
    final response= await http.get(uri,headers: {
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
	    "x-rapidapi-key": "934652f5f0msh0152c65b1de2463p14c0eejsnc0ffd8b30294",
	    "useQueryString": "true"
      });
      Map data = jsonDecode(response.body);
      List _temp=[];
      for(var i in data['feed']){
        _temp.add(i['content']['details']);
      }

      return Recipe.recipeFromSnapshot(_temp);
  }
}