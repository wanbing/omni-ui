import { OmniFilterBar, OmniPageLoading } from "@omni-ui/omni_component";
import {
  OmniFilterDataRoot,
  OmniFilterItemBean
} from "@omni-ui/omni_component/src/main/ets/components/filterbar/bean/OmniFilterItemBean";
import { OmniTheme, OmniThemeStyle } from "@omni-ui/omni_component/src/main/ets/theme/OmniTheme";
import { util } from "@kit.ArkTS";
import { OmniFilterController } from "@omni-ui/omni_component/src/main/ets/components/filterbar/OmniFilterBar";

@Builder
export function OmniThemeDemoPageBuilder() {
  OmniThemeDemoPage()
}

@Entry
@Component
struct OmniThemeDemoPage {
  @Consume('pathStack') pathStack: NavPathStack;
  @State filterDataRoot?: OmniFilterDataRoot = undefined
  private filterController: OmniFilterController = new OmniFilterController()
  colorText: string = '#44C2FF';
  @StorageLink(OmniTheme.KEY)
  baseStyle: OmniThemeStyle = OmniTheme.getDefaultStyle()

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
        ThemeSection({ title: `修改主题颜色` }) {
          Row() {
            TextInput({ placeholder: '输入色值，如:#ff552e', text: this.colorText })
              .fontSize(12)
              .layoutWeight(1)
              .margin({
                left: 10,
              })
              .onChange(value => {
                this.colorText = value
              })
            Column() {
              Button(`确定`)
                .backgroundColor(this.baseStyle.primary)
                .onClick(() => {
                  OmniTheme.setThemeStyle({
                    primary: this.colorText
                  })
                })
              Button(`重置`)
                .onClick(() => {
                  OmniTheme.setThemeStyle({
                    primary: OmniTheme.getDefaultStyle().primary
                  })
                })
                .margin({
                  top: 10,
                })
            }
            .margin({
              left: 10,
              right: 10
            })
          }
        }

        //筛选+Theme示例
        ThemeSection({ title: `筛选` }) {
          if (this.filterDataRoot) {
            OmniFilterBar(
              {
                filterDataRoot: this.filterDataRoot,
                filterController: this.filterController,
              }
            )
          }
        }

        //Loading+Theme示例
        ThemeSection({ title: `Loading` }) {
          OmniPageLoading()
        }

      }
      .alignItems(HorizontalAlign.Start)
      .height('100%')
      .width('100%')
    }
    .title('主题示例')
    .onWillDisappear(() => {
      this.filterController.close()
    })
  }
}

@Component
struct ThemeSection {
  title?: string
  @Require @BuilderParam defaultBuilder: CustomBuilder
  @StorageLink(OmniTheme.KEY)
  baseStyle: OmniThemeStyle = OmniTheme.getDefaultStyle()

  build() {
    Column() {
      Text(this.title)
        .fontSize(this.baseStyle.fontSizeLg)
        .margin({
          bottom: 10
        })
        .textAlign(TextAlign.Start)
        .fontColor(Color.Gray)
      if (typeof this.defaultBuilder === 'function') {
        this.defaultBuilder()
      }
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .padding({
      left: 10,
      top: 10,
      bottom: 10
    })
  }
}