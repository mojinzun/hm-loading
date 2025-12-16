import { SizeStyle, SpinKitView, Style } from 'spinkit';

@Entry
@Component
struct Index {
  build() {
    Scroll() {
      Column({ space: 12 }) {
        // Row() {
        //   SpinKitView()
        //   SpinKitView({ mColor: "#ff0000" })
        //   SpinKitView({ mSize: SizeStyle.SMALL })
        //   SpinKitView({ mSize: SizeStyle.LARGE })
        // }
        //
        // Row() {
        //   SpinKitView({ mStyle: Style.DOUBLE_BOUNCE, mColor: '#ff0000' })
        // }
        //
        // Row() {
        //   SpinKitView({ mStyle: Style.WAVE, mColor: '#ff0000' })
        //   SpinKitView({ mStyle: Style.WAVE, mColor: Color.Orange, mSize: SizeStyle.SMALL })
        //   SpinKitView({ mStyle: Style.WAVE, mColor: Color.Blue, mSize: SizeStyle.LARGE })
        // }
        //
        // Row() {
        //   SpinKitView({ mStyle: Style.WANDERING_CUBES, mColor: '#ff55deff', mSize: SizeStyle.SMALL })
        //   SpinKitView({ mStyle: Style.WANDERING_CUBES })
        //   SpinKitView({ mStyle: Style.WANDERING_CUBES, mColor: '#ff8900ff', mSize: SizeStyle.LARGE })
        // }
        //
        // Row() {
        //   SpinKitView({ mStyle: Style.PULSE, mColor: '#ff55deff', mSize: SizeStyle.SMALL })
        //   SpinKitView({ mStyle: Style.PULSE, mColor: '#ff0000' })
        //   SpinKitView({ mStyle: Style.PULSE, mColor: '#ff8900ff', mSize: SizeStyle.LARGE })
        // }
        //
        // Row() {
        //   SpinKitView({ mStyle: Style.CHASING_DOTS, mColor: '#ff0000' })
        // }
        //
        // Row() {
        //   SpinKitView({ mStyle: Style.THREE_BOUNCE, mColor: '#ff47d6ff', mSize: SizeStyle.SMALL })
        //   SpinKitView({ mStyle: Style.THREE_BOUNCE, mColor: '#ff47d6ff' })
        //   SpinKitView({ mStyle: Style.THREE_BOUNCE, mColor: '#ff47d6ff', mSize: SizeStyle.LARGE })
        // }
        //
        // Row() {
        //   SpinKitView({ mStyle: Style.CUBE_GRID, mColor: '#ff55deff', mSize: SizeStyle.SMALL })
        //   SpinKitView({ mStyle: Style.CUBE_GRID, mColor: '#ff0000' })
        //   SpinKitView({ mStyle: Style.CUBE_GRID, mColor: '#ff8900ff', mSize: SizeStyle.LARGE })
        //   SpinKitView({ mStyle: Style.CUBE_GRID, mColor: '#ff8900ff', mSize: 100 })
        // }
        //
        // Row({ space: 12 }) {
        //   SpinKitView({ mStyle: Style.FADING_CIRCLE, mColor: '#ff55deff', mSize: SizeStyle.SMALL })
        //   SpinKitView({ mStyle: Style.FADING_CIRCLE, mColor: '#ffff1e00' })
        //   SpinKitView({ mStyle: Style.FADING_CIRCLE, mColor: '#ff8900ff', mSize: SizeStyle.LARGE })
        //   // SpinKitView({ mStyle: Style.FADING_CIRCLE, mColor: '#ff8900ff', mSize: 200 })
        // }
        //
        // Row({ space: 12 }) {
        //   SpinKitView({ mStyle: Style.CIRCLE, mColor: '#ff55deff', mSize: SizeStyle.SMALL })
        //   SpinKitView({ mStyle: Style.CIRCLE, mColor: '#ffff1e00' })
        //   SpinKitView({ mStyle: Style.CIRCLE, mColor: '#ff8900ff', mSize: SizeStyle.LARGE })
        // }

        Row({ space: 12 }) {
          SpinKitView({ mStyle: Style.FOLDING_CUBE, mColor: '#ff55deff', mSize: SizeStyle.SMALL })
          SpinKitView({ mStyle: Style.FOLDING_CUBE, mColor: '#ffff1e00' })
          SpinKitView({ mStyle: Style.FOLDING_CUBE, mColor: '#ff8900ff', mSize: SizeStyle.LARGE })
        }

        // Row({ space: 12 }) {
        //   SpinKitView({ mStyle: Style.ROTATING_CIRCLE, mColor: '#ff55deff', mSize: SizeStyle.SMALL })
        //   SpinKitView({ mStyle: Style.ROTATING_CIRCLE, mColor: '#ffff1e00' })
        //   SpinKitView({ mStyle: Style.ROTATING_CIRCLE, mColor: '#ff8900ff', mSize: SizeStyle.LARGE })
        // }
        //
        // Row() {
        //   SpinKitView({ mStyle: Style.MULTIPLE_PULSE, mColor: '#ff55deff', mSize: SizeStyle.SMALL })
        //   SpinKitView({ mStyle: Style.MULTIPLE_PULSE, mColor: '#ffff1e00' })
        //   SpinKitView({ mStyle: Style.MULTIPLE_PULSE, mColor: '#ff8900ff', mSize: SizeStyle.LARGE })
        // }
        //
        // Row() {
        //   SpinKitView({ mStyle: Style.PULSE_RING, mColor: '#ff55deff', mSize: SizeStyle.SMALL })
        //   SpinKitView({ mStyle: Style.PULSE_RING, mColor: '#ffff1e00' })
        //   SpinKitView({ mStyle: Style.PULSE_RING, mColor: '#ff8900ff', mSize: SizeStyle.LARGE })
        // }
        //
        // Row() {
        //   SpinKitView({ mStyle: Style.MULTIPLE_PULSE_RING, mColor: '#ff55deff', mSize: SizeStyle.SMALL })
        //   SpinKitView({ mStyle: Style.MULTIPLE_PULSE_RING, mColor: '#ffff1e00' })
        //   SpinKitView({ mStyle: Style.MULTIPLE_PULSE_RING, mColor: '#ff8900ff', mSize: SizeStyle.LARGE })
        // }
      }
      .width('100%')
      .layoutWeight(1)
      .justifyContent(FlexAlign.Start)
    }
    .width('100%')
    .height('100%')
  }
}