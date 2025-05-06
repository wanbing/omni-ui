import { OmniBottomTabBar, OmniBottomBarItem, BarTextModifier, BarSelectTextModifier, BarBadgeTextModifier, BarIconModifier,
  BarSelectedIconModifier } from "@omni-ui/omni_component"


@Builder
export function OmniBottomBarExamplePageBuilder() {
  OmniBottomBarExamplePage()
}

@Component
export struct OmniBottomBarExamplePage {
  @State barItem1: Array<OmniBottomBarItem> = [];
  @State barItem2: Array<OmniBottomBarItem> = [];
  @State barItem3: Array<OmniBottomBarItem> = [];
  aboutToAppear(): void {
    this.barItem1 = [
      {
        icon: $r('app.media.bottombar_home'),
        selectedIcon: $r('app.media.bottombar_home_selecte'),
        text: "首页",
      },
      {
        icon: $r('app.media.bottombar_read'),
        selectedIcon: $r('app.media.bottombar_read_selected'),
        text: "阅读",
        action: () => {}
      },
      {
        icon: $r('app.media.bottombar_car'),
        selectedIcon: $r('app.media.bottombar_car_selected'),
        text: "购物车",
        action: () => {}
      },
      {
        icon: $r('app.media.bottombar_mine'),
        selectedIcon: $r('app.media.bottombar_mine_selected'),
        text: "我的",
        action: () => {}
      }
    ]
    this.barItem3 = [
      {
        icon: $r('app.media.bottombar_home'),
        selectedIcon: $r('app.media.bottombar_home_selecte'),
        text: "首页",
      },
      {
        icon: $r('app.media.bottombar_read'),
        selectedIcon: $r('app.media.bottombar_home'),
        text: "阅读",
        selectedText: "自定义",
        action: () => {}
      },
      {
        icon: $r('app.media.bottombar_car'),
        selectedIcon: $r('app.media.bottombar_car_selected'),
        text: "购物车",
        action: () => {}
      },
      {
        icon: $r('app.media.bottombar_mine'),
        selectedIcon: $r('app.media.bottombar_mine_selected'),
        text: "我的",
        action: () => {}
      }
    ]

    this.barItem2 = [
      {
        icon: $r('app.media.bottombar_home'),
        selectedIcon: $r('app.media.bottombar_home_selecte'),
        text: "首页",
      },
      {
        icon: $r('app.media.bottombar_read'),
        selectedIcon: $r('app.media.bottombar_read_selected'),
        text: "阅读",
        selectedText: "看阅读",
        badgeNo: 100,
        maxBadgeNo: 99,
        action: () => {}
      },
      {
        icon: $r('app.media.bottombar_car'),
        selectedIcon: $r('app.media.bottombar_car_selected'),
        text: "购物车",
        badgeNo: 10,
        maxBadgeNo: 99,
        action: () => {}
      },
      {
        icon: $r('app.media.bottombar_mine'),
        selectedIcon: $r('app.media.bottombar_mine_selected'),
        text: "我的",
        badgeNo: 10,
        maxBadgeNo: 99,
        action: () => {}
      }
    ]





  }

  build() {
    NavDestination() {
      Scroll() {
        Column() {
          Blank().height(10)
          Text('不带角标').fontColor(Color.Gray).fontSize(22)
          OmniBottomTabBar({ data: this.barItem1}).margin({top: 10})
          Blank().height(40)
          Text('带角标 且超出设置的最大数量').fontColor(Color.Gray).fontSize(20)
          OmniBottomTabBar({ data: this.barItem2}).margin({top: 10})
          Blank().height(40)
          Text('默认选中第三个').fontColor(Color.Gray).fontSize(20)
          OmniBottomTabBar({ data: this.barItem1, defaultSelectedIndex: 2}).margin({top: 10})
          Blank().height(40)
          Text('修改角标样式').fontColor(Color.Gray).fontSize(20)
          OmniBottomTabBar({
            data: this.barItem2,
            badgeTextModifier: new BarBadgeTextModifier().withBackgroundColor(Color.Blue)
          }).margin({top: 10})
          Blank().height(40)
          Text('修改自定义选中样式').fontColor(Color.Gray).fontSize(20)
          OmniBottomTabBar({
            data: this.barItem3,
            defaultSelectedIndex: 1,
            textSelectedModifier: new BarSelectTextModifier().withFontColor(Color.Blue),
            iconSelectedModifier: new BarSelectedIconModifier().withBackgroundColor(Color.Green),
          }).margin({top: 10})
          Blank().height(40)
          Text('修改默认样式').fontColor(Color.Gray).fontSize(20)
          OmniBottomTabBar({
            data: this.barItem3.slice(0, 3),
            textModifier: new BarTextModifier().withFontColor(Color.Blue)
          }).margin({top: 10})
        }
        .width('100%').height('100%')
      }
    }.title("BottomTabBar示例").onAppear(() => {
    })
  }


}