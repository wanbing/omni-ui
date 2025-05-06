import { OmniTag, TagItemInfo, TagMode } from '@omni-ui/omni_component'
import { LengthMetrics } from '@kit.ArkUI';

@Builder
export function TagEntryPageBuilder() {
  TagEntryPage()
}

@Entry
@Component
struct TagEntryPage {
  @State tagItems: TagItemInfo[] = [
    new TagItemInfo({
      icons: {
        left: {
          icon: $r('app.media.tag_heart'),
          iconSize: { width: 13, height: 13 }
        },
      },
    }),
    new TagItemInfo({ title: '第一个tag选中改变图标' }),
    new TagItemInfo({ title: '纯文本tag' }),
    new TagItemInfo({
      title: '文本左边带icon',
      icons: {
        left: { icon: $r('app.media.tag_heart') }
      }
    }),
    new TagItemInfo({
      title: '文本右边带icon',
      icons: {
        right: { icon: $r('app.media.tag_heart') }
      }
    }),
    new TagItemInfo({
      title: '文本上边带icon',
      icons: {
        top: { icon: $r('app.media.tag_heart') }
      }
    }),
    new TagItemInfo({
      title: '文本下边带icon',
      icons: {
        bottom: { icon: $r('app.media.tag_heart') }
      }
    }),
    new TagItemInfo({
      title: '文本上下左右都带icon',
      icons: {
        left: { icon: $r('app.media.tag_heart') },
        right: { icon: $r('app.media.tag_heart') },
        top: { icon: $r('app.media.tag_heart') },
        bottom: { icon: $r('app.media.tag_heart') },
      }
    }),
    new TagItemInfo({
      title: '每个icon大小可独立设置',
      icons: {
        left: { icon: $r('app.media.tag_heart'), iconSize: { width: 20, height: 20 } },
        right: { icon: $r('app.media.tag_heart'), iconSize: { width: 8, height: 8 } },
        top: { icon: $r('app.media.tag_heart'), iconSize: { width: 12, height: 12 } },
        bottom: { icon: $r('app.media.tag_heart') },
      }
    }),
    new TagItemInfo({
      title: '单独设置某一tag样式',
      tagStyle: {
        backgroundColor: 0xb4e7ad,
        selectedBackgroundColor: 0x33ff552e,
        fontSize: 14,
        itemBorder: { width: 2, color: Color.Black, radius: 10 }
      },
    })]
  @State tagItems1: TagItemInfo[] = [
    new TagItemInfo({ title: '纯文本tag' }),
    new TagItemInfo({ title: '纯文本tag11' }),
    new TagItemInfo({ title: '纯文本tag' }),
    new TagItemInfo({ title: '纯文本tag12' }),
    new TagItemInfo({ title: '纯文本tag' }),
    new TagItemInfo({ title: '纯文本tag' }),
  ]

  build() {
    NavDestination() {
      Scroll() {
        Column() {
          Text('示例一：水平滑动布局Tag')
            .fontSize(20)
            .width('100%')
            .margin({ top: 20, bottom: 20, left: 25 })
          Stack() {
            OmniTag({
              tagItems: this.tagItems,
              horizontalSpace: 10,
              style: {
                itemPadding: {
                  left: 12,
                  right: 12,
                  top: 7,
                  bottom: 7
                },
                backgroundColor: 0xF8F8F8,
                selectedBackgroundColor: 0xFFEFEB,
                itemBorder: { radius: 3 },
                fontColor: 0x333333,
                selectedFontColor: 0xff552e,
                fontSize: 12
              },
              onItemClick: (item: TagItemInfo, index: number) => {
                if (index == 0) {
                  let isSelected = item.isSelected
                  item.icons = {
                    left: {
                      icon: isSelected ? $r('app.media.tag_heart_fill') : $r('app.media.tag_heart'),
                      iconSize: { width: 13, height: 13 }
                    },
                  }
                }
              },
            }).margin({ left: 15 })
              .padding({ right: 20 })

            Rect({ width: 50, height: 50 })
              .fill(Color.Transparent)
              .enabled(false)
              .linearGradient({
                direction: GradientDirection.Left,
                colors: [['rgba(255, 255, 255, 1.0)', 0.0], ['rgba(255, 255, 255, 0.5)', 0.7],
                  ['rgba(255, 255, 255, 0.0)', 1.0]],
                repeating: false
              })
          }.alignContent(Alignment.End)

          Text('示例二：水平滑动布局Tag（不可点击）')
            .fontSize(20)
            .width('100%')
            .margin({ top: 40, bottom: 20, left: 25 })
          OmniTag({
            tagItems: this.tagItems,
            selectable: false,
            style: {
              fontSize: 12,
              textMargin: { top: 8, bottom: 8 },
              backgroundColor: 0xF8F8F8,
              fontColor: 0x1F2326,
              itemPadding: {
                left: 10,
                right: 10,
                top: 8,
                bottom: 8
              }
            }
          })
            .margin({
              top: 15,
              bottom: 20,
            })
          Text('示例三：流式布局Tag')
            .fontSize(20)
            .width('100%')
            .margin({ top: 40, bottom: 20, left: 25 })
          OmniTag({
            tagItems: this.tagItems,
            mode: TagMode.FLEX,
            style: {
              fontSize: 12,
              fontColor: 0x6884A5,
              textMargin: { left: 4, right: 4 },
              backgroundColor: 0x249DB8D7,
              itemBorder: { radius: 3 },
              itemPadding: {
                left: 10,
                right: 10,
                top: 3,
                bottom: 3
              },
            },
            flexSpace: { main: LengthMetrics.vp(8), cross: LengthMetrics.vp(8) }
          })
            .margin({
              left: 20,
              top: 10,
              right: 13,
              bottom: 8
            })
          Text('示例四：固定tag大小')
            .fontSize(20)
            .width('100%')
            .margin({ top: 40, bottom: 20, left: 25 })
          OmniTag({
            tagItems: this.tagItems1,
            mode: TagMode.FLEX,
            style: {
              fontSize: 12,
              fontColor: 0x6884A5,
              backgroundColor: 0x249DB8D7,
              itemBorder: { radius: 3 },
              itemPadding: {
                left: 10,
                right: 10,
                top: 3,
                bottom: 3
              },
              itemSize: { width: 100, height: 30 }
            },
            flexSpace: { main: LengthMetrics.vp(8), cross: LengthMetrics.vp(8) }
          })
            .margin({
              left: 20,
              top: 10,
              right: 13,
              bottom: 8
            })
        }.justifyContent(FlexAlign.Center)
      }
    }.title('Tag示例')
  }
}