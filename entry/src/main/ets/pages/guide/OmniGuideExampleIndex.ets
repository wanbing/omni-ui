import {
  BubbleBean,
  BubbleIndicator,
  BubblePosition,
  Controller,
  GuidePage,
  OmniGuide,
  OmniGuideBuilder
} from '@omni-ui/omni_component';

@Builder
export function OmniGuideExamplePageBuilder() {
  OmniGuideExampleIndex()
}

@Entry
@Component
export struct OmniGuideExampleIndex {
  @Consume('pathStack') pathStack: NavPathStack;
  private builder: OmniGuideBuilder | null = null;
  private controller: Controller | null = null;

  aboutToAppear() {
    this.builder = new OmniGuideBuilder()
      .setLabel('OmniGuideExampleIndex')
      .alwaysShow(true)
      .addGuidePage(GuidePage.newInstance()
        .addHighLight('Simple')
        .setBubbleIndicator(
          new BubbleIndicator(
            'Simple',
            new BubbleBean('标题栏', '这里是副标题栏，这是一个简单的演示'),
            BubblePosition.BOTTOM
          )
        )
      )
  }

  build() {
    NavDestination() {
      Column() {
        Stack() {
          OmniGuide({
            content: this.content,
            builder: this.builder,
            onReady: (controller: Controller) => {
              this.controller = controller;
            }
          })
        }
      }
      .width('100%')
    }.title('OmniGuide 示例')
  }

  @Builder
  private content() {
    Column() {
      Button($r('app.string.just_use_it_simply'))
        .onClick(() => {
          if (this.controller) {
            this.controller.show();
          }
        }).id('Simple')
        .margin(10)
        .width('50%')

      Button($r('app.string.multi_guide_page'))
        .onClick(() => {
          this.pathStack.pushPath({ name: 'OmniGuideMultiPageExample' })
        })
        .margin(10)
        .width('50%')
    }.alignItems(HorizontalAlign.Center)
    .width('100%')
    .height('100%');
  }
}