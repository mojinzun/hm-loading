import { CommonConstants } from "../constants/CommonConstants";
import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SpinKit } from "../model/SpinKit";
import { SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * 立方体网格动画
 */
@ComponentV2
export struct CubeGrid {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL;
  @Require @Param color: ResourceColor;
  @Local spinkit: SpinKit[] =
    [new SpinKit(), new SpinKit(), new SpinKit(), new SpinKit(), new SpinKit(), new SpinKit(), new SpinKit(),
      new SpinKit(), new SpinKit()]
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.getSpinKitSize(this.mSize)
  }

  build() {
    Grid() {
      ForEach(this.spinkit, (item: SpinKit) => {
        GridItem() {
          Canvas()
            .width(CommonConstants.FULL_SCREEN_WIDTH)
            .height(CommonConstants.FULL_SCREEN_HEIGHT)
        }
        .backgroundColor(this.color)
        .scale({ x: item.scale, y: item.scale, z: 1 })
      })
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
          { iterations: -1, delay: item.delay },
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
          indices.forEach(index => this.spinkit[index].scale = 0);
        }
      },
      {
        duration: DurationConstant.DURATION_500,
        curve: Curve.Linear,
        event: () => {
          indices.forEach(index => this.spinkit[index].scale = 1);
        }
      },
      {
        duration: 400,
        curve: Curve.Linear,
        event: () => {

        }
      }
    ];
  }
}

interface KeyframeAnimate {
  indices: number[]
  delay: number
}