import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";
import { CommonConstants } from "../constants/CommonConstants";

/**
 * 旋转平面
 */
@ComponentV2
export struct RotatingPlane {
  @Param @Require color: ResourceColor;
  @Param mSize: SizeStyle | number = SizeStyle.NORMAL
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.initSpinKit(1, this.mSize)
  }

  build() {
    Canvas()
      .width(this.vm.width)
      .height(this.vm.height)
      .backgroundColor(this.color)
      .renderFit(RenderFit.CENTER)
      .rotate({
        x: this.vm.spinKit[0].rotateX,
        y: this.vm.spinKit[0].rotateY,
        angle: this.vm.spinKit[0].rotate
      })
      .onAppear(() => {
        this.getUIContext()
          .keyframeAnimateTo({ iterations: CommonConstants.ANIMATION_ITERATIONS, delay: DelayConstant.DELAY_0 }, [
            {
              duration: DurationConstant.DURATION_600,
              curve: Curve.EaseInOut,
              event: () => {
                this.vm.spinKit[0].rotate = CommonConstants.NEGATIVE_ROTATE_180
                this.vm.spinKit[0].rotateX = CommonConstants.ROTATE_AXIS_1
                this.vm.spinKit[0].rotateY = CommonConstants.ROTATE_AXIS_0
              }
            },
            {
              duration: DurationConstant.DURATION_0,
              curve: Curve.Linear,
              event: () => {
                this.vm.spinKit[0].rotate = CommonConstants.ROTATE_0
              }
            },
            {
              duration: DurationConstant.DURATION_600,
              curve: Curve.EaseInOut,
              event: () => {
                this.vm.spinKit[0].rotate = CommonConstants.ROTATE_180
                this.vm.spinKit[0].rotateX = CommonConstants.ROTATE_AXIS_0
                this.vm.spinKit[0].rotateY = CommonConstants.ROTATE_AXIS_1
              }
            }
          ])
      })
  }
}