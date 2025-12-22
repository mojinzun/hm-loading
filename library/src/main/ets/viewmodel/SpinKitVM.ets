import { ScaleStyle, SizeStyle } from "../model/Style";
import { CommonConstants } from "../constants/CommonConstants";
import { SpinKit } from "../model/SpinKit";

/**
 * SpinKit-视图模型类
 */
@ObservedV2
export class SpinKitVM {
  @Trace width: number = CommonConstants.DEFAULT_SIZE;
  @Trace height: number = CommonConstants.DEFAULT_SIZE;
  @Trace spinKit: SpinKit[] = []

  /**
   * 获取SpinKit尺寸样式
   */
  getSpinKitSize(size: SizeStyle | number) {
    if (typeof size === 'number') {
      this.width = size;
      this.height = size;
    } else if (size == SizeStyle.SMALL) {
      this.width = CommonConstants.SMALL_SIZE;
      this.height = CommonConstants.SMALL_SIZE;
    } else if (size == SizeStyle.LARGE) {
      this.width = CommonConstants.LARGE_SIZE;
      this.height = CommonConstants.LARGE_SIZE;
    } else {
      this.width = CommonConstants.DEFAULT_SIZE;
      this.height = CommonConstants.DEFAULT_SIZE;
    }
  }

  /**
   * 创建SpinKit
   */
  createSpinKit(length: number) {
    this.spinKit = Array.from<number, SpinKit>({ length }, () => new SpinKit())
  }

  /**
   * 初始化SpinKit
   */
  initSpinKit(length: number,size: SizeStyle | number){
    this.getSpinKitSize(size)
    this.createSpinKit(length)
  }

  /**
   * 设置SpinKit缩放值为0，不显示
   */
  initSpinKitScale() {
    this.spinKit.forEach((item) => {
      item.scale = ScaleStyle.SMALL;
    })
  }
}