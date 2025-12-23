import { CommonConstants } from "../constants/CommonConstants";
import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SpinKit } from "../model/SpinKit";
import { ScaleStyle, SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

interface KeyframeAnimate {
  indices: number[]
  delay: number
}

/**
 * 立方体网格动画
 */
@ComponentV2
export struct CubeGrid {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL;
  @Require @Param color: ResourceColor;
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.initSpinKit(9, this.mSize)
  }

  build() {
    Grid() {
      ForEach(this.vm.spinKit, (item: SpinKit) => {
        GridItem() {
          Canvas()
            .width(CommonConstants.FULL_SCREEN_WIDTH)
            .height(CommonConstants.FULL_SCREEN_HEIGHT)
        }
        .backgroundColor(this.color)
        .scale({ x: item.scale, y: item.scale, z: 1 })
      }, (item: SpinKit, index) => `${index}__${item}`)
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .rowsTemplate('1fr 1fr 1fr')
    .columnsTemplate('1fr 1fr 1fr')
    .onAppear(() => {
      // 定义动画序列配置
      const animations: KeyframeAnimate[] = [
        { indices: [6], delay: DelayConstant.DELAY_0 },
        { indices: [3, 7], delay: DelayConstant.DELAY_100 },
        { indices: [0, 4, 8], delay: DelayConstant.DELAY_200 },
        { indices: [1, 5], delay: DelayConstant.DELAY_300 },
        { indices: [2], delay: DelayConstant.DELAY_400 }
      ];

      // 循环创建并启动动画
      animations.forEach((item: KeyframeAnimate) => {
        this.getUIContext().keyframeAnimateTo(
          { iterations: CommonConstants.ANIMATION_ITERATIONS, delay: item.delay },
          this.createKeyframes(item.indices)
        );
      });
    })
  }

  /**
   * 封装KeyframeState
   */
  private createKeyframes(indices: number[]): Array<KeyframeState> {
    return [
      {
        duration: DurationConstant.DURATION_500,
        curve: Curve.EaseInOut,
        event: () => {
          indices.forEach(index => this.vm.spinKit[index].scale = ScaleStyle.SMALL);
        }
      },
      {
        duration: DurationConstant.DURATION_500,
        curve: Curve.Linear,
        event: () => {
          indices.forEach(index => this.vm.spinKit[index].scale = ScaleStyle.NORMAL);
        }
      },
      {
        duration: DurationConstant.DURATION_400,
        curve: Curve.Linear,
        event: () => {

        }
      }
    ];
  }
}