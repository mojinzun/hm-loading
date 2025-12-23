import { CommonConstants } from "../constants/CommonConstants";
import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { OpacityConstants } from "../constants/OpacityConstant";
import { SpinKit } from "../model/SpinKit";
import { ScaleStyle, SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * 脉冲环动画
 */
@ComponentV2
export struct PulseRing {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL
  @Require @Param color: ResourceColor;
  @Local mSpinKit: SpinKit = new SpinKit()
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.getSpinKitSize(this.mSize)
    this.mSpinKit.scale = ScaleStyle.SMALL
  }

  build() {
    Stack() {
      Canvas()
        .width(CommonConstants.FULL_SCREEN_WIDTH)
        .height(CommonConstants.FULL_SCREEN_HEIGHT)
        .opacity(this.mSpinKit.opacity)
        .borderRadius(this.vm.width)
        .border({ width: 2, color: this.color })
        .scale({ x: this.mSpinKit.scale, y: this.mSpinKit.scale })
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .renderFit(RenderFit.CENTER)
    .onAppear(() => {
      this.getUIContext()
        .keyframeAnimateTo({ iterations: CommonConstants.ANIMATION_ITERATIONS, delay: DelayConstant.DELAY_0 }, [
          {
            duration: DurationConstant.DURATION_700,
            curve: Curve.LinearOutSlowIn,
            event: () => {
              this.mSpinKit.scale = ScaleStyle.NORMAL;
              this.mSpinKit.opacity = OpacityConstants.SEVEN_FIFTHS_OPAQUE
            }
          },
          {
            duration: DurationConstant.DURATION_300,
            curve: Curve.LinearOutSlowIn,
            event: () => {
              this.mSpinKit.opacity = OpacityConstants.HIDDEN
            }
          }
        ]);
    })
  }
}