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

import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";
import { CommonConstants } from "../constants/CommonConstants";

/**
 * 旋转平面
 */
@ComponentV2
export struct RotatingPlane {
  @Param @Require color: ResourceColor;
  @Param mSize: SizeStyle | number = SizeStyle.NORMAL
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.initSpinKit(1, this.mSize)
  }

  build() {
    Canvas()
      .width(this.vm.width)
      .height(this.vm.height)
      .backgroundColor(this.color)
      .renderFit(RenderFit.CENTER)
      .rotate({
        x: this.vm.spinKit[0].rotateX,
        y: this.vm.spinKit[0].rotateY,
        angle: this.vm.spinKit[0].rotate
      })
      .onAppear(() => {
        this.getUIContext()
          .keyframeAnimateTo({ iterations: CommonConstants.ANIMATION_ITERATIONS, delay: DelayConstant.DELAY_0 }, [
            {
              duration: DurationConstant.DURATION_600,
              curve: Curve.EaseInOut,
              event: () => {
                this.vm.spinKit[0].rotate = CommonConstants.NEGATIVE_ROTATE_180
                this.vm.spinKit[0].rotateX = CommonConstants.ROTATE_AXIS_1
                this.vm.spinKit[0].rotateY = CommonConstants.ROTATE_AXIS_0
              }
            },
            {
              duration: DurationConstant.DURATION_0,
              curve: Curve.Linear,
              event: () => {
                this.vm.spinKit[0].rotate = CommonConstants.ROTATE_0
              }
            },
            {
              duration: DurationConstant.DURATION_600,
              curve: Curve.EaseInOut,
              event: () => {
                this.vm.spinKit[0].rotate = CommonConstants.ROTATE_180
                this.vm.spinKit[0].rotateX = CommonConstants.ROTATE_AXIS_0
                this.vm.spinKit[0].rotateY = CommonConstants.ROTATE_AXIS_1
              }
            }
          ])
      })
  }
}