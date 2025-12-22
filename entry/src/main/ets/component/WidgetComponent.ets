import { SizeStyle, SpinKitView, Style } from "library"
import { CommonConstants } from "library/src/main/ets/constants/CommonConstants"

@ComponentV2
export struct WidgetComponent {
  build() {
    Column({ space: 24 }) {
      Row({ space: 12 }) {
        Text("ImageView")
          .layoutWeight(1)
        Row() {
          SpinKitView({
            mStyle: Style.DOUBLE_BOUNCE,
            mColor: $r("app.color.double_bounce_color"),
            mSize: SizeStyle.LARGE,
          })
        }
        .width(CommonConstants.FULL_SCREEN_WIDTH)
        .justifyContent(FlexAlign.Center)
        .padding($r("app.float.padding_8"))
        .layoutWeight(2)
      }

      Row({ space: 12 }) {
        Text("Button")
          .layoutWeight(1)
        Button({ buttonStyle: ButtonStyleMode.NORMAL }) {
          Row() {
            SpinKitView({
              mStyle: Style.WAVE,
              mColor: $r("app.color.selected_tab_underline"),
              mSize: SizeStyle.NORMAL,
            })
            Text("BUTTON")
              .fontColor(Color.Black)
              .layoutWeight(1)
              .textAlign(TextAlign.Center)
          }
          .width(CommonConstants.FULL_SCREEN_WIDTH)
          .padding($r("app.float.padding_8"))
        }
        .type(ButtonType.Normal)
        .layoutWeight(2)
      }

      Row({ space: 12 }) {
        Text("TextView")
          .layoutWeight(1)
        Row() {
          Text("TextView")
            .fontColor(Color.Black)
            .layoutWeight(1)
            .textAlign(TextAlign.Center)
          SpinKitView({
            mStyle: Style.CIRCLE,
            mColor: $r("app.color.circle_color"),
            mSize: SizeStyle.NORMAL
          })
        }
        .width(CommonConstants.FULL_SCREEN_WIDTH)
        .backgroundColor($r("app.color.circle_bg_color"))
        .padding($r("app.float.padding_16"))
        .layoutWeight(2)
      }

      Row({ space: 12 }) {
        Text("ImageView")
          .layoutWeight(1)
        Row() {
          SpinKitView({
            mStyle: Style.CHASING_DOTS,
            mColor: $r("app.color.circle_color"),
            mSize: SizeStyle.LARGE,
          })
        }
        .width(CommonConstants.FULL_SCREEN_WIDTH)
        .backgroundColor($r("app.color.chasing_dots_bg_color"))
        .justifyContent(FlexAlign.Center)
        .padding($r("app.float.padding_8"))
        .layoutWeight(2)
      }
    }
    .width(CommonConstants.FULL_SCREEN_WIDTH)
    .height(CommonConstants.FULL_SCREEN_HEIGHT)
    .padding($r("app.float.padding_16"))
    .justifyContent(FlexAlign.Start)
  }
}
