import { CommonConstants } from "../constants/CommonConstants";
import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SpinKit } from "../model/SpinKit";
import { ScaleStyle, SizeStyle } from "../model/Style";
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
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.initSpinKit(2, this.mSize)
    this.vm.spinKit[1].translateX = this.vm.width * SCALE_FACTOR_0_75;
    this.vm.spinKit[1].translateY = this.vm.width * SCALE_FACTOR_0_75;
  }

  build() {
    Stack() {
      ForEach(this.vm.spinKit, (item: SpinKit) => {
        Canvas()
          .width(this.vm.width * SCALE_FACTOR_0_25)
          .height(this.vm.width * SCALE_FACTOR_0_25)
          .backgroundColor(this.color)
          .position({ x: 0, y: 0 })
          .translate({ x: item.translateX, y: item.translateY })
          .scale({ x: item.scale, y: item.scale })
          .rotate({ angle: item.rotate })
      }, (item: SpinKit, index) => `${index}__${item}`)
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .onAppear(() => {
      this.vm.spinKit.forEach((_, index) => {
        this.getUIContext()
          .keyframeAnimateTo({ iterations: CommonConstants.ANIMATION_ITERATIONS, delay: DelayConstant.DELAY_0 },
            this.generateKeyframeState(index));
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
          this.vm.spinKit[i].scale = index % 2 == 0 ? CommonConstants.SCALE_0_5 : ScaleStyle.NORMAL;
          this.vm.spinKit[i].rotate = item * CommonConstants.NEGATIVE_ROTATE_90;
          this.vm.spinKit[i].translateX = isEven ? (index % arr.length < 2 ? this.vm.width * SCALE_FACTOR_0_75 : 0) :
            (index % arr.length < 2 ? 0 : this.vm.width * SCALE_FACTOR_0_75);
          this.vm.spinKit[i].translateY =
            isEven ? (index % arr.length == 1 || index % arr.length == 2 ? this.vm.width * SCALE_FACTOR_0_75 : 0) :
              (index % arr.length == 1 || index % arr.length == 2 ? 0 : this.vm.width * SCALE_FACTOR_0_75);
        }
      }
    })
    return keyframeStateArr
  }
}