import { ListDataModel, OmniAnchor, OmniSummary, OmniAnchorMode } from "@omni-ui/omni_component"
import { BaseInfoItem, mockBaseInfo, mockQuestions, QuestionItem } from "./AnchorMockData"

//实际使用时，集成基础的anchor list数据模型，然后扩展自身的model即可
interface RealListDataWithAnchor extends ListDataModel {
  anchorTag: string
  title: string
  listData?: string[]
  type: string
  extraData?: string | undefined
}

@Builder
export function OmniAnchorExamplePageBuilder() {
  OmniAnchorExamplePage()
}

@Component
struct OmniAnchorExamplePage {
  private mockListData: RealListDataWithAnchor[] =
    [{
      type: 'summary',
      anchorTag: '概览',
      title: '概览',
      listData: ['qweqweqweqe', 'qweqweqwew'],
      extraData: 'extraData',
    }, {
      type: 'tags',
      anchorTag: '标签',
      title: '标签',
    }, {
      type: 'community',
      anchorTag: '小区',
      title: '小区',
    },
      {
        type: 'map',
        anchorTag: '地图',
        title: '地图',
      }, {
        type: 'question',
        anchorTag: '问答',
        title: '问答',
      },
      {
        type: 'simillar',
        anchorTag: '相似房源',
        title: '相似房源',
      }, {
        type: 'recommend',
        anchorTag: '推荐房源',
        title: '推荐房源',
      }]

  @Builder
  itemListBuilder(listData: ListDataModel[]) {
    ForEach(listData, (item: ListDataModel) => {
      ListItem() {
        if ((item as RealListDataWithAnchor).type === 'summary') {
          Column() {
            Text('房源概览')
              .fontWeight(FontWeight.Bold)
              .fontSize(28)
              .fontColor('#1F2326')
              .margin({
                bottom: 20
              })

            OmniSummary({
              config: {
                countPerRow: 4,
                items: [
                  {
                    title: '小区',
                    images: [
                      "https://gips0.baidu.com/it/u=567323913,331130417&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f1000_1000",
                      "https://gips0.baidu.com/it/u=567323913,331130417&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f1000_1000",
                      "https://gips0.baidu.com/it/u=567323913,331130417&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f1000_1000",
                      "https://gips0.baidu.com/it/u=567323913,331130417&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f1000_1000",
                      "https://gips0.baidu.com/it/u=567323913,331130417&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f1000_1000",
                      "https://gips0.baidu.com/it/u=567323913,331130417&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f1000_1000",
                      "https://gips0.baidu.com/it/u=567323913,331130417&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f1000_1000",
                      "https://gips0.baidu.com/it/u=567323913,331130417&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f1000_1000",
                      "https://gips0.baidu.com/it/u=567323913,331130417&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f1000_1000"
                    ]
                  },
                  {
                    title: '周边',
                    images: [
                      "https://gips1.baidu.com/it/u=772552883,3754343145&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f800_600",
                      "https://gips1.baidu.com/it/u=772552883,3754343145&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f800_600",
                      "https://gips1.baidu.com/it/u=772552883,3754343145&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f800_600",
                      "https://gips1.baidu.com/it/u=772552883,3754343145&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f800_600",
                      "https://gips1.baidu.com/it/u=772552883,3754343145&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f800_600",
                      "https://gips1.baidu.com/it/u=772552883,3754343145&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f800_600",
                      "https://gips1.baidu.com/it/u=772552883,3754343145&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f800_600",
                      "https://gips1.baidu.com/it/u=772552883,3754343145&fm=3028&app=3028&f=JPEG&fmt=auto&q=100&size=f800_600"
                    ]
                  },
                  {
                    title: '室内',
                    images: [
                      "http://gips3.baidu.com/it/u=3660856539,3077947179&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                      "http://gips3.baidu.com/it/u=3660856539,3077947179&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                      "http://gips3.baidu.com/it/u=3660856539,3077947179&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",

                    ]
                  },
                  {
                    title: '附近',
                    images: [
                      "http://gips3.baidu.com/it/u=3660856539,3077947179&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                      "http://gips3.baidu.com/it/u=3660856539,3077947179&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                      "http://gips3.baidu.com/it/u=3660856539,3077947179&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                      "http://gips3.baidu.com/it/u=3660856539,3077947179&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                    ]
                  }
                ]
              },
              onItemClick: (() => {
              })
            })
          }.alignItems(HorizontalAlign.Start)
          .padding({
            top: 50,
            left: 15,
            right: 15
          })

        } else if ((item as RealListDataWithAnchor).type === 'map') {
          Column() {
            Text('小区地图')
              .fontWeight(FontWeight.Bold)
              .fontSize(28)
              .fontColor('#1F2326')
              .margin({
                bottom: 20,
              })
              .padding({
                left: 15,
                right: 15
              })

            Image('http://gips0.baidu.com/it/u=1490237218,4115737545&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=720')
              .width('100%')
              .height(285)
          }.alignItems(HorizontalAlign.Start)

        } else if ((item as RealListDataWithAnchor).type === 'tags') {
          Column() {
            Text('房源亮点')
              .fontWeight(FontWeight.Bold)
              .fontSize(28)
              .fontColor('#1F2326')
              .margin({
                bottom: 20
              })

            Flex({ wrap: FlexWrap.Wrap, }) {
              ForEach(mockBaseInfo, (item: BaseInfoItem) => {
                Row() {
                  Text(item.title ?? '')
                    .fontSize(item.textSize ?? '12')
                    .fontColor(item.textColor ?? '#6884A5')
                }.backgroundColor(item.color ?? '#0f2588D4')
                .borderRadius(item.borderRadius ?? '3')
                .padding({
                  left: 8.5,
                  right: 8.5,
                  top: 4.5,
                  bottom: 4.5
                }).margin({
                  top: 8,
                  right: 8
                })
              })
            }.width('100%').padding({
              right: 20,
              bottom: 20
            })
          }.alignItems(HorizontalAlign.Start)
          .padding({
            left: 15,
            right: 15
          })
        } else if ((item as RealListDataWithAnchor).type === 'community') {
          Column() {
            Row() {
              Text('小区·雪梨澳乡')
                .fontColor('#1F2326')
                .fontWeight(FontWeight.Bold)
                .fontSize(20)

              Row() {
                Text('小区详情')
                  .fontColor('#517A99')
                  .fontSize(14)

                Image($r('app.media.ic_arrow_right'))
                  .width(14)
                  .height(14)
              }

            }.margin({
              bottom: 20
            })
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)

            Row() {
              Column() {
                Row() {
                  Image($r('app.media.ic_highlight'))
                    .width(14)
                    .height(14)
                  Column() {
                    Text('综合测评8.4分')
                      .fontColor('#333333')
                      .fontSize(13)

                    Text('教育配套丰富、交通便利')
                      .fontColor('#666666')
                      .fontSize(12)
                      .margin({ top: 10 })
                  }.alignItems(HorizontalAlign.Start)
                  .margin({
                    left: 5
                  })
                }.alignItems(VerticalAlign.Top)

                Row() {
                  Image($r('app.media.ic_highlight'))
                    .width(14)
                    .height(14)
                  Column() {
                    Text('本周平均4人抢一套房')
                      .fontColor('#333333')
                      .fontSize(13)

                    Text('客多房少、房源紧缺')
                      .fontColor('#666666')
                      .fontSize(12)
                      .margin({ top: 10 })
                  }.alignItems(HorizontalAlign.Start)
                  .margin({
                    left: 5
                  })
                }.alignItems(VerticalAlign.Top)
                .margin({
                  top: 15
                })
              }

              Image('http://gips0.baidu.com/it/u=4248708052,2809939788&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=720')
                .width(120)
                .height(90)
                .borderRadius(6)

            }
            .margin({
              bottom: 20
            })
            .width('100%')
            .height(90)
            .justifyContent(FlexAlign.SpaceBetween)

            Row() {
              Text('同小区1室1厅600元/月起')
                .textAlign(TextAlign.Center)
                .fontSize(15)
                .fontColor('#517A99')

              Image($r('app.media.ic_arrow_right'))
                .width(14)
                .height(14)
            }
            .alignItems(VerticalAlign.Center)
            .justifyContent(FlexAlign.Center)
            .width('100%')
            .margin({
              bottom: 20
            })
            .height(44)
            .backgroundColor('#F7F8FA')
            .borderRadius(6)
          }
          .alignItems(HorizontalAlign.Start)
          .padding({
            top: 15,
            left: 15,
            right: 15,
            bottom: 15
          })
        } else if ((item as RealListDataWithAnchor).type === 'question') {
          Column() {
            Text(mockQuestions.title ?? '')
              .fontWeight(FontWeight.Bold)
              .fontSize(28)
              .fontColor('#1F2326')
              .margin({
                bottom: 20
              })
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(mockQuestions.questions, (item: QuestionItem) => {
                Text(item.title)
                  .padding({
                    left: 12,
                    right: 12,
                    top: 7.5,
                    bottom: 7.5
                  })
                  .backgroundColor('#F7F8FA')
                  .fontSize(13)
                  .fontColor('#517A99')
                  .textAlign(TextAlign.Center)
                  .borderRadius(14)
                  .margin({
                    right: 10,
                    bottom: 10
                  })
              })
            }
          }.alignItems(HorizontalAlign.Start)
          .padding({
            top: 20,
            left: 15,
            right: 15,
            bottom: 20
          })
        } else if ((item as RealListDataWithAnchor).type === 'simillar') {
          OmniSummary({
            config: {
              countPerRow: 4,
              items: [
                {
                  title: '相似房源',
                  images: [
                    "http://gips0.baidu.com/it/u=4248708052,2809939788&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=720",
                    "http://gips0.baidu.com/it/u=4248708052,2809939788&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=720",
                    "http://gips0.baidu.com/it/u=4248708052,2809939788&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=720",
                    "http://gips0.baidu.com/it/u=4248708052,2809939788&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=720",
                    "http://gips0.baidu.com/it/u=4248708052,2809939788&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=720",
                    "http://gips0.baidu.com/it/u=4248708052,2809939788&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=720",
                    "http://gips0.baidu.com/it/u=4248708052,2809939788&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=720",
                    "http://gips0.baidu.com/it/u=4248708052,2809939788&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=720",
                    "http://gips0.baidu.com/it/u=4248708052,2809939788&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=720"
                  ]
                }
              ]
            },
            onItemClick: (() => {
            })
          })
            .padding({
              top: 50,
              left: 15,
              right: 15
            })
        } else if ((item as RealListDataWithAnchor).type === 'recommend') {
          OmniSummary({
            config: {
              countPerRow: 4,
              items: [
                {
                  title: '推荐房源',
                  images: [
                    "http://gips2.baidu.com/it/u=1192674964,3939660937&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                    "http://gips2.baidu.com/it/u=1192674964,3939660937&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                    "http://gips2.baidu.com/it/u=1192674964,3939660937&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                    "http://gips2.baidu.com/it/u=1192674964,3939660937&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                    "http://gips2.baidu.com/it/u=1192674964,3939660937&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                    "http://gips2.baidu.com/it/u=1192674964,3939660937&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                    "http://gips2.baidu.com/it/u=1192674964,3939660937&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                    "http://gips2.baidu.com/it/u=1192674964,3939660937&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960",
                    "http://gips2.baidu.com/it/u=1192674964,3939660937&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960"
                  ]
                }
              ]
            },
            onItemClick: (() => {
            })
          }).padding({
            top: 50,
            left: 15,
            right: 15
          })
        }
      }
    })
  }

  build() {
    NavDestination() {
      OmniAnchor({
        mode: OmniAnchorMode.Scrollable,
        listDataWithAnchor: this.mockListData,
        listBuilder: this.itemListBuilder
      })
    }.title('Anchor示例')
  }
}