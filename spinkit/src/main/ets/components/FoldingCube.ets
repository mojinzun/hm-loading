import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SpinKit } from "../model/SpinKit";
import { SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * todo 折叠立方体(暂时没思路)
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
        // .opacity(this.mSpinKit[0].opacity)
        .opacity(this.mSpinKit[3].opacity)
        .rotate({
          y: 100,
          centerX: this.vm.height / 2,
          angle: this.mSpinKit[3].rotate
          // angle: this.mSpinKit[0].rotate
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
        // .opacity(this.mSpinKit[1].opacity)
        .rotate({
          x: 100,
          centerY: this.vm.height / 2,
          angle: this.mSpinKit[0].rotate
          // angle: this.mSpinKit[1].rotate
        })
      // Canvas()
      //   .id('square3')
      //   .width(this.vm.width / 2)
      //   .height(this.vm.height / 2)
      //   .backgroundColor(this.color)
      //   .renderFit(RenderFit.CENTER)
      //   .alignRules({
      //     top: { anchor: 'square1', align: VerticalAlign.Bottom },
      //     left: { anchor: '__container__', align: HorizontalAlign.Start }
      //   })
      //   .opacity(this.mSpinKit[2].opacity)
      //   .rotate({
      //     x: 100,
      //     centerY: 0,
      //     angle: this.mSpinKit[2].rotate
      //   })
      // Canvas()
      //   .id('square4')
      //   .width(this.vm.width / 2)
      //   .height(this.vm.height / 2)
      //   .backgroundColor(this.color)
      //   .renderFit(RenderFit.CENTER)
      //   .alignRules({
      //     top: { anchor: 'square1', align: VerticalAlign.Bottom },
      //     left: { anchor: 'square1', align: HorizontalAlign.End }
      //   })
      //   .opacity(this.mSpinKit[1].opacity)
      //   // .opacity(this.mSpinKit[3].opacity)
      //   .rotate({
      //     y: 100,
      //     centerX: 0,
      //     angle: this.mSpinKit[1].rotate
      //     // angle: this.mSpinKit[3].rotate
      //   })
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .onAppear(() => {
      this.mSpinKit.forEach((item: SpinKit, index: number) => {
        // todo 先测试透明度不变化的，再逐步测试透明度变化
        this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: DelayConstant.DELAY_2000 * index }, [
          {
            duration: DurationConstant.DURATION_2000,
            curve: Curve.EaseInOut,
            event: () => {
              item.rotate = index > 1 ? -180 : 180
            }
          },
          // {
          //   duration: DurationConstant.DURATION_0,
          //   curve: Curve.EaseInOut,
          //   event: () => {
          //     item.opacity = 0
          //   }
          // },
          // {
          //   duration: 6000,
          //   curve: Curve.EaseInOut,
          //   event: () => {
          //   }
          // }
        ])
        // this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: DelayConstant.DELAY_2000 * (index + 4) }, [
        //   {
        //     duration: DurationConstant.DURATION_2000,
        //     curve: Curve.EaseInOut,
        //     event: () => {
        //       item.rotate = index > 1 ? -180 : 180
        //     }
        //   },
        //   {
        //     duration: DurationConstant.DURATION_0,
        //     curve: Curve.EaseInOut,
        //     event: () => {
        //       item.opacity = 1
        //     }
        //   },
        //   {
        //     duration: 6000,
        //     curve: Curve.EaseInOut,
        //     event: () => {
        //     }
        //   }
        // ])
      })
      // this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: DelayConstant.DELAY_0 }, [
      //   {
      //     duration: DurationConstant.DURATION_2000,
      //     curve: Curve.EaseInOut,
      //     event: () => {
      //       this.mSpinKit[1].rotate = 180
      //     }
      //   },
      //   {
      //     duration: DurationConstant.DURATION_0,
      //     curve: Curve.EaseInOut,
      //     event: () => {
      //       this.mSpinKit[1].opacity = 0
      //     }
      //   },
      //   {
      //     duration: 6000,
      //     curve: Curve.EaseInOut,
      //     event: () => {
      //     }
      //   }
      // ])
      // this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: DelayConstant.DELAY_2000 }, [
      //   {
      //     duration: DurationConstant.DURATION_2000,
      //     curve: Curve.EaseInOut,
      //     event: () => {
      //       this.mSpinKit[3].rotate = 180
      //     }
      //   },
      //   {
      //     duration: DurationConstant.DURATION_0,
      //     curve: Curve.EaseInOut,
      //     event: () => {
      //       this.mSpinKit[3].opacity = 0
      //     }
      //   },
      //   {
      //     duration: 6000,
      //     curve: Curve.EaseInOut,
      //     event: () => {
      //     }
      //   }
      // ])
      // this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: 4000 }, [
      //   {
      //     duration: DurationConstant.DURATION_2000,
      //     curve: Curve.EaseInOut,
      //     event: () => {
      //       this.mSpinKit[2].rotate = 180
      //     }
      //   },
      //   {
      //     duration: DurationConstant.DURATION_0,
      //     curve: Curve.EaseInOut,
      //     event: () => {
      //       this.mSpinKit[2].opacity = 0
      //     }
      //   },
      //   {
      //     duration: 6000,
      //     curve: Curve.EaseInOut,
      //     event: () => {
      //     }
      //   }
      // ])
      // this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: 6000 }, [
      //   {
      //     duration: DurationConstant.DURATION_2000,
      //     curve: Curve.EaseInOut,
      //     event: () => {
      //       this.mSpinKit[0].rotate = 180
      //     }
      //   },
      //   {
      //     duration: DurationConstant.DURATION_0,
      //     curve: Curve.EaseInOut,
      //     event: () => {
      //       this.mSpinKit[0].opacity = 0
      //     }
      //   },
      //   {
      //     duration: 6000,
      //     curve: Curve.EaseInOut,
      //     event: () => {
      //     }
      //   }
      // ])
    })
  }
}