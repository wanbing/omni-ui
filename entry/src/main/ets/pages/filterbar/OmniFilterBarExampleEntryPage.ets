@Builder
export function OmniFilterBarExampleEntryPageBuilder() {
  OmniFilterBarExampleEntryPage()
}

@Entry
@Component
struct OmniFilterBarExampleEntryPage {
  @Consume('pathStack') pathStack: NavPathStack;

  aboutToAppear(): void {

  }

  build() {
    NavDestination() {
      Column() {
        Button(`多列示例`)
          .onClick(() => {
            this.pathStack.pushPath({ name: 'OmniFilterBarMultiListExamplePage' })
          })
        Button(`网格示例`)
          .onClick(() => {
            this.pathStack.pushPath({ name: 'OmniFilterBarMultiGridExamplePage' })
          })
          .margin({ top: 10 })
        Button(`更多示例`)
          .onClick(() => {
            this.pathStack.pushPath({ name: 'OmniFilterBarMoreExamplePage' })
          })
          .margin({ top: 10 })
        Button(`自定义类型示例`)
          .onClick(() => {
            this.pathStack.pushPath({ name: 'OmniFilterBarCustomExamplePage' })
          })
          .margin({ top: 10 })
        Button(`自定义Menu示例`)
          .onClick(() => {
            this.pathStack.pushPath({ name: 'OmniFilterBarMenuCustomExamplePage' })
          })
          .margin({ top: 10 })
        Button(`自定义样式`)
          .onClick(() => {
            this.pathStack.pushPath({ name: 'OmniFilterBarStyleCustomExamplePage' })
          })
          .margin({ top: 10 })
      }
      .height('100%')
      .width('100%')
    }
    .title('筛选示例入口')

  }

  @Builder
  Title() {
    Text('筛选示例')
  }
}
