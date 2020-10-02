
class weatherConditions {
  String status(String temp){
    if(temp == 'yağmurlu'|| temp=='sağanak yağış'){return('🌧');}
    if(temp =='şiddetli yağmur'){return('🌧');}
    if(temp == 'orta şiddetli yağmur' || temp == 'hafif yağmur'){return('☔');}
    if(temp == 'kar yağışlı'){return('❄');}
    if(temp=='sis'){return('🌫');}
    if(temp == 'parçalı az bulutlu' ||temp == 'parçalı bulutlu' || temp=='az bulutlu'|| temp=='çoğunlukla bulutlu'|| temp=='kısmen güneşli'){return '🌤';}
    if(temp == 'bulutlu'||temp =='çok bulutlu'){return '☁';}
    if(temp=='parçalı güneşli sağanak yağış'){return('🌦');}
    if (temp == 'gök görültülü sağanak yağmur'){return'⛈';}
    if (temp == 'kar yağışlı'){return'🌧';}
    if (temp == 'hafif yağmur'){return'☔';}
    if (temp == 'açık'){return'☀';}
    if (temp == 'kapalı'){return'☁';}

  }
  String setimage(String str){
    if(str == 'yağmurlu'|| str=='sağanak yağış'||str=='şiddetli yağmur') {return'images/yağmurlu.jpg';}
    if(str == 'açık'){return'images/açık.jpg';}
    if(str == 'parçalı az bulutlu' ||str == 'parçalı bulutlu' || str=='az bulutlu'|| str=='çoğunlukla bulutlu'|| str=='kısmen güneşli'){return'images/parçalıbulutlu.jpg';}
    if(str == 'hafif yağmur'){return'images/hafifyağmurlu.jpg';}
    if(str == 'kar yağışlı'){return'images/karlı.jpg';}
    if(str == 'kapalı'){return'images/kapalı.jpg';}
    if(str=='sis') {return'images/kapalı.jpg';}
    if(str=='sis') {return'images/bulutlu.jpg';}
   if (str == 'orta şiddetli yağmur'){return 'images/showerrain.jpg';}
  }

}

