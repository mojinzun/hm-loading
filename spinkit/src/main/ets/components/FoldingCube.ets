import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SpinKit } from "../model/SpinKit";
import { SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * 折叠立方体
 */
@ComponentV2
export struct FoldingCube {
  @Param @Require color: ResourceColor;
  @Param mSpinKit: SpinKit[] = Array.from<number, SpinKit>({ length: 4 }, () => new SpinKit())
  @Param mSize: SizeStyle | number = SizeStyle.NORMAL
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.getSpinKitSize(this.mSize)
  }

  build() {
    Stack() {
      ForEach(this.mSpinKit, (item: SpinKit, index: number) => {
        Canvas()
          .width(this.vm.width / 2)
          .height(this.vm.height / 2)
          .backgroundColor(this.color)
          .position({ x: index % 2 === 0 ? 0 : this.vm.width / 2, y: index > 1 ? this.vm.height / 2 : 0 })
          .opacity(item.opacity)
          .rotate({
            x: index === 1 || index === 2 ? 1 : 0,
            y: index === 0 || index === 3 ? 1 : 0,
            centerX: index === 0 ? this.vm.width / 2 : 0,
            centerY: index === 1 ? this.vm.height / 2 : 0,
            angle: item.rotate
          })
      })
    }
    .rotate({ angle: -45 })
    .onAppear(() => {
      const keyframe = [() => {
        this.mSpinKit[1].rotate = 180
        this.mSpinKit[1].opacity = 0
      }, () => {
        this.mSpinKit[1].rotate = 0
        this.mSpinKit[3].rotate = 180
        this.mSpinKit[3].opacity = 0
      }, () => {
        this.mSpinKit[3].rotate = 0
        this.mSpinKit[2].rotate = 180
        this.mSpinKit[2].opacity = 0
      }, () => {
        this.mSpinKit[2].rotate = 0
        this.mSpinKit[0].rotate = 180
      }, () => {
        this.mSpinKit[1].opacity = 1
        this.mSpinKit[1].rotate = 180
      }, () => {
        this.mSpinKit[3].opacity = 1
        this.mSpinKit[3].rotate = 180
      }, () => {
        this.mSpinKit[2].opacity = 1
        this.mSpinKit[2].rotate = 180
      }, () => {
      }];
      this.getUIContext()
        .keyframeAnimateTo({ iterations: -1, delay: DelayConstant.DELAY_0 }, keyframe.map<KeyframeState>(animate => ({
          duration: DurationConstant.DURATION_300,
          curve: Curve.Linear,
          event: animate
        })))
    })
  }
}