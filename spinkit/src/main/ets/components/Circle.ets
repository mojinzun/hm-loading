import { DelayConstant } from "../constants/DelayConstant";
import { DurationConstant } from "../constants/DurationConstant";
import { SpinKit } from "../model/SpinKit";
import { SizeStyle } from "../model/Style";
import { SpinKitVM } from "../viewmodel/SpinKitVM";

/**
 * 渐隐+缩放环形加载动画
 * todo 后续迭代,与FadingCircle合
 */
@ComponentV2
export struct CircleLoading {
  @Require @Param mSize: SizeStyle | number = SizeStyle.NORMAL;
  @Require @Param color: ResourceColor;
  @Local spinkit: SpinKit[] = Array.from<number, SpinKit>({ length: 12 }, () => new SpinKit());
  @Local vm: SpinKitVM = new SpinKitVM()
  private centerX: number = 20; // 环形中心X坐标
  private centerY: number = 20; // 环形中心Y坐标
  private radius: number = 20; // 环形半径
  private ballCount: number = 12; // 小球数量
  private ballSize: number = 5.6; // 小球直径

  aboutToAppear(): void {
    this.vm.getSpinKitSize(this.mSize)
    this.initDraw()
  }

  build() {
    Stack() {
      // 动态生成环形小球
      ForEach(this.spinkit, (item: SpinKit, index) => {
        // 绘制小球
        Circle({ width: this.ballSize, height: this.ballSize })
          .fill(this.color)
          .position({ x: this.getXPosition(index), y: this.getYPosition(index) })
          .opacity(item.opacity)
          .scale({ x: item.scale, y: item.scale })
      })
    }
    .width(this.vm.width)
    .height(this.vm.height)
    .onAppear(() => {
      this.spinkit.forEach((item: SpinKit, index: number) => {
        this.getUIContext().keyframeAnimateTo({ iterations: -1, delay: index * DelayConstant.DELAY_100 }, [
          {
            duration: DurationConstant.DURATION_1000,
            curve: Curve.EaseInOut,
            event: () => {
              item.scale = 1
            }
          },
          {
            duration: DurationConstant.DURATION_200,
            curve: Curve.EaseInOut,
            event: () => {
              item.scale = 0
            }
          }
        ])
      })
    })
  }

  /**
   * 初始化绘制参数
   */
  initDraw() {
    this.centerX = this.vm.width / 2;
    this.centerY = this.vm.height / 2;
    this.radius = this.vm.height / 2;
    this.ballSize = this.vm.height * 0.14
    this.spinkit.forEach((item: SpinKit) => {
      item.scale = 0
    })
  }

  getXPosition(index: number) {
    // 计算小球角度
    const angle = index * (2 * Math.PI / this.ballCount);
    // 计算小球坐标
    return this.centerX + this.radius * Math.cos(angle);
  }

  getYPosition(index: number) {
    // 计算小球角度
    const angle = index * (2 * Math.PI / this.ballCount);
    // 计算小球坐标
    return this.centerY + this.radius * Math.sin(angle);
  }
}
