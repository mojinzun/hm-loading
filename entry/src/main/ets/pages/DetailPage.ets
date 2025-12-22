import { SizeStyle, SpinKitView, Style } from 'library';
import { CommonConstants } from 'library/src/main/ets/constants/CommonConstants';
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
            .fontSize($r("app.float.detail_font_size_24"))
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
            .margin({ bottom: $r("app.float.margin_bottom_20") })
        }
        .width(CommonConstants.FULL_SCREEN_WIDTH)
        .height(CommonConstants.FULL_SCREEN_HEIGHT)
        .backgroundColor(COLORS[index%COLORS.length])
      })
    }
    .width(CommonConstants.FULL_SCREEN_WIDTH)
    .height(CommonConstants.FULL_SCREEN_HEIGHT)
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