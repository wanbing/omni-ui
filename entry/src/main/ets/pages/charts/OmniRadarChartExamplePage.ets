import { OmniRadarChart, Options } from "@omni-ui/omni_component"

@Builder
export function OmniRadarChartExamplePageBuilder() {
  OmniRadarChartExamplePage()
}

@Component
export struct OmniRadarChartExamplePage {
  @State defOption: Options<number> = new Options({
    radar: {
      indicator: [
        { name: 'Sales' },
        { name: 'Administration' },
        { name: 'Information Technology' },
        { name: 'Customer Support' },
        { name: 'Development' }
      ]
    },
    series: [
      {
        name: '最高气温',
        lineStyle: {
          width: 1.5,
          color: "#ff52be80"
        },
        areaStyle: {
          color: {
            direction: [0, 1, 0, 0],
            colors: [
              '#9952be80'
            ]
          }
        },
        data: [11, 12, 15, 13, 12],
      },
      {
        name: '最高气温2',
        areaStyle: {
          color: {
            direction: [0, 1, 0, 0],
            colors: [
              '#99265fe5'
            ]
          }
        },
        data: [10, 12, 10.5, 13, 10]
      },
    ]
  })
  build() {
    NavDestination() {
      Column(){
        OmniRadarChart({
          options: this.defOption
        })
      }
      .height('50%')
    }
    .title("雷达图示例")
  }
}