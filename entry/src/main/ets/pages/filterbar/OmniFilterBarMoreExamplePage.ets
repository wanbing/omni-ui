import { OmniFilterItemBean,
  OmniFilterBar
} from '@omni-ui/omni_component'
import {
  OmniFilterDataRoot} from '@omni-ui/omni_component/src/main/ets/components/filterbar/bean/OmniFilterItemBean'
import util from '@ohos.util'
import { OmniFilterController
} from '@omni-ui/omni_component/src/main/ets/components/filterbar/OmniFilterBar'
import { JSON } from '@kit.ArkTS'
import ObjectUtil from '../../utils/utils'

@Builder
export function OmniFilterBarMoreExamplePageBuilder() {
  OmniFilterBarMoreExamplePage()
}

@Entry
@Component
struct OmniFilterBarMoreExamplePage {
  @State filterDataRoot?: OmniFilterDataRoot = undefined
  @State selectedParams?: Map<string, string> = undefined
  private filterController: OmniFilterController = new OmniFilterController()

  aboutToAppear(): void {
    getContext(this).resourceManager.getRawFileContent('more_filter.json', (_err, value) => {
      let textDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: true });
      const result = textDecoder.decodeWithStream(value, { stream: false })
      this.filterDataRoot = new OmniFilterDataRoot(OmniFilterItemBean.convertJsonToObj(result)!)
    });
  }

  build() {
    NavDestination() {
      Column() {
        if (this.filterDataRoot) {
          OmniFilterBar(
            {
              filterDataRoot: this.filterDataRoot,
              onFilterParamsChanged: (selectedParams: Map<string, string>) => {
                this.selectedParams = selectedParams
              },
              filterController: this.filterController,
            }
          )
        }
        if (this.selectedParams) {
          Flex() {
            Column() {
              Text(`${JSON.stringify(ObjectUtil.ObjectFromEntries(this.selectedParams))}`)
            }
            .width(`100%`)
            .height(`100%`)
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
          }
        }
      }
      .height('100%')
      .width('100%')
    }
    .title('筛选示例')
    .onWillDisappear(() => {
      console.log(``)
      this.filterController.close()
    })
  }

  @Builder
  Title() {
    Text('筛选示例')
  }
}
