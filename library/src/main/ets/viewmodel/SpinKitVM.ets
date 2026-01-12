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

import { ScaleStyle, SizeStyle } from "../model/Style";
import { CommonConstants } from "../constants/CommonConstants";
import { SpinKit } from "../model/SpinKit";

/**
 * SpinKit-视图模型类
 */
@ObservedV2
export class SpinKitVM {
  @Trace width: number = CommonConstants.DEFAULT_SIZE;
  @Trace height: number = CommonConstants.DEFAULT_SIZE;
  @Trace spinKit: SpinKit[] = []

  /**
   * 获取SpinKit尺寸样式
   */
  getSpinKitSize(size: SizeStyle | number) {
    if (typeof size === 'number') {
      this.width = size;
      this.height = size;
    } else if (size == SizeStyle.SMALL) {
      this.width = CommonConstants.SMALL_SIZE;
      this.height = CommonConstants.SMALL_SIZE;
    } else if (size == SizeStyle.LARGE) {
      this.width = CommonConstants.LARGE_SIZE;
      this.height = CommonConstants.LARGE_SIZE;
    } else {
      this.width = CommonConstants.DEFAULT_SIZE;
      this.height = CommonConstants.DEFAULT_SIZE;
    }
  }

  /**
   * 创建SpinKit
   */
  createSpinKit(length: number) {
    this.spinKit = Array.from<number, SpinKit>({ length }, () => new SpinKit())
  }

  /**
   * 初始化SpinKit
   */
  initSpinKit(length: number,size: SizeStyle | number){
    this.getSpinKitSize(size)
    this.createSpinKit(length)
  }

  /**
   * 设置SpinKit缩放值为0，不显示
   */
  initSpinKitScale() {
    this.spinKit.forEach((item) => {
      item.scale = ScaleStyle.SMALL;
    })
  }
}