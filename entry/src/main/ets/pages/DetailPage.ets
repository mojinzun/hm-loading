import { SizeStyle, SpinKitView, Style } from 'spinkit';
import { COLORS, SPIN_KIT_NAME, SPIN_KIT_STYLE } from '../constants/CommonConstant';

interface RouterParam {
  selectedIndex: number;
}

@Entry
@Component
struct DetailPage {
  @State currentIndex: number = 0;

  onPageShow() {
    const params = this.getUIContext().getRouter().getParams() as RouterParam;
    this.currentIndex = params.selectedIndex;
  }

  build() {
    Swiper() {
      ForEach(SPIN_KIT_STYLE, (item: Style, index: number) => {
        Column() {
          Blank()
          SpinKitView({ mStyle: item, mColor: Color.White, mSize: SizeStyle.LARGE })
          Blank()
          Text(SPIN_KIT_NAME[index])
            .fontSize(24)
            .fontWeight(600)
            .fontColor(Color.White)
            .margin({ bottom: 20 })
        }
        .width("100%")
        .height("100%")
        .backgroundColor(COLORS[index%COLORS.length])
      })
    }
    .width("100%")
    .height("100%")
    .index(this.currentIndex)
    .autoPlay(false)
    .indicator(false)
    .loop(false)
    .effectMode(EdgeEffect.None)
    .onChange(index => {
      this.currentIndex = index;
    })
  }
}