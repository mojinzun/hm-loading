import { SpinKitView, Style } from "library";
import { COLORS, SPIN_KIT_STYLE } from "../constants/CommonConstant";
import { router } from "@kit.ArkUI";
import { CommonConstants } from "library/src/main/ets/constants/CommonConstants";

@ComponentV2
export struct StyleComponent {
  build() {
    Column() {
      Grid() {
        ForEach(SPIN_KIT_STYLE, (item: Style, index: number) => {
          GridItem() {
            SpinKitView({ mStyle: item, mColor: Color.White })
          }
          .backgroundColor(COLORS[index%COLORS.length])
          .onClick(()=>{
            router.push({
              url: 'pages/DetailPage',
              params: { selectedIndex: index }
            })
          })
        }, (item: Style, index) => `${index}__${item}`)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
      .width(CommonConstants.FULL_SCREEN_WIDTH).height(400)
    }
    .width(CommonConstants.FULL_SCREEN_WIDTH)
    .height(CommonConstants.FULL_SCREEN_HEIGHT)
    .justifyContent(FlexAlign.Start)
  }
}