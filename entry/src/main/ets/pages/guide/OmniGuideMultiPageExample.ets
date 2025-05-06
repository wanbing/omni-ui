import {
  BubbleBean,
  BubbleIndicator,
  BubblePosition,
  Controller,
  GuidePage,
  OmniGuide,
  OmniGuideBuilder,
  OmniTag,
  OnGuideChangedListener,
  OnPageChangedListener,
  TagItemInfo,
  TagMode
} from '@omni-ui/omni_component';
import promptAction from '@ohos.promptAction';
import { AnimatorOptions } from '@ohos.animator';
import hilog from '@ohos.hilog';
import { LengthMetrics } from '@kit.ArkUI';

@Builder
export function OmniGuideMultiPageExamplePageBuilder() {
  OmniGuideMultiPageExample()
}

@Entry
@Component
export struct OmniGuideMultiPageExample {
  @Consume('pathStack') pathStack: NavPathStack;
  private builder: OmniGuideBuilder | null = null;
  private controller: Controller | null = null;
  private enterAnimatorParam: AnimatorOptions = {
    duration: 300,
    easing: 'friction',
    delay: 0,
    fill: 'forwards',
    direction: 'normal',
    iterations: 1,
    begin: 0.0,
    end: 1.0
  }
  private exitAnimatorParam: AnimatorOptions = {
    duration: 300,
    easing: 'friction',
    delay: 0,
    fill: 'forwards',
    direction: 'normal',
    iterations: 1,
    begin: 1.0,
    end: 0.0
  }
  private visibleChangeListener: OnGuideChangedListener = {
    onShowed: (controller: Controller) => {
      hilog.info(0x0000, 'HighLightGuide', '%{public}s', 'HighLightGuide onShowed');
    },
    onRemoved: (controller: Controller) => {
      hilog.info(0x0000, 'HighLightGuide', '%{public}s', 'HighLightGuide onRemoved');
    }
  }
  private pageChangeListener: OnPageChangedListener = {
    onPageChanged: (pageIndex: number) => {
      promptAction.showToast({ message: this.getResourceString($r('app.string.guide_page_switching')) + pageIndex });
    }
  }

  getResourceString(res: Resource) {
    return getContext().resourceManager.getStringSync(res.id)
  }

  @State tagItems: TagItemInfo[] = [
    new TagItemInfo({ title: '纯文本tag' }),
    new TagItemInfo({ title: '这是一个文本' }),
    new TagItemInfo({
      title: '文本右边带icon',
      icons: {
        right: { icon: $r('app.media.tag_heart') }
      }
    }),
    new TagItemInfo({
      title: '文本左边带icon',
      icons: {
        left: { icon: $r('app.media.tag_heart') }
      }
    }),
    new TagItemInfo({ title: '纯文本tag' }),
    new TagItemInfo({
      title: '文本右边带icon',
      icons: {
        right: { icon: $r('app.media.tag_heart') }
      }
    }),
  ]

  aboutToAppear() {
    this.builder = new OmniGuideBuilder()
      .setLabel('OmniGuideMultiPageExample')
      .alwaysShow(true)// 总是显示，调试时可以打开
      .setOnGuideChangedListener(this.visibleChangeListener)
      .setOnPageChangedListener(this.pageChangeListener)
      .addGuidePage(GuidePage.newInstance()
        .addHighLight('OmniTag')
        .setBubbleIndicator(
          new BubbleIndicator(
            'OmniTag',
            new BubbleBean('OmniTag内容标题', '这是一个标签示例，气泡说明在内容下方'),
            BubblePosition.BOTTOM
          )
        )
        .setEnterAnimation(this.enterAnimatorParam)
        .setExitAnimation(this.exitAnimatorParam)
      )
      .addGuidePage(GuidePage.newInstance()
        .addHighLight('Button1')
        .setBubbleIndicator(
          new BubbleIndicator(
            'Button1',
            new BubbleBean('左边的按钮标题', '这是一个左边的按钮示例，气泡说明在内容下方'),
            BubblePosition.BOTTOM
          )
        )
        .setEnterAnimation(this.enterAnimatorParam)
        .setExitAnimation(this.exitAnimatorParam)
      )
      .addGuidePage(GuidePage.newInstance()
        .addHighLight('Button2')
        .setBubbleIndicator(
          new BubbleIndicator(
            'Button2',
            new BubbleBean('右边的按钮标题', '这是一个右边的按钮示例，气泡说明在内容下方'),
            BubblePosition.BOTTOM
          )
        )
        .setEnterAnimation(this.enterAnimatorParam)
        .setExitAnimation(this.exitAnimatorParam)
      )
      .addGuidePage(GuidePage.newInstance()
        .addHighLight('TextLeft')
        .setBubbleIndicator(
          new BubbleIndicator(
            'TextLeft',
            new BubbleBean('左边的内容标题', '这是一个左边的内容示例，气泡说明在内容右方'),
            BubblePosition.RIGHT
          )
        )
        .setEnterAnimation(this.enterAnimatorParam)
        .setExitAnimation(this.exitAnimatorParam)
      )
      .addGuidePage(GuidePage.newInstance()
        .addHighLight('TextRight')
        .setBubbleIndicator(
          new BubbleIndicator(
            'TextRight',
            new BubbleBean('右边的内容标题', '这是一个左边的内容示例，气泡说明在内容左方'),
            BubblePosition.LEFT
          )
        )
        .setEnterAnimation(this.enterAnimatorParam)
        .setExitAnimation(this.exitAnimatorParam)
      )
      .addGuidePage(GuidePage.newInstance()
        .addHighLight('ButtonBottom')
        .setBubbleIndicator(
          new BubbleIndicator(
            'ButtonBottom',
            new BubbleBean('底部的内容标题', '这是一个底部的内容示例，气泡说明在内容上方'),
            BubblePosition.TOP
          )
        )
        .setEnterAnimation(this.enterAnimatorParam)
        .setExitAnimation(this.exitAnimatorParam)
      )
  }

  build() {
    NavDestination() {
      Stack() {
        OmniGuide({
          content: this.content(),
          builder: this.builder,
          onReady: (controllerParam: Controller) => {
            this.controller = controllerParam
            setTimeout(() => {
              this.controller?.show()
            }, 300)
          }
        }).width('100%')
          .height('100%')
      }
    }.title('多页引导页示例')
  }

  @Builder
  private content() {
    Column() {
      Button('点击开始')
        .fontColor(Color.Black)
        .backgroundColor('#cccccc')
        .width('50%')
        .margin({ top: 20 })
        .id('ButtonStart')
        .onClick(() => {
          if (this.controller) {
            this.controller.show();
          }
        })

      Text('示例：流式布局Tag')
        .fontSize(16)
        .margin({ top: 25, bottom: 15 })
      OmniTag({
        tagItems: this.tagItems,
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
        },
        flexSpace: { main: LengthMetrics.vp(8), cross: LengthMetrics.vp(8) }
      })
        .margin({
          left: 15,
          top: 10,
          right: 15,
          bottom: 10
        })
        .id('OmniTag')

      Row() {
        Button('按钮1')
          .fontColor(Color.Black)
          .backgroundColor('#cccccc')
          .width('20%')
          .id('Button1')
          .onClick(() => {
          })
          .id('Button1')

        Blank()
          .layoutWeight(1.0)

        Button('按钮2')
          .fontColor(Color.Black)
          .backgroundColor('#cccccc')
          .width('20%')
          .id('Button2')
          .onClick(() => {
          })
          .id('Button2')
      }
      .margin({ left: 5, right: 5, top: 30 })

      Row() {
        Text('左边的内容')
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .width(20)
          .id('TextLeft')

        Blank()
          .layoutWeight(1.0)

        Text('右边的内容')
          .fontSize(15)
          .width(20)
          .textAlign(TextAlign.Center)
          .id('TextRight')
      }
      .margin({ left: 5, right: 5, top: 30 })

      Blank().layoutWeight(1.0)
      Button('底部按钮')
        .fontColor(Color.Black)
        .backgroundColor('#cccccc')
        .width('50%')
        .margin({ bottom: 10 })
        .id('ButtonBottom')
        .onClick(() => {
        })
    }.alignItems(HorizontalAlign.Center)
  }
}