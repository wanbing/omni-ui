import {
  OmniPullToRefreshLayout,
  OmniPullableController,
  OmniRefreshLayoutConfig,
  OmniPullDown,
  OmniPullStatus
} from "@omni-ui/omni_component"

@Builder
export function OmniPullableExamplePageBuilder() {
  OmniPullableExamplePage()
}

interface ListData {
  header: Array<string>,
  list: Array<ListItemData>
}

interface ListItemData {
  pic: string,
  title: string,
  subTitle: string,
  price: string
}
@Component
export struct OmniPullableExamplePage {
  public controller: OmniPullableController = new OmniPullableController()
  private config: OmniRefreshLayoutConfig = new OmniRefreshLayoutConfig();
  @State listData: ListData = {header: [], list: []};
  @State pullDown: OmniPullDown | undefined = undefined
  scroller: Scroller = new Scroller()

  aboutToAppear(): void {
    this.listData = {
      header: [
        "https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00640-95.jpg",
        "https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00096-2332.jpg",
        "https://img1.baidu.com/it/u=1368617812,1664844054&fm=253&fmt=auto&app=138&f=JPEG?w=1067&h=800",
        "https://img2.baidu.com/it/u=2661147652,2128388744&fm=253&fmt=auto&app=120&f=JPEG?w=667&h=500",
        "https://img1.baidu.com/it/u=3240323594,3609184659&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=656",
        "https://img2.baidu.com/it/u=2162415424,3314979473&fm=253&fmt=auto&app=138&f=JPEG?w=1067&h=800",
        "https://img2.baidu.com/it/u=1998741076,1501229533&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1067"
      ],
      list: [{
        pic: "https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00640-95.jpg",
        title: "整租|和谐家园梅园6号三室一厅",
        price: "4000元/月",
        subTitle: "距离地铁近，精装房"
      },
        {
          pic: "https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00096-2332.jpg",
          title: "合租|中上美家次卧带阳台",
          price: "2100元/月",
          subTitle: "拎包入住，距离地铁近，精装，可以养宠物"
        },
        {
          pic: "https://img1.baidu.com/it/u=1368617812,1664844054&fm=253&fmt=auto&app=138&f=JPEG?w=1067&h=800",
          title: "整租|环铁三号院高楼层两室一厅",
          price: "6200元/月",
          subTitle: "距离地铁近，精装房"
        },
        {
          pic: "https://img2.baidu.com/it/u=2661147652,2128388744&fm=253&fmt=auto&app=120&f=JPEG?w=667&h=500",
          title: "整租|南华家园四区两室一厅",
          price: "5100元/月",
          subTitle: "距离地铁近，精装房"
        },
        {
          pic: "https://img1.baidu.com/it/u=3240323594,3609184659&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=656",
          title: "整租|樱花街46号旭辉奥都三室一厅",
          price: "5000元/月",
          subTitle: "距离地铁近，精装房"
        },
        {
          pic: "https://img2.baidu.com/it/u=2162415424,3314979473&fm=253&fmt=auto&app=138&f=JPEG?w=1067&h=800",
          title: "合租|世纪佳缘次卧带阳台",
          price: "1800元/月",
          subTitle: "距离地铁近，精装房，近小区"
        },
        {
          pic: "https://img2.baidu.com/it/u=1998741076,1501229533&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1067",
          title: "合租|世纪名流三苑46号楼次卧带阳台",
          price: "2200元/月",
          subTitle: "距离地铁近，精装房"
        }
      ]
    }
    this.config.pullRefreshEnable = true
    this.config.loadMoreEnable = true;
  }

  build() {
    NavDestination() {
      OmniPullToRefreshLayout({
        scroller: this.scroller,
        config: this.config,
        controller: this.controller,
        viewError: () => {
          this.viewError()
        },
        viewEmpty: () => {
          this.viewEmpty()
        },
        viewNoNetwork: () => {
          this.viewNoNetwork()
        },
        viewLoading: () => {
          this.viewLoading()
        },
        contentView: () => {
          this.contentView()
        },
        onRefresh: () => {
          setTimeout(() => {
            this.controller.refreshSuccess()
          }, 1000)
        },
        onLoad: () => {
          setTimeout(() => {
            this.controller.loadSuccess(false)
          }, 1000)
        },
        onPullListener: (pullDown) => {
          this.pullDown = pullDown
        },
      }).width("100%").height("70%").clip(true)
      Row() {}.height(5);
      Text("点击下方按钮查看自定义视图")
      Row() {
        Button("LoadingView")
          .onClick((event) => {
            this.controller.viewLoading()
          }).backgroundColor(Color.Pink).width('calc(50% - 20vp)')
        Button("ErrorView")
          .onClick((event) => {
            this.controller.viewError()
          }).backgroundColor(Color.Pink).width('calc(50% - 20vp)')
      }.width('100%').height('8%').justifyContent(FlexAlign.SpaceBetween).padding(10)
      Row() {
        Button("NetWorkErrorView")
          .onClick((event) => {
            this.controller.viewNoNetwork()
          }).backgroundColor(Color.Pink).width('calc(50% - 20vp)')
        Button("NormalView")
          .onClick((event) => {
            this.controller.refreshSuccess()
          }).backgroundColor(Color.Pink).width('calc(50% - 20vp)')
      }.width('100%').height('8%').justifyContent(FlexAlign.SpaceBetween).padding(10)

      Text("点击查看行为效果")
      Row() {
        Button("refresh")
          .onClick((event) => {
            this.controller.refresh()
          }).backgroundColor(Color.Pink).width('calc(50% - 20vp)')
        Button("load")
          .onClick((event) => {
            this.controller.load()
          }).backgroundColor(Color.Pink).width('calc(50% - 20vp)')
      }.width('100%').height('8%').justifyContent(FlexAlign.SpaceBetween).padding(10)

      Text("当前状态:" + this.getStrByStatus(this.pullDown?.status))
    }.title("上下拉刷新示例").onAppear(() => {
    })
  }

  private getStrByStatus(status: OmniPullStatus) {
    switch (status) {
      case OmniPullStatus.PullDown:
        return "下拉中"
      case OmniPullStatus.PreRefresh:
        return "准备刷新"
      case OmniPullStatus.Refresh:
        return "刷新中"
      case OmniPullStatus.RefreshSuccess:
        return "刷新成功"
      case OmniPullStatus.RefreshError:
        return "刷新失败"
      case OmniPullStatus.PullUp:
        return "上拉中"
      case OmniPullStatus.PreLoad:
        return "准备加载"
      case OmniPullStatus.Load:
        return "加载中"
      case OmniPullStatus.LoadSuccess:
        return "加载成功"
      case OmniPullStatus.LoadError:
        return "加载失败"
      default:
        return "默认"
    }
  }

  @Builder
  viewLoading() {
    Row() {
      LoadingProgress().width(45).height(45)
      Text("加载中(支持自定义视图)")
    }
  }

  @Builder
  naviMenu() {
    Row() {
      LoadingProgress().width(45).height(45)
      Text("加载中(支持自定义视图)")
    }
  }


  @Builder
  viewEmpty() {
    Text("空视图(支持自定义视图)")
  }

  @Builder
  viewError() {
    Text("加载失败(支持自定义视图)")
  }

  @Builder
  viewNoNetwork() {
    Text("无网络(支持自定义视图)")
  }

  @Builder
  contentView() {
    List({ scroller: this.scroller }) {
      ListItem() {
        Swiper() {
          ForEach(this.listData.header, (url: string) => {
            Image(url).width('100%').height(160)
          }, (item: string) => item)
        }.indicator(DigitIndicator.dot().color(Color.White).selectedColor(Color.Red))
      }

      ForEach(this.listData.list, (item: ListItemData, index) => {
        ListItem() {
          Row() {
            Image(item.pic).width(60).height(60).backgroundColor(Color.Blue)
            Column() {
              Text(item.title)
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .textOverflow({overflow: TextOverflow.Ellipsis})
                .maxLines(1)
                .width('100%')
                .textAlign(TextAlign.Start)
              Text(item.price)
                .width('100%')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .fontColor(Color.Red)
              Text(item.subTitle)
                .width('100%')
                .fontSize(14)
                .fontColor(Color.Gray)
            }.margin(10).height(60).justifyContent(FlexAlign.SpaceBetween)
          }.width('100%').height(80).margin(10).backgroundColor(Color.White)
        }
      }, (item: string, index) => item)
    }.width("100%").height("100%")
    .edgeEffect(EdgeEffect.None)
  }
}