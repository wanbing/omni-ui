import { OmniToast } from "@omni-ui/omni_component/src/main/ets/components/toast/OmniToast"
import { OmniRichText } from "@omni-ui/omni_component/src/main/ets/components/richtext/OmniRichText"


@Builder
export function OmniRichTextExamplePageBuilder() {
  OmniRichTextExamplePage()
}

const richTextTagsExample: RichTextTag[] = [
  {
    tagName: 'b',
    tagDesc: '定义粗体文本',
    tagExample: '<b>定义粗体文本</b>'
  },
  {
    tagName: 'i',
    tagDesc: '定义斜体文本',
    tagExample: '<i>定义斜体文本</i>'
  },
  {
    tagName: 'u',
    tagDesc: '定义下划线文本',
    tagExample: '<u>定义下划线文本</u>'
  },
  {
    tagName: 'em',
    tagDesc: '定义强调文本',
    tagExample: '<em>定义强调文本</em>'
  },
  {
    tagName: 'a',
    tagDesc: '定义超链接',
    tagExample: '<a href="https://www.58.com" target="_blank">定义超链接</a>'
  },
  {
    tagName: 'img',
    tagDesc: '定义图片',
    tagExample: '<img src="https://pic8.58cdn.com.cn/nowater/frs/n_v32f12a44b7b094fe993a2b66900618bc9.png"  width="100" height="100">定义图片</img>'
  },
  {
    tagName: 'div',
    tagDesc: '定义一个块级元素',
    tagExample: '<div style="font-weight: bold;font-style: italic;font-size: 16px;color: rgba(255, 0, 255, 1);">定义一个块级元素</div>'
  },
  {
    tagName: 'p',
    tagDesc: '定义一个段落',
    tagExample: '<p>定义一个段落</p>'
  },
  {
    tagName: 'h1',
    tagDesc: '定义一级标题',
    tagExample: '<h1>定义一级标题</h1>'
  },
  {
    tagName: 'h2',
    tagDesc: '定义二级标题',
    tagExample: '<h2>定义二级标题</h2>'
  },
  {
    tagName: 'h3',
    tagDesc: '定义三级标题',
    tagExample: '<h3>定义三级标题</h3>'
  },
  {
    tagName: 'h4',
    tagDesc: '定义四级标题',
    tagExample: '<h4>定义四级标题</h4>'
  },
  {
    tagName: 'h5',
    tagDesc: '定义五级标题',
    tagExample: '<h5>定义五级标题</h5>'
  },
  {
    tagName: 'h6',
    tagDesc: '定义六级标题',
    tagExample: '<h6>定义六级标题</h6>'
  },
]

@Component
export struct OmniRichTextExamplePage {
  build() {
    NavDestination() {
      Column() {
        Text('目前已支持的标签有:')
          .fontSize(24)
          .margin({ left: 16, top: 16 })
          .fontColor(Color.Black)
          .fontWeight(FontWeight.Medium)

        Blank()
          .height(20)

        List() {
          ForEach(richTextTagsExample, (item: RichTextTag) => {
            ListItem() {
              Column() {
                Text(`${item.tagName}标签`)
                  .fontSize(24)
                  .margin({ left: 16 })
                  .fontColor(Color.Black)
                  .fontWeight(FontWeight.Medium)

                Blank()
                  .height(15)

                Text(item.tagDesc)
                  .fontSize(12)
                  .margin({ left: 16 })
                  .fontColor(Color.Gray)

                Blank()
                  .height(15)

                OmniRichText({
                  htmlStr: item.tagExample,
                  onHyperLinkClickListener: (url: string) => {
                    OmniToast.showText({ msg: `click:${url}` })
                  }
                })
                  .width('100%')
              }
              .ColumnStyle()
            }
            .margin({ top: 6, bottom: 6 })
          })
        }
        .padding({ left: 16, right: 16, bottom: 70 })
      }
      .width("100%")
      .height("100%")
      .backgroundColor(0xfff1f3f5)
      .alignItems(HorizontalAlign.Start)
    }.title('RichText示例')
  }
}

@Extend(Column)
function ColumnStyle() {
  .width('100%')
  .borderRadius(24)
  .backgroundColor(Color.White)
  .alignItems(HorizontalAlign.Start)
  .padding({
    left: 12,
    right: 12,
    bottom: 12,
    top: 12
  })
}

interface RichTextTag {
  tagName: string
  tagDesc: string
  tagExample: string
}