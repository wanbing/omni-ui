import { OmniFilterItemBean, OmniFilterBar } from '@omni-ui/omni_component'
import { OmniFilterDataRoot } from '@omni-ui/omni_component/src/main/ets/components/filterbar/bean/OmniFilterItemBean'
import util from '@ohos.util'
import { OmniFilterController } from '@omni-ui/omni_component/src/main/ets/components/filterbar/OmniFilterBar'
import { JSON } from '@kit.ArkTS'
import ObjectUtil from '../../utils/utils'
import { OmniToast } from '@omni-ui/omni_component/src/main/ets/components/toast/OmniToast'
import {
  OmniFilterCustomMenuTitle
} from '@omni-ui/omni_component/src/main/ets/components/filterbar/bean/OmniFilterMenuItemBean'
import { AlertDialog } from '@kit.ArkUI'

@Builder
export function OmniFilterBarMenuCustomExamplePageBuilder() {
  OmniFilterBarMenuCustomExamplePage()
}

@Entry
@Component
struct OmniFilterBarMenuCustomExamplePage {
  @State filterDataRoot?: OmniFilterDataRoot = undefined
  @State selectedParams?: Map<string, string> = undefined
  private filterController: OmniFilterController = new OmniFilterController()
  private currentInterceptItem?: OmniFilterItemBean
  dialogControllerConfirm: CustomDialogController = new CustomDialogController({
    builder: AlertDialog({
      primaryTitle: '提示',
      content: '1. 点击确认更改自定义标题\n2. 点击重置重置标题',
      primaryButton: {
        value: '重置',
        action: () => {
          if (this.currentInterceptItem) {
            this.currentInterceptItem.customMap = undefined
            this.filterController.refreshMenu()
          }
        },
      },
      secondaryButton: {
        value: '确认',
        role: ButtonRole.ERROR,
        action: () => {
          if (this.currentInterceptItem) {
            this.currentInterceptItem.customMap = new Map()
            this.currentInterceptItem.customMap.set(`custom_selected_title`, `自定义双列`)
            this.filterController.refreshMenu()
          }
        }
      },
    }),
  })

  aboutToAppear(): void {
    getContext(this).resourceManager.getRawFileContent('multi_list_filter.json', (_err, value) => {
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
              onMenuClickInterceptor: (index: number, item: OmniFilterItemBean) => {
                this.currentInterceptItem = item
                if (index == 0) {
                  OmniToast.showText({ msg: `拦截 index = ${index}` })
                  return true
                }
                if (index == 1) {
                  this.dialogControllerConfirm.open()
                  return true
                }
                return false
              },
              onMenuCustomTitle: (index: number, item: OmniFilterItemBean) => {
                if (index == 1) {
                  if (item.customMap && item.customMap.has(`custom_selected_title`)) { //有选中项，设置自定义标题
                    OmniToast.showText({ msg: `自定义双列标题为：${item.customMap.get(`custom_selected_title`)}` })
                    return new OmniFilterCustomMenuTitle(item.customMap.get(`custom_selected_title`)!.toString(), true)
                  }
                }
                if (index == 2) {
                  if (item.selectedListWithoutUnlimit().length > 0) { //有选中项，设置自定义标题
                    OmniToast.showText({ msg: `自定义三列标题为：自定义3` })
                    return new OmniFilterCustomMenuTitle(`自定义3`, true)
                  }
                }
                return undefined
              }
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