import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SpinKit } from "../model/SpinKit";
import { SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * 三球弹跳效果
 */
@ComponentV2
export struct ThreeBounce {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL;
  @Require @Param color: ResourceColor;
  @Local spinkit: SpinKit[] = [new SpinKit(), new SpinKit(), new SpinKit()]
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.getSpinKitSize(this.mSize)
    this.initScale()
  }

  /**
   * 初始化球的缩放值
   */
  private initScale() {
    for (let i = 0; i < this.spinkit.length; i++) {
      this.spinkit[i].scale = 0;
    }
  }

  build() {
    Row() {
      ForEach(this.spinkit, (item: SpinKit) => {
        Circle()
          .width(this.vm.width / 3)
          .height(this.vm.height / 3)
          .fill(this.color)
          .scale({ x: item.scale, y: item.scale })
      })
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .alignItems(VerticalAlign.Center)
    .onAppear(() => {
      this.spinkit.forEach((item, index) => {
        this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: index * DelayConstant.DELAY_160 }, [
          {
            duration: DurationConstant.DURATION_600,
            curve: Curve.EaseInOut,
            event: () => {
              item.scale = 1;
            }
          },
          {
            duration: DurationConstant.DURATION_800,
            curve: Curve.EaseInOut,
            event: () => {
              item.scale = 0;
            }
          }
        ]);
      })
    })
  }
}