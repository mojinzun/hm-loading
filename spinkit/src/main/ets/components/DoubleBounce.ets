import { CommonConstants } from "../constants/CommonConstants";
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
  @Local spinkit: SpinKit[] = [new SpinKit(), new SpinKit()]
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
          .opacity($r('app.float.transparency_60'))
          .borderRadius(this.vm.width)
          .backgroundColor(this.color)
          .scale({ x: item.scale, y: item.scale })
      })
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .onAppear(() => {
      this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: 0 }, [
        {
          duration: DurationConstant.DURATION_1000,
          curve: Curve.EaseInOut,
          event: () => {
            this.spinkit[0].scale = ScaleStyle.NORMAL;
            this.spinkit[1].scale = ScaleStyle.SMALL;
          }
        },
        {
          duration: DurationConstant.DURATION_1000,
          curve: Curve.EaseInOut,
          event: () => {
            this.spinkit[0].scale = ScaleStyle.SMALL;
            this.spinkit[1].scale = ScaleStyle.NORMAL;
          }
        }
      ]);
    })
  }
}