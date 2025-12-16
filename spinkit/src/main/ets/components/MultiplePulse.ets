import { CommonConstants } from "../constants/CommonConstants";
import { DurationConstant } from "../constants/DurationConstant";
import { SpinKit } from "../model/SpinKit";
import { ScaleStyle, SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * 多脉冲动画
 */
@ComponentV2
export struct MultiplePulse {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL
  @Require @Param color: ResourceColor;
  @Local spinkit: SpinKit[] = [new SpinKit(), new SpinKit(), new SpinKit()]
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    // todo 可以在vm中定义一个方法处理数组中的缩放值
    this.spinkit[0].scale = ScaleStyle.SMALL
    this.spinkit[1].scale = ScaleStyle.SMALL;
    this.spinkit[2].scale = ScaleStyle.SMALL;
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
          .backgroundColor(this.color)
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
            curve: Curve.EaseInOut,
            event: () => {
              item.scale = ScaleStyle.NORMAL;
              item.opacity = 0;
            }
          }
        ]);
      })
    })
  }
}