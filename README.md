# SpinKit

## Introduction

> SpinKit loading animations (OpenHarmony implementation of [SpinKit](https://tobiasahlin.com/spinkit))
> . This library is adapted from the [Android-SpinKit](https://github.com/ybq/Android-SpinKit) original library to run on OpenHarmony, retaining its existing usage and features.

STYLE examples:

<img src="./gifs/customStyle.gif" width="200"/>

WIDGET effects:

<img src="./gifs/widget.gif" width="200"/>

DETAIL page effects:

<img src="./gifs/detail.gif" width="200"/>

## Installation

```shell
ohpm install @ohos/spinkit
```

For more information about OpenHarmony ohpm environment configuration, please refer to [How to Install OpenHarmony ohpm Packages](https://gitcode.com/openharmony-tpc/docs/blob/master/OpenHarmony_har_usage.md)

## Usage Instructions

SpinKit provides multiple loading animation effects:

```tsx
export enum Style {
  /** Rotating plane animation */
  ROTATING_PLANE = 0,
  /** Double bounce animation */
  DOUBLE_BOUNCE = 1,
  /** Wave animation */
  WAVE = 2,
  /** Wandering cubes */
  WANDERING_CUBES = 3,
  /** Pulse animation */
  PULSE = 4,
  /** Chasing dots animation */
  CHASING_DOTS = 5,
  /** Three bounce animation */
  THREE_BOUNCE = 6,
  /** Fade + scale circular loading animation */
  CIRCLE = 7,
  /** Cube grid animation */
  CUBE_GRID = 8,
  /** Fading circle loading animation */
  FADING_CIRCLE = 9,
  /** Folding cube animation */
  FOLDING_CUBE = 10,
  /** Rotating circle animation */
  ROTATING_CIRCLE = 11,
  /** Multiple pulse animation */
  MULTIPLE_PULSE = 12,
  /** Pulse ring animation */
  PULSE_RING = 13,
  /** Multiple pulse ring animation */
  MULTIPLE_PULSE_RING = 14,
}
```

Import and use

 ```tsx
import { SizeStyle, SpinKitView, Style } from "@ohos/spinkit"

...

build() {
    Column() {
       SpinKitView({ mStyle: Style.WANDERING_CUBES, mColor: '#ff8900ff', mSize: SizeStyle.LARGE })
    }
    .width('100%')
    .height('100%')
  }
 ```

For more detailed usage, please refer to the implementation of the open source library's sample page.

## Interface Description

SpinKitView({mStyle?:Style,mColor?:ResourceColor,mSize?:SizeStyle \| number})

Create a SpinKitView loading animation.

| **Name** | Type                  | **Required** | **Description**                                                                                                                                    |
|--------|---------------------|:----------:|------------------------------------------------------------------------------------------------------------------------------------------------|
| mStyle | Style               |    No      | Enumeration style type, such as Style.ROTATING_PLANE, Style.DOUBLE_BOUNCE, Style.WAVE, Style.WANDERING_CUBES, Style.PULSE, etc.                            |
| mColor | ResourceColor       |    No      | Color of SpinKit, default is "#333" dark gray                                                                                                        |
| mSize  | SizeStyle \| number |    No      | Set the size of SpinKit, accepting two data types: SizeStyle and number.<br />SizeStyle: enumeration style type, SizeStyle.SMALL, SizeStyle.LARGE, SizeStyle.NORMAL, default value is SizeStyle.NORMAL, size 40.<br /> |

Style enumeration description

Animation style enumeration

| Name                  | Value | Description                     |
|---------------------|-------|---------------------------------|
| ROTATING_PLANE      | 0     | Rotating plane animation        |
| DOUBLE_BOUNCE       | 1     | Double bounce animation         |
| WAVE                | 2     | Wave animation                  |
| WANDERING_CUBES     | 3     | Wandering cubes animation       |
| PULSE               | 4     | Pulse animation                 |
| CHASING_DOTS        | 5     | Chasing dots animation          |
| THREE_BOUNCE        | 6     | Three bounce animation          |
| CIRCLE              | 7     | Fade + scale circular loading animation |
| CUBE_GRID           | 8     | Cube grid animation             |
| FADING_CIRCLE       | 9     | Fading circle loading animation |
| FOLDING_CUBE        | 10    | Folding cube animation          |
| ROTATING_CIRCLE     | 11    | Rotating circle animation       |
| MULTIPLE_PULSE      | 12    | Multiple pulse animation        |
| PULSE_RING          | 13    | Pulse ring animation            |
| MULTIPLE_PULSE_RING | 14    | Multiple pulse ring animation   |

SizeStyle enumeration description

Animation size enumeration

| Name   | Value   | Description            |
|--------|---------|------------------------|
| SMALL  | small   | Small size. 24vp       |
| NORMAL | normal  | Default size. 40vp     |
| LARGE  | large   | Large size. 64vp       |

## About Obfuscation

For code obfuscation, please refer to [Introduction to Code Obfuscation](https://docs.openharmony.cn/pages/v5.0/en/application-dev/arkts-utils/source-obfuscation.md)

- If you want the SpinKit library not to be obfuscated during code obfuscation, you need to add the corresponding exclusion rules to the obfuscation rule configuration file obfuscation-rules.txt:

```
-keep
./oh_modules/@ohos/spinkit
```

## Constraints and Limitations

Verified on the following versions:

- DevEco Studio 5.1.1 Release, SDK: API12 Release(5.0.0.66)

## Directory Structure

````
|---- SpinKit  
|     |---- entry               # Sample code folder   
|     |---- library             # SpinKit library folder
|	  |     |---- Index.ets		# External interface
|     |     |---- src  
|     |     |     |---- main  
|     |     |           |---- ets  
|     |     |           |     |---- components      # Core component implementation  
|     |     |           |     |     |---- ChasingDots.ets  
|     |     |           |     |     |---- Circle.ets  
|     |     |           |     |     |---- CubeGrid.ets  
|     |     |           |     |     |---- DoubleBounce.ets  
|     |     |           |     |     |---- FadingCircle.ets  
|     |     |           |     |     |---- FoldingCube.ets  
|     |     |           |     |     |---- MultiplePulse.ets  
|     |     |           |     |     |---- MultiplePulseRing.ets  
|     |     |           |     |     |---- Pulse.ets  
|     |     |           |     |     |---- PulseRing.ets  
|     |     |           |     |     |---- RotatingCircle.ets  
|     |     |           |     |     |---- RotatingPlane.ets  
|     |     |           |     |     |---- ThreeBounce.ets  
|     |     |           |     |     |---- WanderingCubes.ets  
|     |     |           |     |     |---- Wave.ets  
|     |     |           |     |---- constants       # Library constant definitions  
|     |     |           |     |     |---- CommonConstants.ets       # Common constant definitions  
|     |     |           |     |     |---- DelayConstant.ets         # Delay constant definitions  
|     |     |           |     |     |---- DurationConstant.ets      # Duration constant definitions  
|     |     |           |     |     |---- OpacityConstant.ets       # Opacity constant definitions  
|     |     |           |     |---- model           # Data model  
|     |     |           |     |     |---- SpinKit.ets  
|     |     |           |     |     |---- Style.ets  
|     |     |           |     |---- view            # View layer  
|     |     |           |     |     |---- SpinKitView.ets  # Externally exposed SpinKit view component  
|     |     |           |     └─--- viewmodel       # View model   
|     |     |           |           |---- SpinKitVM.ets   
|     |     |           └─ resources                # Library resource files (images, styles, etc.) 
|     |---- README.md           # English installation and usage guide  
|     |---- README_zh.md        # Chinese installation and usage guide  
````

## Contributing

If you encounter any issues during use, please submit an [Issue](https://gitcode.com/openharmony-sig/ohos_spin_kit/issues) to the component. Of course, we also welcome [PR](https://gitcode.com/openharmony-sig/ohos_spin_kit/pulls) contributions.

## Open Source License

This project is based on the [Apache License 2.0](https://gitcode.com/openharmony-sig/ohos_spin_kit/blob/master/LICENSE)
, please feel free to enjoy and participate in open source.
