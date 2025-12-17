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