import { OmniAutoLineGrid, PairItemInfo, Toast } from "@omni-ui/omni_component"

@Builder
export function OmniAutoLineGridEntryPageBuilder() {
  OmniAutoLineGridEntryPage()
}

@Entry
@Component
struct OmniAutoLineGridEntryPage {
  @State items: PairItemInfo[] = [
    {
      singleLine: false,
      title: '姓名',
      content: '王二狗'
    },
    {
      singleLine: false,
      title: '性别',
      content: '男'
    },
    {
      singleLine: false,
      title: '出生年月',
      content: '1992/01'
    },
    {
      singleLine: false,
      title: '婚姻状态',
      content: '未婚'
    },
    {
      singleLine: true,
      title: '身份证号',
      content: '110101199201101234'
    },
    {
      singleLine: false,
      title: '身高',
      content: '172cm'
    },
    {
      singleLine: false,
      title: '体重',
      content: '70kg'
    },
    {
      singleLine: true,
      title: '联系方式',
      content: '13012345678',
      rightText: '立即联系',
      rightIcon: $r('app.media.ic_arrow_right'),
      hasRightPart: true
    },
    {
      singleLine: true,
      title: '家庭地址',
      content: '北京市北京市东城区xx街道xx小区xx楼xx单元101',
      rightText: '查看详情',
      rightIcon: $r('app.media.ic_arrow_right'),
      hasRightPart: true
    }
  ]

  @Builder
  buildRightArea() {
    Row() {
      Text('r1')
        .fontSize(10)
        .fontColor('#979B9E')
        .margin({ right: 5 })

      Text('r2')
        .fontSize(10)
        .fontColor('#0B0F12')
    }.onClick(() => {
      Toast.showText({ msg: 'Right Area Clicked' })
    })
  }

  build() {
    NavDestination() {
      Column({ space: 20 }) {
        OmniAutoLineGrid({
          items: this.items, onRightAreaClick: () => {
            Toast.showText({ msg: 'Right Area Clicked' })
          }
        }).padding({
          left: 20,
          right: 20,
          top: 16,
          bottom: 16
        })
        OmniAutoLineGrid({
          items: this.items,
          rightPartBuilder: this.buildRightArea,
        }).padding({
          left: 20,
          right: 20,
          top: 16,
          bottom: 16
        })
      }
    }.title('OmniAutoLineGrid示例')
  }
}