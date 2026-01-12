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

import { CommonConstants } from "../constants/CommonConstants";
import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SpinKit } from "../model/SpinKit";
import { ScaleStyle, SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

// 乘法因子0.25
const SCALE_FACTOR_0_25 = 0.25
// 乘法因子0.75
const SCALE_FACTOR_0_75 = 0.75

/**
 * 流浪立方体
 */
@ComponentV2
export struct WanderingCubes {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL;
  @Require @Param color: ResourceColor;
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.initSpinKit(2, this.mSize)
    this.vm.spinKit[1].translateX = this.vm.width * SCALE_FACTOR_0_75;
    this.vm.spinKit[1].translateY = this.vm.width * SCALE_FACTOR_0_75;
  }

  build() {
    Stack() {
      ForEach(this.vm.spinKit, (item: SpinKit) => {
        Canvas()
          .width(this.vm.width * SCALE_FACTOR_0_25)
          .height(this.vm.width * SCALE_FACTOR_0_25)
          .backgroundColor(this.color)
          .position({ x: 0, y: 0 })
          .translate({ x: item.translateX, y: item.translateY })
          .scale({ x: item.scale, y: item.scale })
          .rotate({ angle: item.rotate })
      }, (item: SpinKit, index) => `${index}__${item}`)
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .onAppear(() => {
      this.vm.spinKit.forEach((_, index) => {
        this.getUIContext()
          .keyframeAnimateTo({ iterations: CommonConstants.ANIMATION_ITERATIONS, delay: DelayConstant.DELAY_0 },
            this.generateKeyframeState(index));
      })
    })
  }

  /**
   * 封装KeyframeState
   */
  private generateKeyframeState(i: number): Array<KeyframeState> {
    const arr: number[] = [1, 2, 3, 4]
    const isEven = i % 2 === 0;
    let keyframeStateArr: Array<KeyframeState> = []

    arr.forEach((item, index) => {
      keyframeStateArr[index] = {
        duration: DurationConstant.DURATION_450,
        curve: Curve.EaseInOut,
        event: () => {
          this.vm.spinKit[i].scale = index % 2 == 0 ? CommonConstants.SCALE_0_5 : ScaleStyle.NORMAL;
          this.vm.spinKit[i].rotate = item * CommonConstants.NEGATIVE_ROTATE_90;
          this.vm.spinKit[i].translateX = isEven ? (index % arr.length < 2 ? this.vm.width * SCALE_FACTOR_0_75 : 0) :
            (index % arr.length < 2 ? 0 : this.vm.width * SCALE_FACTOR_0_75);
          this.vm.spinKit[i].translateY =
            isEven ? (index % arr.length == 1 || index % arr.length == 2 ? this.vm.width * SCALE_FACTOR_0_75 : 0) :
              (index % arr.length == 1 || index % arr.length == 2 ? 0 : this.vm.width * SCALE_FACTOR_0_75);
        }
      }
    })
    return keyframeStateArr
  }
}