import { CommonConstants } from "../constants/CommonConstants";
import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SpinKit } from "../model/SpinKit";
import { ScaleStyle, SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * 波浪效果
 */
@ComponentV2
export struct Wave {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL
  @Require @Param color: ResourceColor;
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.initSpinKit(5, this.mSize)
    this.setSpinKitScale()
  }

  build() {
    Row() {
      ForEach(this.vm.spinKit, (item: SpinKit) => {
        Canvas()
          .width(this.vm.width / (this.vm.spinKit.length + 1))
          .height(CommonConstants.FULL_SCREEN_HEIGHT)
          .backgroundColor(this.color)
          .scale({ y: item.scale })
      })
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .justifyContent(FlexAlign.SpaceBetween)
    .onAppear(() => {
      this.vm.spinKit.forEach((_, index) => {
        this.getUIContext().keyframeAnimateTo(
          {
            iterations: CommonConstants.ANIMATION_ITERATIONS,
            delay: DelayConstant.DELAY_600 + index * DelayConstant.DELAY_100
          },
          this.generateKeyframeState(index)
        );
      });
    })
  }

  /**
   * 初始化长条的缩放值
   */
  private setSpinKitScale() {
    for (let i = 0; i < this.vm.spinKit.length; i++) {
      this.vm.spinKit[i].scale = CommonConstants.SCALE_0_4;
    }
  }

  /**
   * 封装KeyframeState
   */
  private generateKeyframeState(index: number): Array<KeyframeState> {
    return [
      {
        duration: DurationConstant.DURATION_200,
        curve: Curve.EaseInOut,
        event: () => {
          this.vm.spinKit[index].scale = ScaleStyle.NORMAL;
        }
      },
      {
        duration: DurationConstant.DURATION_200,
        curve: Curve.EaseInOut,
        event: () => {
          this.vm.spinKit[index].scale = CommonConstants.SCALE_0_4;
        }
      },
      {
        duration: DurationConstant.DURATION_800,
        event: () => {
        }
      }
    ];
  }
}