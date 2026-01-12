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