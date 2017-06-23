package com.sist.temp;

import java.util.*;
import java.util.Date;
import java.sql.*;
import java.text.SimpleDateFormat;

public class MainClass {

   public static void main(String[] args) {
      Connection conn = null;
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
         conn = DriverManager.getConnection(url, "scott", "tiger");
         conn.setAutoCommit(false);
         
         //핵심코딩 ==> Around
      /*   for(int i = 1; i <= 31; i++) {
            int count = (int)(Math.random()*7)+5;
            String sql = "INSERT INTO reserve_day VALUES(?, ?)";
            
            PreparedStatement pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, i);
            pstmt.setString(2, getRand(count));
            
            pstmt.executeUpdate();
            pstmt.close();
         }*/
         
       /*  for(int i = 1; i <= 125; i++) {
            int count = (int)(Math.random()*11)+10;
            String sql = "UPDATE food SET res_day = ? WHERE no = ?";
            
            PreparedStatement pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, getRand(count));
            pstmt.setInt(2, i);
            
            pstmt.executeUpdate();
            pstmt.close();
         }*/
         
         
      
         
         conn.commit();
         System.out.println("저장 완료!!");
         
      } catch (Exception e) {
         try {
            conn.rollback();//AFTER-Throwing
         } catch (Exception e2) {
            
         }
         System.out.println(e.getMessage());
      } finally {
         try {
            conn.setAutoCommit(true);//AFTER            
         } catch (Exception e2) {
         }
      }

   }
   
   public static String getRand(int count) {
      String res = "";
      int[] com = new int[count];
      
      int su = 0;
      boolean bDash = false;
      
      for (int i = 0; i < count; i++) {
         bDash = true;
         
         while(bDash) {
            //su = (int)(Math.random() * 15) + 1;
            su = (int)(Math.random() * 31) + 1;
            bDash=false;
            
            for(int j = 0; j < i; j++) {
               if(su == com[j]){
                  bDash = true;
                  break;                  
               }
            }
         }
         com[i] = su;
      }
      
      for(int i = 0; i <com.length-1;i++) {
         for (int j = i+1; j < com.length; j++) {
            if(com[i] > com[j]) {
               int temp = com[i];
               com[i] = com[j];
               com[j] = temp;
            }
         }
      }
      
      for(int i = 0; i < com.length; i++) {
         res += com[i] + ",";
      }
      
      res = res.substring(0, res.lastIndexOf(","));
      
      return res;
   }

}