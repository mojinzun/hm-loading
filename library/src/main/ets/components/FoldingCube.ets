import { CommonConstants } from "../constants/CommonConstants";
import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { OpacityConstants } from "../constants/OpacityConstants";
import { SpinKit } from "../model/SpinKit";
import { SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * 折叠立方体
 */
@ComponentV2
export struct FoldingCube {
  @Param @Require color: ResourceColor;
  @Param mSize: SizeStyle | number = SizeStyle.NORMAL
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.initSpinKit(4, this.mSize)
  }

  build() {
    Row() {
      Stack() {
        ForEach(this.vm.spinKit, (item: SpinKit, index: number) => {
          Canvas()
            .width(this.vm.width / 2)
            .height(this.vm.height / 2)
            .backgroundColor(this.color)
            .position({ x: index % 2 === 0 ? 0 : this.vm.width / 2, y: index > 1 ? this.vm.height / 2 : 0 })
            .opacity(item.opacity)
            .rotate({
              x: index === 1 || index === 2 ? CommonConstants.ROTATE_AXIS_1 : CommonConstants.ROTATE_AXIS_0,
              y: index === 0 || index === 3 ? CommonConstants.ROTATE_AXIS_1 : CommonConstants.ROTATE_AXIS_0,
              centerX: index === 0 ? this.vm.width / 2 : 0,
              centerY: index === 1 ? this.vm.height / 2 : 0,
              angle: item.rotate
            })
        })
      }
      .width(CommonConstants.FULL_SCREEN_WIDTH)
      .height(CommonConstants.FULL_SCREEN_HEIGHT)
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .border({ width: 1, color: Color.Transparent })
    .rotate({ angle: CommonConstants.NEGATIVE_ROTATE_45 })
    .onAppear(() => {
      const keyframe = [() => {
        this.vm.spinKit[1].rotate = CommonConstants.ROTATE_180
        this.vm.spinKit[1].opacity = OpacityConstants.HIDDEN
      }, () => {
        this.vm.spinKit[1].rotate = CommonConstants.ROTATE_0
        this.vm.spinKit[3].rotate = CommonConstants.ROTATE_180
        this.vm.spinKit[3].opacity = OpacityConstants.HIDDEN
      }, () => {
        this.vm.spinKit[3].rotate = CommonConstants.ROTATE_0
        this.vm.spinKit[2].rotate = CommonConstants.ROTATE_180
        this.vm.spinKit[2].opacity = OpacityConstants.HIDDEN
      }, () => {
        this.vm.spinKit[2].rotate = CommonConstants.ROTATE_0
        this.vm.spinKit[0].rotate = CommonConstants.ROTATE_180
      }, () => {
        this.vm.spinKit[1].opacity = OpacityConstants.VISIBLE
        this.vm.spinKit[1].rotate = CommonConstants.ROTATE_180
      }, () => {
        this.vm.spinKit[3].opacity = OpacityConstants.VISIBLE
        this.vm.spinKit[3].rotate = CommonConstants.ROTATE_180
      }, () => {
        this.vm.spinKit[2].opacity = OpacityConstants.VISIBLE
        this.vm.spinKit[2].rotate = CommonConstants.ROTATE_180
      }, () => {
      }];
      this.getUIContext()
        .keyframeAnimateTo({ iterations: CommonConstants.ANIMATION_ITERATIONS, delay: DelayConstant.DELAY_0 },
          keyframe.map<KeyframeState>(animate => ({
            duration: DurationConstant.DURATION_300,
            curve: Curve.Linear,
            event: animate
          })))
    })
  }
}