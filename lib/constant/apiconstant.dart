import 'package:flutter/material.dart';

class Apiconst{
  static const String baseurl="https://sigmaone.lat/Api/";
  static const String loginurl= baseurl+"password_login";
  static const String Registerurl= baseurl+"register";
  static const String profileview= baseurl+"user_profile?id=";
  static const String Sliderurl= baseurl+"get_slider";
  static const String ProductAdaniurl= baseurl+"get_product?user_id=";
  static const String ProductAdaniurl2= baseurl+"ambaniproduct2?user_id=";
  static const String Productpurches= baseurl+"purchase_product";
  static const String addmoney= baseurl+"add_wallet";
  static const String ADDACCOUNT= baseurl+"addaccount";
  static const String ACCOUNTVIEW= baseurl+"view_account";
  static const String MYPROJECT= baseurl+"myproduct?userid=";
  static const String REFEREARN= baseurl+"refer_and_earn";
  static const String teamcomission= baseurl+"level_commission?userid=";
  static const String withdralrequest= baseurl+"withdraw_pay";
  static const String withdraw_history= baseurl+"withdraw_history";
  static const String news= baseurl+"get_news";
  static const String newsvideo= baseurl+"video_news";
  static const String weekly_salary= baseurl+"weekly_salary";
  static const String monthly_salary= baseurl+"monthly_salary";
  static const String Change_Password= baseurl+"change_password";
  static const String Reedembonus= baseurl+"reedembonus";
  static const String Get_reedemedbonus= baseurl+"get_reedemedbonus";
  static const String Reedemproduct= baseurl+"reedemproduct";
  static const String Getcomm_records= baseurl+"getcomm_records?userid=";
  static const String Myteamactive= baseurl+"myteamactive?userid=";
  static const String Myteaminactive= baseurl+"myteam_inactive?userid=";
  static const String Wallet_history= baseurl+"wallet_history";
  static const String Fund_details= baseurl+"fund_details?userid=";
  static const String Earnings= baseurl+"earnings?userid=";
  static const String forgetnumber= baseurl+"forget_password";
  static const String registerotp= baseurl+"sendotp";
  static const String forgetpassword= baseurl+"forget_passwords";
}