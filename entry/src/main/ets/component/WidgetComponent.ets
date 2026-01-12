/**
 * MIT License
 *
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

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
