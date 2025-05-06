import { OmniTabConfig, OmniTabController, OmniTabItemConfig, OmniTabMode, OmniTabs } from "@omni-ui/omni_component"
import { OmniToast } from "@omni-ui/omni_component/src/main/ets/components/toast/OmniToast"

@Builder
export function OmniTabExamplePageBuilder() {
  OmniTabExamplePage()
}

@Component
export struct OmniTabExamplePage {
  private tabCtrl = new OmniTabController()
  private tabConfig: OmniTabConfig = {
    mode: OmniTabMode.Scrollable,
    labelColor: '#0090ff'
  }
  private tabConfig1: OmniTabConfig = {
    mode: OmniTabMode.Fix,
    labelColor: '#ff552e',
    indicatorColor: '#ff552e'
  }
  @State
  tabs: OmniTabItemConfig[] = [
    new OmniTabItemConfig("tab0"),
    new OmniTabItemConfig("tab1", "", $r('app.media.tag_heart_fill'), ""),
    new OmniTabItemConfig("tab2", "", "", "", true),
    new OmniTabItemConfig("tab3", "", "", $r('app.media.tag_heart')),
    new OmniTabItemConfig("tab4"),
    new OmniTabItemConfig("tab5"),
    new OmniTabItemConfig("tab6"),
    new OmniTabItemConfig("tab7"),
  ]


  build() {
    NavDestination() {
      Column() {
        OmniTabs({
          tabs: this.tabs,
          tabConfig: this.tabConfig,
          onTabClick: (index: number) => {
            OmniToast.showText({
              msg: `click tab ${index}`
            })
          }
        })

        OmniTabs({
          tabs: this.tabs,
          tabConfig: this.tabConfig1,
          tabController: this.tabCtrl
        })
          .margin({
            top: 20
          })

        Button('Tab改变index')
          .margin({
            top: 30
          })
          .onClick(() => {
            this.tabCtrl.changeIndex(3)
          })

        Button('添加小红点')
          .margin({
            top: 20
          })
          .onClick(() => {
            this.tabs[0].badgeText = "New"
          })
        Button('取消小红点')
          .margin({
            top: 20
          })
          .onClick(() => {
            this.tabs[0].badgeText = ""
          })

      }
      .height('100%')
      .width('100%')
    }
    .title('Tabs示例')

  }

  onDidBuild(): void {

  }

}