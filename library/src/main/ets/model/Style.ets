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
