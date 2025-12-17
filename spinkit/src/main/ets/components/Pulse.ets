import { CommonConstants } from "../constants/CommonConstants";
import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { OpacityConstants } from "../constants/OpacityConstants";
import { ScaleStyle, SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * 脉冲效果
 */
@ComponentV2
export struct Pulse {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL;
  @Require @Param color: ResourceColor;
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.initSpinKit(1, this.mSize)
    this.vm.initSpinKitScale()
  }

  build() {
    Canvas()
      .width(this.vm.width)
      .height(this.vm.height)
      .borderRadius(this.vm.width)
      .backgroundColor(this.color)
      .renderFit(RenderFit.CENTER)
      .scale({ x: this.vm.spinKit[0].scale, y: this.vm.spinKit[0].scale })
      .opacity(this.vm.spinKit[0].opacity)
      .onAppear(() => {
        this.getUIContext()
          .keyframeAnimateTo({ iterations: CommonConstants.ANIMATION_ITERATIONS, delay: DelayConstant.DELAY_0 }, [
            {
              duration: DurationConstant.DURATION_1000,
              curve: Curve.EaseInOut,
              event: () => {
                this.vm.spinKit[0].scale = ScaleStyle.NORMAL
                this.vm.spinKit[0].opacity = OpacityConstants.HIDDEN
              }
            }
          ])
      })
  }
}