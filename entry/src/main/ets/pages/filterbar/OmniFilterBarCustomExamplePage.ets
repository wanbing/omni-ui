import { OmniFilterItemBean, OmniFilterBar } from '@omni-ui/omni_component'
import { OmniFilterDataRoot } from '@omni-ui/omni_component/src/main/ets/components/filterbar/bean/OmniFilterItemBean'
import util from '@ohos.util'
import { OmniFilterController
} from '@omni-ui/omni_component/src/main/ets/components/filterbar/OmniFilterBar'
import { JSON } from '@kit.ArkTS'
import ObjectUtil from '../../utils/utils'
import { OmniFilterCustomValueRange } from './component/OmniCustomValueRange'
import {
  OmniFilterComponentRegistry,
  OnCloseAction,
  OnConfirmAction
} from '@omni-ui/omni_component/src/main/ets/components/filterbar/OmniFilterComponentRegistry'

@Builder
export function OmniFilterBarCustomExamplePageBuilder() {
  OmniFilterBarCustomExamplePage()
}

@Entry
@Component
struct OmniFilterBarCustomExamplePage {
  @State filterDataRoot?: OmniFilterDataRoot = undefined
  @State selectedParams?: Map<string, string> = undefined
  private filterController: OmniFilterController = new OmniFilterController()
  private customComponentRegistry: OmniFilterComponentRegistry = new OmniFilterComponentRegistry()

  aboutToAppear(): void {
    getContext(this).resourceManager.getRawFileContent('custom_filter.json', (_err, value) => {
      let textDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: true });
      const result = textDecoder.decodeWithStream(value, { stream: false })
      this.filterDataRoot = new OmniFilterDataRoot(OmniFilterItemBean.convertJsonToObj(result)!)
    });
    //注册自定义Component
    this.customComponentRegistry.registerDropSlideComponent(`custom_value`, wrapBuilder(customLayout))
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
              componentRegistry: this.customComponentRegistry
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
    Text('自定义筛选示例')
  }
}

@Builder
function customLayout(item: OmniFilterItemBean, onConfirmAction: OnConfirmAction, onCloseAction: OnCloseAction) {
  OmniFilterCustomValueRange({
    item: item,
    onConfirmAction: onConfirmAction
  })
}