import { OmniLineChart } from "@omni-ui/omni_component"
import { Options } from "@omni-ui/omni_component/src/main/ets/components/chart/Options"
import { LineDataType } from "@omni-ui/omni_component/src/main/ets/components/chart/utils/DrawLineViewModel"

@Builder
export function OmniLineChartExamplePageBuilder() {
  OmniLineChartExamplePage()
}

@Component
export struct OmniLineChartExamplePage {
  @State defOption: Options<LineDataType> = new Options({
    xAxis: {
      type: 'value',
      data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
      // axisLabel: {
      //   interval: 0
      // },
    },
    yAxis: {
      type: 'category',
      name: '温度'
    },
    series: [
      {
        name: '最高气温',
        lineStyle: {
          width: 1.5
        },
        areaStyle: {
          color: {
            direction: [0, 0, 0, 1],
            colors: ['#00f39c12', '#fff39c12']
          }
        },
        color: '#fff39c12',
        data: [9, 13, 10, 15, 12, 12, 10]
      },
      {
        name: '最低气温',
        lineStyle: {
          width: 2.5
        },
        color: '#ff3498db',
        data: [0, -1, 2, 0, 3, -2, 1]
      },

    ]
  })
  build() {
    NavDestination() {
      Column() {
        OmniLineChart({
          options: this.defOption
        })
      }
      .height('50%')
    }
    .title('折线图示例')
  }
}