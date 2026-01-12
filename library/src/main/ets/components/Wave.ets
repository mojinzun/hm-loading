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
 * 波浪效果
 */
@ComponentV2
export struct Wave {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL
  @Require @Param color: ResourceColor;
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.initSpinKit(5, this.mSize)
    this.setSpinKitScale()
  }

  build() {
    Row() {
      ForEach(this.vm.spinKit, (item: SpinKit) => {
        Canvas()
          .width(this.vm.width / (this.vm.spinKit.length + 1))
          .height(CommonConstants.FULL_SCREEN_HEIGHT)
          .backgroundColor(this.color)
          .scale({ y: item.scale })
      }, (item: SpinKit, index) => `${index}__${item}`)
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .justifyContent(FlexAlign.SpaceBetween)
    .onAppear(() => {
      this.vm.spinKit.forEach((_, index) => {
        this.getUIContext().keyframeAnimateTo(
          {
            iterations: CommonConstants.ANIMATION_ITERATIONS,
            delay: DelayConstant.DELAY_600 + index * DelayConstant.DELAY_100
          },
          this.generateKeyframeState(index)
        );
      });
    })
  }

  /**
   * 初始化长条的缩放值
   */
  private setSpinKitScale() {
    for (let i = 0; i < this.vm.spinKit.length; i++) {
      this.vm.spinKit[i].scale = CommonConstants.SCALE_0_4;
    }
  }

  /**
   * 封装KeyframeState
   */
  private generateKeyframeState(index: number): Array<KeyframeState> {
    return [
      {
        duration: DurationConstant.DURATION_200,
        curve: Curve.EaseInOut,
        event: () => {
          this.vm.spinKit[index].scale = ScaleStyle.NORMAL;
        }
      },
      {
        duration: DurationConstant.DURATION_200,
        curve: Curve.EaseInOut,
        event: () => {
          this.vm.spinKit[index].scale = CommonConstants.SCALE_0_4;
        }
      },
      {
        duration: DurationConstant.DURATION_800,
        event: () => {
        }
      }
    ];
  }
}