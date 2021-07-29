# Texture를 활용한 당근마켓 홈화면 클론코딩

📱 Target: iOS 13

📒 Frameworks: RxSwift, RxCocoa, Texture ,Then

### With Texture
---
![image](https://user-images.githubusercontent.com/41679458/126729322-4bda4163-82cf-4e81-bdf7-d0293075f9d6.png)

`layoutSpecThatFits` 를 최상위로 두어 하위에서 부터 필요한 `layoutSpec` 들을 생성 및 할당 해줍니다.

layoutSpecThatFits의 자세한 구조는 아래 이미지와 같습니다.

![image](https://user-images.githubusercontent.com/41679458/126730094-c6ef0557-aa14-431f-875a-1669aac197d5.png)

Texture을 사용하면서 storyboard나 xib 를 사용할때 보다 부모 자식 뷰들 간의 관계가 더욱 뚜렷이 보이고 관리하기 편하다는 점,
또한 관계간 존재하는 constraint가 명시적으로 확인이 과능하며 관리와 추적의 용이성을 느꼈습니다.

상황에 맞게 필요한 LayoutSpecs 중에서 골라서 사용하면 복잡한 구조도 처음 설계단계가 탄탄하다면 더욱 빠른 구현이 가능할 것 같습니다.




> Example 
<img src= "https://user-images.githubusercontent.com/41679458/126728638-410ca707-42aa-4d80-93e9-126d54efbd82.gif" width = "40%">

