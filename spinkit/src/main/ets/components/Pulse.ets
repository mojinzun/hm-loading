import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SpinKit } from "../model/SpinKit";
import { SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * 脉冲效果
 */
@ComponentV2
export struct Pulse {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL;
  @Require @Param color: ResourceColor;
  @Local spinkit: SpinKit = new SpinKit()
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.getSpinKitSize(this.mSize)
    this.spinkit.scale = 0
  }

  build() {
    Canvas()
      .width(this.vm.width)
      .height(this.vm.height)
      .borderRadius(this.vm.width)
      .backgroundColor(this.color)
      .renderFit(RenderFit.CENTER)
      .scale({ x: this.spinkit.scale, y: this.spinkit.scale })
      .opacity(this.spinkit.opacity)
      .onAppear(() => {
        this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: DelayConstant.DELAY_0 }, [
          {
            duration: DurationConstant.DURATION_1000,
            curve: Curve.EaseInOut,
            event: () => {
              this.spinkit.scale = 1
              this.spinkit.opacity = 0
            }
          }
        ])
      })
  }
}