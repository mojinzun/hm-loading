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
  @Param mSpinKit: SpinKit[] = [new SpinKit(), new SpinKit(), new SpinKit(), new SpinKit()]
  @Param mSize: SizeStyle | number = SizeStyle.NORMAL
  @Local vm: SpinKitVM = new SpinKitVM()

  aboutToAppear(): void {
    this.vm.getSpinKitSize(this.mSize)
  }

  build() {
    RelativeContainer() {
      Canvas()
        .id('square1')
        .width(this.vm.width / 2)
        .height(this.vm.height / 2)
        .backgroundColor(this.color)
        .renderFit(RenderFit.CENTER)
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        })
        .opacity(this.mSpinKit[3].opacity)
        .rotate({
          y: 1,
          centerX: this.vm.height / 2,
          angle: this.mSpinKit[3].rotate
        })
      Canvas()
        .id('square2')
        .width(this.vm.width / 2)
        .height(this.vm.height / 2)
        .backgroundColor(this.color)
        .renderFit(RenderFit.CENTER)
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          left: { anchor: 'square1', align: HorizontalAlign.End }
        })
        .opacity(this.mSpinKit[0].opacity)
        .rotate({
          x: 1,
          centerY: this.vm.height / 2,
          angle: this.mSpinKit[0].rotate
        })
      Canvas()
        .id('square3')
        .width(this.vm.width / 2)
        .height(this.vm.height / 2)
        .backgroundColor(this.color)
        .renderFit(RenderFit.CENTER)
        .alignRules({
          top: { anchor: 'square1', align: VerticalAlign.Bottom },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        })
        .opacity(this.mSpinKit[2].opacity)
        .rotate({
          x: 1,
          centerY: 0,
          angle: this.mSpinKit[2].rotate
        })
      Canvas()
        .id('square4')
        .width(this.vm.width / 2)
        .height(this.vm.height / 2)
        .backgroundColor(this.color)
        .renderFit(RenderFit.CENTER)
        .alignRules({
          top: { anchor: 'square1', align: VerticalAlign.Bottom },
          left: { anchor: 'square1', align: HorizontalAlign.End }
        })
        .opacity(this.mSpinKit[1].opacity)
        .rotate({
          y: 1,
          centerX: 0,
          angle: this.mSpinKit[1].rotate
        })
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .rotate({angle: 45})
    .onAppear(() => {
      this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: 0 }, [
        {
          duration: DurationConstant.DURATION_300,
          curve: Curve.Linear,
          event: () => {
            this.mSpinKit[0].rotate = 180
            this.mSpinKit[0].opacity = 0
          }
        },
        {
          duration: DurationConstant.DURATION_300,
          curve: Curve.Linear,
          event: () => {
            this.mSpinKit[0].rotate = 0
            this.mSpinKit[1].rotate = 180
            this.mSpinKit[1].opacity = 0
          }
        },
        {
          duration: DurationConstant.DURATION_300,
          curve: Curve.Linear,
          event: () => {
            this.mSpinKit[1].rotate = 0
            this.mSpinKit[2].rotate = 180
            this.mSpinKit[2].opacity = 0
          }
        },
        {
          duration: DurationConstant.DURATION_300,
          curve: Curve.Linear,
          event: () => {
            this.mSpinKit[2].rotate = 0
            this.mSpinKit[3].rotate = 180
          }
        },
        {
          duration: DurationConstant.DURATION_300,
          curve: Curve.Linear,
          event: () => {
            this.mSpinKit[0].opacity = 1
            this.mSpinKit[0].rotate = 180
          }
        },
        {
          duration: DurationConstant.DURATION_300,
          curve: Curve.Linear,
          event: () => {
            this.mSpinKit[1].opacity = 1
            this.mSpinKit[1].rotate = 180
          }
        },
        {
          duration: DurationConstant.DURATION_300,
          curve: Curve.Linear,
          event: () => {
            this.mSpinKit[2].opacity = 1
            this.mSpinKit[2].rotate = 180
          }
        },
        {
          duration: DurationConstant.DURATION_300,
          curve: Curve.Linear,
          event: () => {
          }
        }
      ])
    })
  }
}