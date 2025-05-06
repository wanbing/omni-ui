import { OmniDotLoadingView, OmniLoading, OmniPageLoading } from '@omni-ui/omni_component';

@Builder
export function LoadingEntryPageBuilder() {
  LoadingEntryPage()
}

@Entry
@Component
struct LoadingEntryPage {
  @State loading: boolean = true;

  build() {
    NavDestination() {
      Column({ space: 10 }) {
        Text('正常Loading展示')
        OmniPageLoading()
        Text('短文案Loading展示')
        OmniPageLoading({ options: { content: '我是较短的的Loading' } })
        Text('长文案Loading展示')
        OmniPageLoading({ options: {content: '我是较长的我是较长的我是较长的...' }})
        Text('四色圆点Loading展示')
        OmniDotLoadingView({ loading: $loading })
        Button('点击开始/暂停loading')
          .onClick(() => {
            this.loading = !this.loading
          })
        Button('点击打开loading弹窗，持续2s')
          .onClick(() => {
            let loading = new OmniLoading(this.getUIContext());
            loading.show()
            setTimeout(() => {
              loading.dismiss()
            }, 2000)
          })
      }
      .alignItems(HorizontalAlign.Center)
      .width('100%')
    }
    .title('Loading示例')
  }
}