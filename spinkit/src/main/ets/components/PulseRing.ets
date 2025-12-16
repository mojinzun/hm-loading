import { CommonConstants } from "../constants/CommonConstants";
import { DurationConstant } from "../constants/DurationConstant";
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
  @Local spinkit: SpinKit[] = [new SpinKit()]
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.spinkit[0].scale = ScaleStyle.SMALL
    this.vm.getSpinKitSize(this.mSize)
  }

  build() {
    Stack() {
      ForEach(this.spinkit, (item: SpinKit) => {
        Canvas()
          .width(CommonConstants.FULL_SCREEN_WIDTH)
          .height(CommonConstants.FULL_SCREEN_HEIGHT)
          .opacity(item.opacity)
          .borderRadius(this.vm.width)
          .border({ width: 2, color: this.color })
          .scale({ x: item.scale, y: item.scale })
      })
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .renderFit(RenderFit.CENTER)
    .onAppear(() => {
      this.spinkit.forEach((item: SpinKit, index: number) => {
        this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: (index + 1) * 200 }, [
          {
            duration: DurationConstant.DURATION_1000,
            curve: Curve.LinearOutSlowIn,
            event: () => {
              item.scale = ScaleStyle.NORMAL;
              item.opacity = 0.7
            }
          }
        ]);
      })
    })
  }
}