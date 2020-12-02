import 'dart:math' as Math;

import 'package:flutter/material.dart';

class CheckPage {
 static int goodPages({@required int limit,@required int total_rows,@required int current_page}){
    try{
      int pages = (total_rows / limit).ceil();
      int goodPage = Math.max(1, Math.min(current_page, pages));
      int offset = (goodPage - 1)  * limit;
      int goodOffset = Math.min(offset, total_rows);
      //int limit = current_page*rows_per_page; //calculate the limit
      int start = offset+1; //calculate the start point
      int end = Math.min((offset + limit), total_rows);
      print("query pagination  = \n pages =$pages \n offset =$offset \n current_page =$current_page \n start = $start \n end = $end  \n limit = $limit\n total_rows =$total_rows");
      return  offset;

    }catch(e){
      print("exception get pages =${e.toString()}");

      return  0;

    }


  }
 static int  goodOfset({@required int goodPage,@required int limit}){
    return (goodPage - 1)  * limit;
  }
}