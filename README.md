# apple_market

스파르타 바로인턴 과제

</br>

## 기술적 의사 결정
### Clean Architecture
- 유지보수가 좋은 코드가 협업의 바탕이 되는 것을 깨달은 후 학습 하기 위해 도입
  
</br>

### Riverpod
- 플러터 공식 인정과 pub.dev의 다운로드 수가 가장 많음
- GetX, BLoC, Provider보다 최신 블로그가 많아 이슈 해결에 적합하다고 판단
- BLoC, Provider에 비해 러닝 커브가 높지 않음
- 상태 관리 자체는 GetX가 쉽게 사용할 수 있으나 GetX는 다른 기능이 많음 => 현재 프로젝트는 상태 관리만 필요
- GetX는 BuildContext를 사용하지 않음 => 인턴/신입 입장에서는 플러터의 원리를 깊게 이해해야 할 기회를 놓칠 수 있다는 인식
