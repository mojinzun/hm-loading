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

/**
 * 追逐点
 */
@ComponentV2
export struct ChasingDots {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL;
  @Require @Param color: ResourceColor;
  @Local vm: SpinKitVM = new SpinKitVM()
  @Local dotSize: number = 0

  aboutToAppear(): void {
    this.vm.initSpinKit(2, this.mSize)
    this.vm.spinKit[0].scale = ScaleStyle.SMALL
    this.dotSize = this.vm.width * 0.6
  }

  build() {
    Stack() {
      ForEach(this.vm.spinKit, (item: SpinKit, index: number) => {
        Circle()
          .width(this.dotSize)
          .height(this.dotSize)
          .fill(this.color)
          .position({
            x: (this.vm.width - this.dotSize) / 2,
            y: index == 0 ? 0 : (this.vm.width - this.dotSize)
          })
          .scale({ x: item.scale, y: item.scale })
      }, (item: SpinKit, index) => `${index}__${item}`)
    }
    .width(this.vm.width)
    .height(this.vm.width)
    .rotate({ angle: this.vm.spinKit[0].rotate })
    .onAppear(() => {
      this.getUIContext()
        .keyframeAnimateTo({ iterations: CommonConstants.ANIMATION_ITERATIONS, delay: DelayConstant.DELAY_0 },
          this.generateKeyframeState());
      this.getUIContext()
        .keyframeAnimateTo({ iterations: CommonConstants.ANIMATION_ITERATIONS, delay: DelayConstant.DELAY_500 },
          this.generateKeyframeAngle());
    })
  }

  /**
   * 封装KeyframeState
   */
  private generateKeyframeState(): Array<KeyframeState> {
    return [
      {
        duration: DurationConstant.DURATION_1000,
        curve: Curve.EaseInOut,
        event: () => {
          this.vm.spinKit[0].scale = ScaleStyle.NORMAL;
          this.vm.spinKit[1].scale = ScaleStyle.SMALL;
        }
      },
      {
        duration: DurationConstant.DURATION_1000,
        curve: Curve.EaseInOut,
        event: () => {
          this.vm.spinKit[0].scale = ScaleStyle.SMALL;
          this.vm.spinKit[1].scale = ScaleStyle.NORMAL;
        }
      }
    ];
  }

  /**
   * 封装KeyframeState
   */
  private generateKeyframeAngle(): Array<KeyframeState> {
    return [
      {
        duration: DurationConstant.DURATION_2000,
        curve: Curve.Linear,
        event: () => {
          this.vm.spinKit[0].rotate = CommonConstants.ROTATE_360;
        }
      }
    ];
  }
}