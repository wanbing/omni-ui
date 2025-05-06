import { OmniGallery, OmniGalleryTabBarModifier, OmniGalleyConfig, OmniTheme } from "@omni-ui/omni_component"
import { OmniThemeStyle } from "@omni-ui/omni_component/src/main/ets/theme/OmniTheme"


@Builder
export function OmniGalleryExamplePageBuilder() {
  OmniGalleryExamplePage()
}

@Component
export struct OmniGalleryExamplePage {
  @StorageLink(OmniTheme.KEY)
  baseStyle: OmniThemeStyle = OmniTheme.getDefaultStyle()
  //这里需要定义一个与父组件变量名一致的变量，就能获取父组件同名的变量的状态，也能跟着状态刷新UI
  @State private selectedIndex: number = 0
  @State private config?: OmniGalleyConfig = undefined

  @Builder
  buildTabBarItem(title: string, length: number, index: number) {
    if (this.selectedIndex === index) {
      Column() {
        //tab text
        Text(`${title}(${length})`)
          .fontColor(this.baseStyle.primary)
          .fontWeight(FontWeight.Bold)
        //indicator
        Text()
          .width(20)
          .borderRadius(15)
          .height(3)
          .backgroundColor(this.baseStyle.primary)
      }
    } else {
      //tab text
      Text(title)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Normal)
    }
  }

  build() {
    NavDestination() {
      OmniGallery(
        {
          tabBarItemBuilder: this.buildTabBarItem,
          config: this.config,
          tabBarModifier: new OmniGalleryTabBarModifier()
            .withBarMode(BarMode.Fixed)
        }
      )

    }.title('Gallery示例')
    .onReady((context: NavDestinationContext) => {
      if (context.pathInfo.param) {
        //路由带参过来
        this.config = JSON.parse(context.pathInfo.param as string) as OmniGalleyConfig
      }
      //不带参自己构造
      if (!this.config) {
        this.config = {
          selectedIndex: 0,
          tabConfig: [
            {
              tabBarTitle: '第一项',
              tabContentData: {
                name: "随机图片随机图片随机图片随机图片随机图片随机图片",
                desc: "这里是描述描述这里是描述描述这里是描述描述这里是描述描述这里是描述描述这里是描述描述这里是描述描述这里是描述描述这里是描述描述这里是描述描述这里是描述描述这里是描述描述这里是描述描述这里是描述描述这里是描述描述这里是描述描述这里是描述描述这里是描述描述这里是描述描述这里是描述描述这里是描述描述",
                imageUrls: [
                  "https://gips0.baidu.com/it/u=567323913,331130417&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f1000_1000",
                  "https://gips1.baidu.com/it/u=772552883,3754343145&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f800_600",
                  "http://gips3.baidu.com/it/u=3660856539,3077947179&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                  "http://gips0.baidu.com/it/u=1490237218,4115737545&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=720",
                  "http://gips0.baidu.com/it/u=4248708052,2809939788&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=720",
                  "http://gips0.baidu.com/it/u=4248708052,2809939788&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=720",
                  "http://gips2.baidu.com/it/u=1192674964,3939660937&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                ]
              }
            },
            {
              tabBarTitle: '第二项',
              tabContentData: {
                imageUrls: ['http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1508/20/c0/11483087_1440080502911_800x600.jpg']
              }
            },
            {
              tabBarTitle: '第三项',
              tabContentData: {
                imageUrls: ['http://m.360buyimg.com/mobilecms/s1600x1120_jfs/t19540/272/1542853502/335716/5ef8759b/5acc6c5bN988cd3d9.jpg']
              }
            },
            {
              tabBarTitle: '第四项',
              tabContentData: {
                imageUrls: ['http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1508/20/c0/11483087_1440080502911_800x600.jpg']
              }
            },
          ]
        }
      }
    })
  }
}