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
import { OpacityConstants } from "../constants/OpacityConstant";
import { SpinKit } from "../model/SpinKit";
import { ScaleStyle, SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * 脉冲环动画
 */
@ComponentV2
export struct PulseRing {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL
  @Require @Param color: ResourceColor;
  @Local mSpinKit: SpinKit = new SpinKit()
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.getSpinKitSize(this.mSize)
    this.mSpinKit.scale = ScaleStyle.SMALL
  }

  build() {
    Stack() {
      Canvas()
        .width(CommonConstants.FULL_SCREEN_WIDTH)
        .height(CommonConstants.FULL_SCREEN_HEIGHT)
        .opacity(this.mSpinKit.opacity)
        .borderRadius(this.vm.width)
        .border({ width: 2, color: this.color })
        .scale({ x: this.mSpinKit.scale, y: this.mSpinKit.scale })
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .renderFit(RenderFit.CENTER)
    .onAppear(() => {
      this.getUIContext()
        .keyframeAnimateTo({ iterations: CommonConstants.ANIMATION_ITERATIONS, delay: DelayConstant.DELAY_0 }, [
          {
            duration: DurationConstant.DURATION_700,
            curve: Curve.LinearOutSlowIn,
            event: () => {
              this.mSpinKit.scale = ScaleStyle.NORMAL;
              this.mSpinKit.opacity = OpacityConstants.SEVEN_FIFTHS_OPAQUE
            }
          },
          {
            duration: DurationConstant.DURATION_300,
            curve: Curve.LinearOutSlowIn,
            event: () => {
              this.mSpinKit.opacity = OpacityConstants.HIDDEN
            }
          }
        ]);
    })
  }
}