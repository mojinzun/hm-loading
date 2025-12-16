import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SizeStyle } from "../model/Style";
import { SpinKit } from "../model/SpinKit";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * 旋转圆形
 */
@ComponentV2
export struct RotatingCircle {
  @Param @Require color: ResourceColor;
  @Param mSpinKit: SpinKit = new SpinKit()
  @Param mSize: SizeStyle | number = SizeStyle.NORMAL
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
        this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: DelayConstant.DELAY_0 }, [
          {
            duration: DurationConstant.DURATION_600,
            curve: Curve.EaseInOut,
            event: () => {
              this.mSpinKit.rotate = -180
              this.mSpinKit.rotateX = this.vm.width / 2
              this.mSpinKit.rotateY = 0
            }
          },
          {
            duration: DurationConstant.DURATION_0,
            curve: Curve.Linear,
            event: () => {
              this.mSpinKit.rotate = 0
            }
          },
          {
            duration: DurationConstant.DURATION_600,
            curve: Curve.EaseInOut,
            event: () => {
              this.mSpinKit.rotate = 180
              this.mSpinKit.rotateX = 0
              this.mSpinKit.rotateY = this.vm.width / 2
            }
          }
        ])
      })
  }
}