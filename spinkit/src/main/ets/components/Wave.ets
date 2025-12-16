import { CommonConstants } from "../constants/CommonConstants";
import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SpinKit } from "../model/SpinKit";
import { SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * 波浪效果
 */
@ComponentV2
export struct Wave {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL
  @Require @Param color: ResourceColor;
  @Local spinkit: SpinKit[] = [new SpinKit(), new SpinKit(), new SpinKit(), new SpinKit(), new SpinKit(),]
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.getSpinKitSize(this.mSize)
    this.setSpinKitScale()
  }

  build() {
    Row() {
      ForEach(this.spinkit, (item: SpinKit) => {
        Canvas()
          .width(this.vm.width / 6)
          .height(CommonConstants.FULL_SCREEN_HEIGHT)
          .backgroundColor(this.color)
          .scale({ y: item.scale })
      })
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .justifyContent(FlexAlign.SpaceBetween)
    .onAppear(() => {
      this.spinkit.forEach((_, index) => {
        this.getUIContext().keyframeAnimateTo(
          { iterations: -1, delay: DelayConstant.DELAY_600 + index * DelayConstant.DELAY_100 },
          this.generateKeyframeState(index)
        );
      });
    })
  }

  /**
   * 初始化长条的缩放值
   */
  private setSpinKitScale() {
    for (let i = 0; i < this.spinkit.length; i++) {
      this.spinkit[i].scale = 0.4;
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
          this.spinkit[index].scale = 1;
        }
      },
      {
        duration: DurationConstant.DURATION_200,
        curve: Curve.EaseInOut,
        event: () => {
          this.spinkit[index].scale = 0.4;
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