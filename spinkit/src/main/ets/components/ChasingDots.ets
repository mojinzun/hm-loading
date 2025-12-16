import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SpinKit } from "../model/SpinKit";
import { SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * 追逐点
 */
@ComponentV2
export struct ChasingDots {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL;
  @Require @Param color: ResourceColor;
  @Local spinkit: SpinKit[] = [new SpinKit(), new SpinKit()]
  @Local vm: SpinKitVM = new SpinKitVM()
  @Local dotSize: number = 0

  aboutToAppear(): void {
    this.vm.getSpinKitSize(this.mSize)
    this.spinkit[0].scale = 0;
    this.dotSize = this.vm.width * 0.6
  }

  build() {
    Stack() {
      ForEach(this.spinkit, (item: SpinKit, index: number) => {
        Circle()
          .width(this.dotSize)
          .height(this.dotSize)
          .fill(this.color)
          .position({
            x: (this.vm.width - this.dotSize) / 2,
            y: index == 0 ? 0 : (this.vm.width - this.dotSize)
          })
          .scale({ x: item.scale, y: item.scale })
      })
    }
    .width(this.vm.width)
    .height(this.vm.width)
    .rotate({ angle: this.spinkit[0].rotate })
    .onAppear(() => {
      this.getUIContext()
        .keyframeAnimateTo({ iterations: -1, delay: DelayConstant.DELAY_0 }, this.generateKeyframeState());
      this.getUIContext()
        .keyframeAnimateTo({ iterations: -1, delay: DelayConstant.DELAY_500 }, this.generateKeyframeAngle());
    })
  }

  /**
   * 封装KeyframeState
   */
  private generateKeyframeState(): Array<KeyframeState> {
    return [
      {
        duration: DurationConstant.DURATION_1000,
        curve: Curve.EaseInOut,
        event: () => {
          this.spinkit[0].scale = 1;
          this.spinkit[1].scale = 0;
        }
      },
      {
        duration: DurationConstant.DURATION_1000,
        curve: Curve.EaseInOut,
        event: () => {
          this.spinkit[0].scale = 0;
          this.spinkit[1].scale = 1;
        }
      }
    ];
  }

  /**
   * 封装KeyframeState
   */
  private generateKeyframeAngle(): Array<KeyframeState> {
    return [
      {
        duration: DurationConstant.DURATION_2000,
        curve: Curve.Linear,
        event: () => {
          this.spinkit[0].rotate = 360;
        }
      }
    ];
  }
}