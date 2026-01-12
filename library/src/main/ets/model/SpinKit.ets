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

/**
 * SpinKit 加载动画组件model类
 */
@ObservedV2
export class SpinKit {
  /** 平面旋转角度（顺时针为正） */
  @Trace rotate: number = 0;
  /** X轴旋转角度
   * --API20及以上版本支持
   * --API20以下版本仅作为旋转轴向量坐标 */
  @Trace rotateX: number = 0;
  /** Y轴旋转角度
   * --API20及以上版本支持
   * --API20以下版本仅作为旋转轴 */
  @Trace rotateY: number = 0;
  /** 组件缩放 */
  @Trace scale: number = 1;
  /** X轴的缩放倍数 */
  @Trace scaleX: number = 1;
  /** Y轴的缩放倍数 */
  @Trace scaleY: number = 1;
  /** X轴平移变换 */
  @Trace translateX: number = 0;
  /** Y轴平移变换 */
  @Trace translateY: number = 0;
  /** 组件透明度 */
  @Trace opacity: number = 1;
}