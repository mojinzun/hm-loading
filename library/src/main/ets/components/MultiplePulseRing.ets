import { CommonConstants } from "../constants/CommonConstants";
import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SpinKit } from "../model/SpinKit";
import { ScaleStyle, SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * 多脉冲环动画
 */
@ComponentV2
export struct MultiplePulseRing {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL
  @Require @Param color: ResourceColor;
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.initSpinKit(3, this.mSize)
    this.vm.initSpinKitScale()
  }

  build() {
    Stack() {
      ForEach(this.vm.spinKit, (item: SpinKit) => {
        Canvas()
          .width(CommonConstants.FULL_SCREEN_WIDTH)
          .height(CommonConstants.FULL_SCREEN_HEIGHT)
          .opacity(item.opacity)
          .borderRadius(this.vm.width)
          .border({ width: 2, color: this.color })
          .scale({ x: item.scale, y: item.scale })
      }, (item: SpinKit, index) => `${index}__${item}`)
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .renderFit(RenderFit.CENTER)
    .onAppear(() => {
      this.vm.spinKit.forEach((item: SpinKit, index: number) => {
        this.getUIContext()
          .keyframeAnimateTo({
            iterations: CommonConstants.ANIMATION_ITERATIONS,
            delay: (index + 1) * DelayConstant.DELAY_200
          }, [
            {
              duration: DurationConstant.DURATION_1000,
              curve: Curve.EaseInOut,
              event: () => {
                item.scale = ScaleStyle.NORMAL;
              }
            }
          ]);
      })
    })
  }
}