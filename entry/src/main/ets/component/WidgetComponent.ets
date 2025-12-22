import { SizeStyle, SpinKitView, Style } from "spinkit"

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
            mColor: "#3eba76",
            mSize: SizeStyle.LARGE,
          })
        }
        .width("100%")
        .justifyContent(FlexAlign.Center)
        .padding(8)
        .layoutWeight(2)
      }

      Row({ space: 12 }) {
        Text("Button")
          .layoutWeight(1)
        Button({ buttonStyle: ButtonStyleMode.NORMAL }) {
          Row() {
            SpinKitView({
              mStyle: Style.WAVE,
              mColor: "#ff4081",
              mSize: SizeStyle.NORMAL,
            })
            Text("BUTTON")
              .fontColor(Color.Black)
              .layoutWeight(1)
              .textAlign(TextAlign.Center)
          }
          .width("100%")
          .padding(8)
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
            mColor: "#ffffff",
            mSize: SizeStyle.NORMAL,
          })
        }
        .width("100%")
        .backgroundColor("#00bd9c")
        .padding(8)
        .layoutWeight(2)
      }

      Row({ space: 12 }) {
        Text("ImageView")
          .layoutWeight(1)
        Row() {
          SpinKitView({
            mStyle: Style.CHASING_DOTS,
            mColor: "#ffffff",
            mSize: SizeStyle.LARGE,
          })
        }
        .width("100%")
        .backgroundColor("#d55400")
        .justifyContent(FlexAlign.Center)
        .padding(8)
        .layoutWeight(2)
      }
    }
    .width("100%")
    .height("100%")
    .padding($r("app.float.padding_16"))
    .justifyContent(FlexAlign.Start)
  }
}
