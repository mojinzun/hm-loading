import { StyleComponent } from '../component/StyleComponent';
import { WidgetComponent } from '../component/WidgetComponent';

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
          .fontColor(this.selectedIndex === targetIndex ? '#202020' : '#646464')
      }
      .width('100%')
      .height('100%')
      .type(ButtonType.Normal)

      // .border({ width: { bottom: 2 }, color: this.selectedIndex === targetIndex ? '#ff4081' : Color.Transparent })
      // Divider()
      //   .color(this.selectedIndex === targetIndex ? '#ff4081' : Color.Transparent)
      //   .strokeWidth(this.selectedIndex === targetIndex ? 2 : 0)
      //   .position({ bottom: 0 })
      //   .animation({ duration: 400 })
    }
  }

  build() {
    Column() {
      Divider()
        .width("50%")
        .color('#ff4081')
        .strokeWidth(2)
        .position({ x: this.selectedIndex === 0 ? 0 : "50%", y: 54 })
        .animation({ duration: 300 })
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
    .width('100%')
    .height('100%')
    .backgroundColor('#FaFaFa')
  }
}