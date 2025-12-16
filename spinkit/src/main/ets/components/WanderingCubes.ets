import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SpinKit } from "../model/SpinKit";
import { SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

// 乘法因子0.25
const SCALE_FACTOR_0_25 = 0.25
// 乘法因子0.75
const SCALE_FACTOR_0_75 = 0.75

/**
 * 流浪立方体
 */
@ComponentV2
export struct WanderingCubes {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL;
  @Require @Param color: ResourceColor;
  @Local spinkit: SpinKit[] = [new SpinKit(), new SpinKit()]
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.getSpinKitSize(this.mSize)
    this.spinkit[1].translateX = this.vm.width * SCALE_FACTOR_0_75;
    this.spinkit[1].translateY = this.vm.width * SCALE_FACTOR_0_75;
  }

  build() {
    Stack() {
      ForEach(this.spinkit, (item: SpinKit) => {
        Canvas()
          .width(this.vm.width * SCALE_FACTOR_0_25)
          .height(this.vm.width * SCALE_FACTOR_0_25)
          .backgroundColor(this.color)
          .translate({ x: item.translateX, y: item.translateY })
          .scale({ x: item.scale, y: item.scale })
          .rotate({ angle: item.rotate })
      })
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .onAppear(() => {
      this.spinkit.forEach((_, index) => {
        this.getUIContext()
          .keyframeAnimateTo({ iterations: -1, delay: DelayConstant.DELAY_0 }, this.generateKeyframeState(index));
      })
    })
  }

  /**
   * 封装KeyframeState
   */
  private generateKeyframeState(i: number): Array<KeyframeState> {
    const arr: number[] = [1, 2, 3, 4]
    const isEven = i % 2 === 0;
    let keyframeStateArr: Array<KeyframeState> = []
    arr.forEach((item, index) => {
      keyframeStateArr[index] = {
        duration: DurationConstant.DURATION_450,
        curve: Curve.EaseInOut,
        event: () => {
          this.spinkit[i].scale = index % 2 == 0 ? 0.5 : 1;
          this.spinkit[i].rotate = item * -90;
          this.spinkit[i].translateX = isEven ? (index % arr.length < 2 ? this.vm.width * SCALE_FACTOR_0_75 : 0) :
            (index % arr.length < 2 ? 0 : this.vm.width * SCALE_FACTOR_0_75);
          this.spinkit[i].translateY =
            isEven ? (index % arr.length == 1 || index % arr.length == 2 ? this.vm.width * SCALE_FACTOR_0_75 : 0) :
              (index % arr.length == 1 || index % arr.length == 2 ? 0 : this.vm.width * SCALE_FACTOR_0_75);
        }
      }
    })
    return keyframeStateArr
  }
}