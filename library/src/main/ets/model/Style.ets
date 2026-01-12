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
 * 加载动画类型枚举
 */
export enum Style {
  /** 平面旋转动画 */
  ROTATING_PLANE = 0,
  /** 双弹跳动画 */
  DOUBLE_BOUNCE = 1,
  /** 波浪动画 */
  WAVE = 2,
  /** 流浪立方体 */
  WANDERING_CUBES = 3,
  /** 脉冲动画 */
  PULSE = 4,
  /** 追逐点动画 */
  CHASING_DOTS = 5,
  /** 三弹跳动画 */
  THREE_BOUNCE = 6,
  /** 渐隐+缩放环形加载动画 */
  CIRCLE = 7,
  /** 立方体网格动画 */
  CUBE_GRID = 8,
  /** 渐隐环形加载动画 */
  FADING_CIRCLE = 9,
  /** 折叠立方体动画 */
  FOLDING_CUBE = 10,
  /** 旋转圆动画 */
  ROTATING_CIRCLE = 11,
  /** 多脉冲动画 */
  MULTIPLE_PULSE = 12,
  /** 脉冲环动画 */
  PULSE_RING = 13,
  /** 多脉冲环动画 */
  MULTIPLE_PULSE_RING = 14,
}

/**
 * 尺寸样式
 */
export enum SizeStyle {
  /** 小组件尺寸-宽高均为24 */
  SMALL = 'small',
  /** 大组件尺寸-宽高均为64 */
  LARGE = 'large',
  /** 默认组件尺寸-宽高均为40 */
  NORMAL = 'normal'
}

/**
 * 缩放样式
 * 用于控制加载动画的缩放比例
 */
export enum ScaleStyle {
  SMALL = 0,
  NORMAL = 1,
  LARGE = 2
}
