import 'package:flutter/material.dart';
import 'package:pdpui3/utils/Strings.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);
  static final String id = 'intro_page';
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  late PageController _pageController;
  int currentIndex = 0;
  @override
  void initState(){
    _pageController = PageController(
      initialPage: 0
    );
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                onPageChanged: (int page){
                  setState(() {
                    currentIndex = page;
                  });
                },
                controller: _pageController,
                children: [
                  makePage(
                    title: Strings.stepOneTitle,
                    content: Strings.stepOneTitle,
                    image: 'assets/image/image_1.png'
                  ),
                  makePage(
                    title: Strings.stepTreeTitle,
                    content: Strings.stepTreeTitle,
                    image: 'assets/image/image_3.png'
                  ),
                ],
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicator(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget makePage({title,content,image}){
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(title,style: TextStyle(
                color: Colors.red,fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 30,),
              Text(content,style: TextStyle(
                color: Colors.grey,fontSize: 18,
              ),textAlign: TextAlign.center,),
            ],
          ),
        ],
      ),
    );
  }
  Widget _indicator(bool isActive){
    return AnimatedContainer(duration: Duration(
      milliseconds: 300
    ),height: 6,width: isActive ? 36:6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }
  List<Widget> _buildIndicator(){
    List<Widget> indicators = [];
    for(int i=0; i<2; i++){
      if(currentIndex == i){
        indicators.add(_indicator(true));
      }else{indicators.add(_indicator(false));}
    }
    return indicators;
  }
}
