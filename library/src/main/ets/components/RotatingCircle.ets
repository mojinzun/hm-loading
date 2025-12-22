import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SizeStyle } from "../model/Style";
import { SpinKit } from "../model/SpinKit";
import { SpinKitVM } from "../viewmodel/SpinKitVM";
import { CommonConstants } from "../constants/CommonConstants";

/**
 * 旋转圆形
 */
@ComponentV2
export struct RotatingCircle {
  @Param @Require color: ResourceColor;
  @Param mSize: SizeStyle | number = SizeStyle.NORMAL
  @Local mSpinKit: SpinKit = new SpinKit()
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.getSpinKitSize(this.mSize)
  }

  build() {
    Circle()
      .width(this.vm.width)
      .height(this.vm.height)
      .fill(this.color)
      .rotate({
        x: this.mSpinKit.rotateX,
        y: this.mSpinKit.rotateY,
        angle: this.mSpinKit.rotate
      })
      .onAppear(() => {
        this.getUIContext()
          .keyframeAnimateTo({ iterations: CommonConstants.ANIMATION_ITERATIONS, delay: DelayConstant.DELAY_0 }, [
            {
              duration: DurationConstant.DURATION_600,
              curve: Curve.EaseInOut,
              event: () => {
                this.mSpinKit.rotate = CommonConstants.NEGATIVE_ROTATE_180
                this.mSpinKit.rotateX = this.vm.width / 2
                this.mSpinKit.rotateY = CommonConstants.ROTATE_AXIS_0
              }
            },
            {
              duration: DurationConstant.DURATION_0,
              curve: Curve.Linear,
              event: () => {
                this.mSpinKit.rotate = CommonConstants.ROTATE_0
              }
            },
            {
              duration: DurationConstant.DURATION_600,
              curve: Curve.EaseInOut,
              event: () => {
                this.mSpinKit.rotate = CommonConstants.ROTATE_180
                this.mSpinKit.rotateX = CommonConstants.ROTATE_AXIS_0
                this.mSpinKit.rotateY = this.vm.width / 2
              }
            }
          ])
      })
  }
}