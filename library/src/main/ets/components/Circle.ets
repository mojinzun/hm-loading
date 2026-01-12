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
import { SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * 渐隐+缩放环形加载动画
 */
@ComponentV2
export struct CircleLoading {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL;
  @Require @Param color: ResourceColor;
  @Local vm: SpinKitVM = new SpinKitVM()
  private centerX: number = 0; // 环形中心X坐标
  private centerY: number = 0; // 环形中心Y坐标
  private radius: number = 0; // 环形半径
  private ballCount: number = 0; // 小球数量
  private ballSize: number = 0; // 小球直径

  aboutToAppear(): void {
    this.vm.initSpinKit(12, this.mSize)
    this.initDraw()
  }

  build() {
    Stack() {
      // 动态生成环形小球
      ForEach(this.vm.spinKit, (item: SpinKit, index) => {
        // 绘制小球
        Circle({ width: this.ballSize, height: this.ballSize })
          .fill(this.color)
          .position({ x: this.getXPosition(index), y: this.getYPosition(index) })
          .opacity(item.opacity)
          .scale({ x: item.scale, y: item.scale })
      }, (item: SpinKit, index) => `${index}__${item}`)
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .onAppear(() => {
      this.vm.spinKit.forEach((item: SpinKit, index: number) => {
        this.getUIContext()
          .keyframeAnimateTo({
            iterations: CommonConstants.ANIMATION_ITERATIONS,
            delay: index * DelayConstant.DELAY_100
          }, [
            {
              duration: DurationConstant.DURATION_1000,
              curve: Curve.EaseInOut,
              event: () => {
                item.scale = OpacityConstants.VISIBLE
              }
            },
            {
              duration: DurationConstant.DURATION_200,
              curve: Curve.EaseInOut,
              event: () => {
                item.scale = OpacityConstants.HIDDEN
              }
            }
          ])
      })
    })
  }

  /**
   * 初始化绘制参数
   */
  initDraw() {
    this.centerX = this.vm.width / 2;
    this.centerY = this.vm.height / 2;
    this.radius = this.vm.height / 2;
    this.ballSize = this.vm.height * 0.14
    this.ballCount = this.vm.spinKit.length
    this.vm.spinKit.forEach((item: SpinKit) => {
      item.scale = 0
    })
  }

  getXPosition(index: number) {
    // 计算小球角度
    const angle = index * (2 * Math.PI / this.ballCount);
    // 计算小球坐标
    return this.centerX + this.radius * Math.cos(angle);
  }

  getYPosition(index: number) {
    // 计算小球角度
    const angle = index * (2 * Math.PI / this.ballCount);
    // 计算小球坐标
    return this.centerY + this.radius * Math.sin(angle);
  }
}
