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

import { SizeStyle, SpinKitView, Style } from 'library';
import { CommonConstants } from 'library/src/main/ets/constants/CommonConstants';
import { COLORS, SPIN_KIT_NAME, SPIN_KIT_STYLE } from '../constants/CommonConstant';

interface RouterParam {
  selectedIndex: number;
}

@Entry
@ComponentV2
struct DetailPage {
  @Local currentIndex: number = 0;

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
      }, (item: Style, index) => `${index}__${item}`)
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