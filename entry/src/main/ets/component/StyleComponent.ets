import { SpinKitView, Style } from "spinkit";
import { COLORS, SPIN_KIT_STYLE } from "../constants/CommonConstant";
import { router } from "@kit.ArkUI";

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
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
      .width('100%').height(400)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}