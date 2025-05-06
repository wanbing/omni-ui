import { BarChartStyle, OmniProgressBarChart, Options } from '@omni-ui/omni_component'

@Builder
export function OmniProgressBarChartExamplePageBuilder() {
  OmniProgressBarChartExamplePage()
}

@Component
export struct OmniProgressBarChartExamplePage {
  @State defOption: Options<number> = new Options({
    xAxis: {
      type: 'value',
      data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
    },
    yAxis: {
      type: 'category',
      name: '温度'
    },
    series: [
      {
        name: '最高气温',
        barStyle: {
          width: 15,
        },
        color: '#296DFF',
        data: [30, 11, 25, 28, 33, 25, 20]
      },
      {
        name: '最低气温',
        barStyle: {
          width: 15,
        },
        color: '#2ECC71',
        data: [8, 9, 5, 7, 10, 6, 9]
      },
    ],
  })

  build() {
    NavDestination() {
      Column() {
        Column() {
          OmniProgressBarChart({
            barChartStyle: BarChartStyle.horizontal,
            options: this.defOption
          })
        }
        .height('50%')

        Column() {
          OmniProgressBarChart({
            options: this.defOption
          })
        }
        .height('50%')
      }
    }
    .title("柱状图示例")
    .height('100%')
  }
}