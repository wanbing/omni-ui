import { OmniDialog } from "@omni-ui/omni_component"
import { OmniDialogController } from "@omni-ui/omni_component/src/main/ets/components/dialog/OmniDialog"
import { OmniCustomDialog } from "@omni-ui/omni_component/src/main/ets/components/dialog/OmniDialogBuilder"
import { OmniToast } from "@omni-ui/omni_component/src/main/ets/components/toast/OmniToast"

@Builder
export function DialogEntryPageBuilder() {
  DialogEntryPage()
}

@Entry
@Component
struct DialogEntryPage {
  private dialog: OmniDialog = new OmniDialog(this.getUIContext())

  build() {
    NavDestination() {
      Scroll() {
        Column({ space: 15 }) {
          Button('单个按钮').onClick(() => {
            this.dialog.show({
              titleArgs: { value: '标题' },
              contentArgs: { value: '文案文案文案文案文案文案文案文案文案文案文案文案' },
              leftButtonArgs: { value: '确定', fontStyle: { color: 0x4086f1 } },
              onLeftButtonClick: () => {
                this.dialog.dismiss()
                OmniToast.showText({ msg: '点击确定' })
              },
              dialogDivider: { margin: { left: 8, right: 8 } }
            })
          })
          Button('两个按钮').onClick(() => {
            this.dialog.show({
              titleArgs: { value: '标题' },
              contentArgs: { value: '这是正文内容' },
              leftButtonArgs: { value: '取消', fontStyle: { color: 0x303030 } },
              onLeftButtonClick: () => {
                this.dialog.dismiss()
                OmniToast.showText({ msg: '点击取消' })
              },
              rightButtonArgs: {
                value: '确定',
                fontStyle: { color: Color.White, font: { weight: FontWeight.Bold, size: 20 } },
                backgroundColor: 0x3b82f1,
                border: { radius: { bottomRight: 10 } }
              },
              onRightButtonClick: () => {
                this.dialog.dismiss()
                OmniToast.showText({ msg: '点击确定' })
              }
            })
          })
          Button('自定义标题').onClick(() => {
            this.dialog.show({
              titleBuilder: myTitleBuilder,
              contentArgs: { value: '文案文案文案文案文案文案文案文案文案文案文案文案' },
              rightButtonArgs: {
                value: '我知道了',
                fontStyle: { color: 0x4086f1 },
              },
              onRightButtonClick: () => {
                this.dialog.dismiss()
                OmniToast.showText({ msg: '点击我知道了' })
              }
            })
          })
          Button('自定义内容').onClick(() => {
            this.dialog.show({
              titleArgs: { value: '标题标题标题hello这是标题' },
              rightButtonArgs: {
                value: '我知道了',
                fontStyle: { color: 0x4086f1 },
              },
              onRightButtonClick: () => {
                this.dialog.dismiss()
                OmniToast.showText({ msg: '点击我知道了' })
              },
              contentBuilder: this.myContentBuilder,
            })
          })
          Button('自定义按钮').onClick(() => {
            this.dialog.show({
              titleArgs: { value: '标题标题标题hello这是标题' },
              contentArgs: { value: '这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容' },
              buttonBuilder: myButtonBuilder,
            })
          })
          OmniCustomDialog({
            titleArgs: { value: '组件调用方式' },
            contentArgs: {
              value: '组件调用方式组件调用方式组件调用方式'
            },
            dialogBorder: { width: 2, radius: 6, color: 0x333333 },
            rightButtonArgs: {
              value: '我知道了',
              fontStyle: { color: 0x4086f1 },
            },
          })
        }
      }
    }
    .title('Dialog示例')
  }

  @Builder
  myContentBuilder() {
    Column({ space: 10 }) {
      Text('多行内容')
      Text('这是第二行')
        .backgroundColor(0xeb4e27)
      Text('这是第三行')
    }.width('80%')
    .backgroundColor(0x5abe43)
    .borderRadius(6)
  }
}

@Builder
function myTitleBuilder() {
  Row() {
    Image('https://pic4.58cdn.com.cn/nowater/frs/n_v3d872cbc54d6d4c6ba1a2112513928d7c.png')
      .size({ width: 30, height: 30 })
    Text('这是标题')
      .font({
        weight: FontWeight.Bold,
        size: 20
      })
      .fontColor(0xFF333333)
      .padding(10)
    Image('https://pic4.58cdn.com.cn/nowater/frs/n_v3d872cbc54d6d4c6ba1a2112513928d7c.png')
      .size({ width: 30, height: 30 })
  }.alignItems(VerticalAlign.Center)
  .justifyContent(FlexAlign.Center)
}

@Builder
function myButtonBuilder(controller?: OmniDialogController) {
  Column() {
    Divider()
      .vertical(false)
      .strokeWidth(0.5)
      .color(0x99999999)
    Text('选项一')
      .textAlign(TextAlign.Center)
      .fontColor(0xFF333333)
      .fontSize(20)
      .padding(10)
      .onClick(() => {
        controller?.dismiss()
        OmniToast.showText({ msg: '点击了选项一' })
      })
      .width('100%')
    Divider()
      .vertical(false)
      .strokeWidth(0.5)
      .color(0x99999999)
    Text('选项二')
      .textAlign(TextAlign.Center)
      .fontColor(0xFF333333)
      .fontSize(20)
      .padding(10)
      .onClick(() => {
        controller?.dismiss()
        OmniToast.showText({ msg: '点击了选项二' })
      })
      .width('100%')
    Divider()
      .vertical(false)
      .strokeWidth(0.5)
      .color(0x99999999)
    Text('选项三')
      .textAlign(TextAlign.Center)
      .fontColor(0xFF333333)
      .fontSize(20)
      .padding(10)
      .onClick(() => {
        controller?.dismiss()
        OmniToast.showText({ msg: '点击了选项三' })
      })
      .width('100%')
  }
}