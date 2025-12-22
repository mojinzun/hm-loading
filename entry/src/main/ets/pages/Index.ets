import { CommonConstants } from 'spinkit/src/main/ets/constants/CommonConstants';
import { DurationConstant } from 'spinkit/src/main/ets/constants/DurationConstant';
import { StyleComponent } from '../component/StyleComponent';
import { WidgetComponent } from '../component/WidgetComponent';
import { Constants } from '../constants/CommonConstant';

@Entry
@Component
struct Index {
  @State selectedIndex: number = 0;
  @State currentIndex: number = 0;
  private controller: TabsController = new TabsController();

  @Builder
  tabBuilder(title: string, targetIndex: number) {
    Stack() {
      Button({ buttonStyle: ButtonStyleMode.TEXTUAL }) {
        Text(title)
          .fontColor(this.selectedIndex === targetIndex ? $r("app.color.selected_tab") : $r("app.color.unselected_tab"))
      }
      .width(CommonConstants.FULL_SCREEN_WIDTH)
      .height(CommonConstants.FULL_SCREEN_HEIGHT)
      .type(ButtonType.Normal)
    }
  }

  build() {
    Column() {
      Divider()
        .width(Constants.HALF_SCREEN_WIDTH)
        .color($r("app.color.selected_tab_underline"))
        .strokeWidth(2)
        .position({ x: this.selectedIndex === 0 ? 0 : Constants.HALF_SCREEN_WIDTH, y: 54 })
        .animation({ duration: DurationConstant.DURATION_300 })
      Tabs({
        barPosition: BarPosition.Start,
        index: this.currentIndex,
        controller: this.controller
      }) {
        TabContent() {
          StyleComponent()
        }
        .tabBar(this.tabBuilder('STYLE', 0))

        TabContent() {
          WidgetComponent()
        }
        .tabBar(this.tabBuilder('WIDGET', 1))
      }
      .barMode(BarMode.Fixed)
      .onChange((index: number) => {
        this.currentIndex = index;
      })
      .onAnimationStart((index: number, targetIndex: number, event: TabsAnimationEvent) => {
        if (index === targetIndex) {
          return;
        }
        this.selectedIndex = targetIndex;
      })
    }
    .width(CommonConstants.FULL_SCREEN_WIDTH)
    .height(CommonConstants.FULL_SCREEN_HEIGHT)
    .backgroundColor($r("app.color.start_window_background"))
  }
}