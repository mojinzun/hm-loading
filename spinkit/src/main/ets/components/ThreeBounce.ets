import { CommonConstants } from "../constants/CommonConstants";
import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SpinKit } from "../model/SpinKit";
import { ScaleStyle, SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * 三球弹跳效果
 */
@ComponentV2
export struct ThreeBounce {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL;
  @Require @Param color: ResourceColor;
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.initSpinKit(3, this.mSize)
    this.vm.initSpinKitScale()
  }

  build() {
    Row() {
      ForEach(this.vm.spinKit, (item: SpinKit) => {
        Circle()
          .width(this.vm.width / this.vm.spinKit.length)
          .height(this.vm.height / this.vm.spinKit.length)
          .fill(this.color)
          .scale({ x: item.scale, y: item.scale })
      })
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .alignItems(VerticalAlign.Center)
    .onAppear(() => {
      this.vm.spinKit.forEach((item, index) => {
        this.getUIContext()
          .keyframeAnimateTo({
            iterations: CommonConstants.ANIMATION_ITERATIONS,
            delay: index * DelayConstant.DELAY_160
          }, [
            {
              duration: DurationConstant.DURATION_600,
              curve: Curve.EaseInOut,
              event: () => {
                item.scale = ScaleStyle.NORMAL;
              }
            },
            {
              duration: DurationConstant.DURATION_800,
              curve: Curve.EaseInOut,
              event: () => {
                item.scale = ScaleStyle.SMALL;
              }
            }
          ]);
      })
    })
  }
}