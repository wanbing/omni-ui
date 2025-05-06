import { Toast } from "@omni-ui/omni_component"

@Builder
export function ToastEntryPageBuilder() {
  ToastEntryPage()
}

@Entry
@Component
struct ToastEntryPage {
  @State text: string = 'onDismiss属性监听toast消失'

  build() {
    NavDestination() {
      Scroll() {
        Column({ space: 15 }) {
          Button('默认文本toast').onClick(() => {
            Toast.showText({
              msg: "默认文本toast"
            })
          })
          Button('默认成功toast').onClick(() => {
            Toast.showSuccess()
          })
          Button('成功toast带文案').onClick(() => {
            Toast.showSuccess({ msg: '成功文案' })
          })
          Button('默认错误toast').onClick(() => {
            Toast.showError()
          })
          Button('错误toast带文案').onClick(() => {
            Toast.showError({ msg: '错误文案' })
          })
          Button('默认警告toast').onClick(() => {
            Toast.showWarning()
          })
          Button('警告toast带文案').onClick(() => {
            Toast.showWarning({ msg: '警告文案' })
          })
          Button('alignment属性自定义toast位置').onClick(() => {
            Toast.showText({
              msg: 'toast位于屏幕底部',
              alignment: DialogAlignment.Bottom
            })
          })
          Button('offset属性自定义toast在对齐方式上的偏移量').onClick(() => {
            Toast.showText({
              msg: 'toast位于屏幕底部，并向上偏移50vp，向右偏移10vp',
              alignment: DialogAlignment.Bottom,
              offset: { dx: 10, dy: -50 }
            })
          })
          Button('icon属性定义toast内文本前的图标').onClick(() => {
            Toast.showText({
              msg: '自定义文本前图标',
              icon: 'https://fhlui1001.58wos.com.cn/cDazYxWcDHJ/picasso/riqinpq9__w128_h128.png'
            })
          })
          Button('duration属性自定义toast展示时间').onClick(() => {
            Toast.showText({
              msg: 'toast持续1秒',
              duration: 1000
            })
          })
          Button('theme属性自定义toast样式').onClick(() => {
            Toast.showText({
              msg: 'theme属性自定义toast样式',
              theme: {
                textColor: 0x333333,
                fontSize: 20,
                backgroundColor: 0xF7F8FB,
                borderRadius: 40,
                borderWidth: 10,
                borderColor: 0xFF500B,
                borderStyle: BorderStyle.Dotted,
                backgroundBlurStyle: BlurStyle.NONE,
                shadow: ShadowStyle.OUTER_FLOATING_MD,
                width: 300,
                height: 100,
                iconWidth: 50,
                iconHeight: 50,
              }
            })
          })
          Button(this.text).onClick(() => {
            Toast.showText({
              msg: 'toast消失后改变button文字',
              onDismiss: () => {
                this.text = 'toast消失后改变button文字'
              }
            })
          })
        }
      }
    }
    .title('Toast示例')
  }
}
