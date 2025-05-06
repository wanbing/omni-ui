import { display } from '@kit.ArkUI';
import { OmniFunnelChart, OmniFunnelShape } from '@omni-ui/omni_component';

@Builder
export function OmniFunnelChartExamplePageBuilder() {
  OmniFunnelChartExamplePage()
}

@Component
export struct OmniFunnelChartExamplePage {
  private context1: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true));
  @State private shape: OmniFunnelShape = OmniFunnelShape.Left
  @State private layerMargin: number = 0
  @State private layerHeight: number = 40
  @State private maxLayerWidth: number = 0
  @State private minLayerWidth: number = 0
  private screenWidth: number = 0

  aboutToAppear(): void {
    this.screenWidth = px2vp(display.getDefaultDisplaySync().width)
    this.maxLayerWidth = this.screenWidth * 4 / 5
    this.minLayerWidth = this.screenWidth * 2 / 5
  }

  build() {
    NavDestination() {
      Scroll() {
        Column() {
          // Text('draw bar example')
          // Row() {
          //   Canvas(this.context1)
          //     .height(200)
          //     .width('100%')
          //     .onReady(() => {
          //       this.context1.fillStyle = 0xEEF0FF;
          //       this.context1.fillRect(0, 0, this.context1.width, 200);
          //
          //       drawFunnel({
          //         context: this.context1,
          //         startX: 0,
          //         startY: 50,
          //         width: 150,
          //         height: 20,
          //         funnelColor: 0xaabbcc,
          //       }, OmniFunnelShape.Left)
          //
          //
          //       drawFunnel({
          //         context: this.context1,
          //         startX: 0,
          //         startY: 80,
          //         width: 150,
          //         height: 20,
          //         funnelColor: 0xbbaacc,
          //       }, OmniFunnelShape.Right)
          //
          //       drawFunnel({
          //         context: this.context1,
          //         startX: 0,
          //         startY: 110,
          //         width: 150,
          //         height: 20,
          //         funnelColor: 0xccbbaa,
          //       }, OmniFunnelShape.Both)
          //     })
          // }
          // Divider()

          Column() {
            Row() {
              Column() {
                Text('Funnel Shape').margin({
                  bottom: 15
                })
                Row() {
                  Button('Left')
                    .onClick(() => {
                      this.shape = OmniFunnelShape.Left
                    })
                  Button('Right')
                    .onClick(() => {
                      this.shape = OmniFunnelShape.Right
                    })
                  Button('Both')
                    .onClick(() => {
                      this.shape = OmniFunnelShape.Both
                    })
                }.justifyContent(FlexAlign.SpaceBetween)
              }
            }.margin({
              bottom: 15
            })

            Row() {
              Text('Margin:')
              Slider({
                step: 10,
                min: 1,
                max: 51,
              })
                .showSteps(false)// 是否显示步长刻度
                .blockSize({ width: 15, height: 15 })// 滑块大小
                .blockColor($r('sys.color.background_primary'))// 滑块颜色
                .trackBorderRadius(2)// 底板圆角半径
                .selectedBorderRadius(2)// 已滑动部分圆角半径
                .onChange((value: number) => {
                  this.layerMargin = value
                })
            }

            Row() {
              Text('Height:')
              Slider({
                value: $$this.layerHeight,
                step: 1,
                min: 20,
                max: 51,
              })
                .showSteps(false)// 是否显示步长刻度
                .blockSize({ width: 15, height: 15 })// 滑块大小
                .blockColor($r('sys.color.background_primary'))// 滑块颜色
                .trackBorderRadius(2)// 底板圆角半径
                .selectedBorderRadius(2)// 已滑动部分圆角半径
                .onChange((value: number) => {
                  this.layerHeight = value
                })
            }

            Row() {
              Text('MaxWidth:')
              Slider({
                value: $$this.maxLayerWidth,
                step: 10,
                min: 0,
                max: this.screenWidth,
              })
                .showSteps(false)// 是否显示步长刻度
                .blockSize({ width: 15, height: 15 })// 滑块大小
                .blockColor($r('sys.color.background_primary'))// 滑块颜色
                .trackBorderRadius(2)// 底板圆角半径
                .selectedBorderRadius(2)// 已滑动部分圆角半径
                .onChange((value: number) => {
                  this.maxLayerWidth = value
                })
            }

            Row() {
              Text('MinWidth:')
              Slider({
                value: $$this.minLayerWidth,
                step: 10,
                min: 0,
                max: this.screenWidth / 2,
              })
                .showSteps(false)// 是否显示步长刻度
                .blockSize({ width: 15, height: 15 })// 滑块大小
                .blockColor($r('sys.color.background_primary'))// 滑块颜色
                .trackBorderRadius(2)// 底板圆角半径
                .selectedBorderRadius(2)// 已滑动部分圆角半径
                .onChange((value: number) => {
                  this.minLayerWidth = value
                })
            }

            Text('Funnel Chart').margin({
              bottom: 15
            })
            OmniFunnelChart({
              config: {
                shape: this.shape,
                layerHeight: this.layerHeight,
                layerCount: 5,
                defaultLayerColor: [0xFF3575FC,
                  0xFF0984F9,
                  0xFF6BB7FF,
                  0xFF93CAFF,
                  0xFFB5DBFF],
                maxLayerWidth: this.maxLayerWidth,
                minLayerWidth: this.minLayerWidth,
                layerMargin: this.layerMargin,
                layerTitles: ['layer1', 'layer2', 'layer3', 'layer4', 'layer5'],
                markerTitles: ['widget1', 'widget2', 'widget3', 'widget4', 'widget5'],
                layerTextColor: 0xffffffff,
                markerTextColor: 0xff000000
              }
            })
          }.width('100%')
        }
      }

    }.title('Funnel示例')
  }
}