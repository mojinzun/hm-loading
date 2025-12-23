import { CommonConstants } from "../constants/CommonConstants";
import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SpinKit } from "../model/SpinKit";
import { ScaleStyle, SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * 双弹跳动画
 */
@ComponentV2
export struct DoubleBounce {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL
  @Require @Param color: ResourceColor;
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.initSpinKit(2, this.mSize)
    this.vm.spinKit[0].scale = ScaleStyle.SMALL
  }

  build() {
    Stack() {
      ForEach(this.vm.spinKit, (item: SpinKit) => {
        Canvas()
          .width(CommonConstants.FULL_SCREEN_WIDTH)
          .height(CommonConstants.FULL_SCREEN_HEIGHT)
          .opacity($r('app.float.transparency_60'))
          .borderRadius(this.vm.width)
          .backgroundColor(this.color)
          .scale({ x: item.scale, y: item.scale })
      }, (item: SpinKit, index) => `${index}__${item}`)
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .onAppear(() => {
      this.getUIContext()
        .keyframeAnimateTo({ iterations: CommonConstants.ANIMATION_ITERATIONS, delay: DelayConstant.DELAY_0 }, [
          {
            duration: DurationConstant.DURATION_1000,
            curve: Curve.EaseInOut,
            event: () => {
              this.vm.spinKit[0].scale = ScaleStyle.NORMAL;
              this.vm.spinKit[1].scale = ScaleStyle.SMALL;
            }
          },
          {
            duration: DurationConstant.DURATION_1000,
            curve: Curve.EaseInOut,
            event: () => {
              this.vm.spinKit[0].scale = ScaleStyle.SMALL;
              this.vm.spinKit[1].scale = ScaleStyle.NORMAL;
            }
          }
        ]);
    })
  }
}