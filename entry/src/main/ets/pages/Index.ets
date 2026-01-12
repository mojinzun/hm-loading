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

import { CommonConstants } from 'library/src/main/ets/constants/CommonConstants';
import { DurationConstant } from 'library/src/main/ets/constants/DurationConstant';
import { StyleComponent } from '../component/StyleComponent';
import { WidgetComponent } from '../component/WidgetComponent';
import { Constants } from '../constants/CommonConstant';

@Entry
@ComponentV2
struct Index {
  @Local selectedIndex: number = 0;
  @Local currentIndex: number = 0;
  private controller: TabsController = new TabsController();

  @Builder
  tabBuilder(title: string, targetIndex: number) {
    Stack() {
      Button({ buttonStyle: ButtonStyleMode.TEXTUAL }) {
        Text(title)
          .fontColor(this.selectedIndex === targetIndex ? $r("app.color.selected_tab") : $r("app.color.unselected_tab"))
      }
      .width(CommonConstants.FULL_SCREEN_WIDTH)
      .height(CommonConstants.FULL_SCREEN_HEIGHT)
      .type(ButtonType.Normal)
    }
  }

  build() {
    Column() {
      Divider()
        .width(Constants.HALF_SCREEN_WIDTH)
        .color($r("app.color.selected_tab_underline"))
        .strokeWidth(2)
        .position({ x: this.selectedIndex === 0 ? 0 : Constants.HALF_SCREEN_WIDTH, y: 54 })
        .animation({ duration: DurationConstant.DURATION_300 })
      Tabs({
        barPosition: BarPosition.Start,
        index: this.currentIndex,
        controller: this.controller
      }) {
        TabContent() {
          StyleComponent()
        }
        .tabBar(this.tabBuilder('STYLE', 0))

        TabContent() {
          WidgetComponent()
        }
        .tabBar(this.tabBuilder('WIDGET', 1))
      }
      .barMode(BarMode.Fixed)
      .onChange((index: number) => {
        this.currentIndex = index;
      })
      .onAnimationStart((index: number, targetIndex: number, event: TabsAnimationEvent) => {
        if (index === targetIndex) {
          return;
        }
        this.selectedIndex = targetIndex;
      })
    }
    .width(CommonConstants.FULL_SCREEN_WIDTH)
    .height(CommonConstants.FULL_SCREEN_HEIGHT)
    .backgroundColor($r("app.color.start_window_background"))
  }
}