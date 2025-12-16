import { ChasingDots } from "../components/ChasingDots";
import { CircleLoading } from "../components/Circle";
import { CubeGrid } from "../components/CubeGrid";
import { DoubleBounce } from "../components/DoubleBounce";
import { FadingCircle } from "../components/FadingCircle";
import { FoldingCube } from "../components/FoldingCube";
import { MultiplePulse } from "../components/MultiplePulse";
import { MultiplePulseRing } from "../components/MultiplePulseRing";
import { Pulse } from "../components/Pulse";
import { PulseRing } from "../components/PulseRing";
import { RotatingCircle } from "../components/RotatingCircle";
import { RotatingPlane } from "../components/RotatingPlane";
import { ThreeBounce } from "../components/ThreeBounce";
import { WanderingCubes } from "../components/WanderingCubes";
import { Wave } from "../components/Wave";
import { Style, SizeStyle } from "../model/Style";

/**
 * 自定义加载动画控件
 */
@ComponentV2
export struct SpinKitView {
  @Param mStyle: Style = Style.ROTATING_PLANE;
  @Param mColor: ResourceColor = $r('app.color.spin_kit_color');
  @Param mSize: SizeStyle | number = SizeStyle.NORMAL

  build() {
    Column() {
      if (this.mStyle === Style.ROTATING_PLANE) {
        RotatingPlane({ color: this.mColor, mSize: this.mSize })
      } else if (this.mStyle === Style.DOUBLE_BOUNCE) {
        DoubleBounce({ color: this.mColor, mSize: this.mSize })
      } else if (this.mStyle === Style.WAVE) {
        Wave({ color: this.mColor, mSize: this.mSize })
      } else if (this.mStyle === Style.WANDERING_CUBES) {
        WanderingCubes({ color: this.mColor, mSize: this.mSize })
      } else if (this.mStyle === Style.PULSE) {
        Pulse({ color: this.mColor, mSize: this.mSize })
      } else if (this.mStyle === Style.CHASING_DOTS) {
        ChasingDots({ color: this.mColor, mSize: this.mSize })
      } else if (this.mStyle === Style.THREE_BOUNCE) {
        ThreeBounce({ color: this.mColor, mSize: this.mSize })
      } else if (this.mStyle === Style.CUBE_GRID) {
        CubeGrid({ color: this.mColor, mSize: this.mSize })
      } else if (this.mStyle === Style.FADING_CIRCLE) {
        FadingCircle({ color: this.mColor, mSize: this.mSize })
      } else if (this.mStyle === Style.CIRCLE) {
        CircleLoading({ color: this.mColor, mSize: this.mSize })
      } else if (this.mStyle === Style.FOLDING_CUBE) {
        FoldingCube({ color: this.mColor, mSize: this.mSize })
      } else if (this.mStyle === Style.ROTATING_CIRCLE) {
        RotatingCircle({ color: this.mColor, mSize: this.mSize })
      } else if (this.mStyle === Style.MULTIPLE_PULSE) {
        MultiplePulse({ color: this.mColor, mSize: this.mSize })
      } else if (this.mStyle === Style.PULSE_RING) {
        PulseRing({ color: this.mColor, mSize: this.mSize })
      } else if (this.mStyle === Style.MULTIPLE_PULSE_RING) {
        MultiplePulseRing({ color: this.mColor, mSize: this.mSize })
      }
    }
  }
}
