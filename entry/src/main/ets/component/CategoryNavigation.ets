import { CategoryItem, ComponentItem } from '../data/CategoryItem'
import { promptAction, router } from '@kit.ArkUI'

@Component
export struct CategoryItemCard {
  @BuilderParam
  categoryItem: CategoryItem
  @Provide("expand") expand: boolean = false
  private onFlagChange = () => {
    animateTo({
      duration: 200,
      curve: Curve.Smooth
    }, () => {
      this.expand = !this.expand;
    })
  }

  build() {
    Column() {
      Row() {
        Image(this.categoryItem.icon)
          .width(24)
          .height(24)
          .objectFit(ImageFit.Fill)

        Text(this.categoryItem.title)
          .fontSize(16)
          .margin({ left: 16 })
          .fontColor(Color.Black)

        Blank()

        if (this.categoryItem.components) {
          Image(this.expand ? $r('app.media.ic_down_arrow') : $r('app.media.ic_right_arrow'))
            .width(this.expand ? 24 : 12)
            .height(this.expand ? 12 : 24)
            .margin({ right: this.expand ? 0 : 6 })
        }
      }
      .height(56)
      .width('100%')
      .onClick(() => {
        // this.expand = !this.expand;
        this.onFlagChange()
      })

      // Click to expand the fourth-level category
      if (this.expand) {
        ForEach(this.categoryItem.components, (componentItem: ComponentItem) => {
          Column() {
            Divider()
              .height(1)
              .opacity(0.2)
              .margin({ left: 42, right: 8 })
              .color(Color.Black)

            FourthLevelNavigation({ componentItem: componentItem })
          }
        })
      }
    }
  }
}

@Component
struct FourthLevelNavigation {
  @BuilderParam
  private componentItem: ComponentItem

  @Consume('pathStack') pathStack: NavPathStack;

  build() {
    Row() {
      Text(this.componentItem.title)
        .fontSize(16)
        .layoutWeight(1)
        .margin({ left: 42 })
        .align(Alignment.Start)
        .fontFamily('HarmonyHeiTi-Medium')
        .fontColor(Color.Black)
      Blank()
    }
    .height(48)
    .width('100%')
    .onClick(() => {
      if (this.componentItem.url) {
        this.pathStack.pushPath({ name: this.componentItem.url })
      } else {
        promptAction.showToast({
          message: '开发中'
        })
      }
    })
  }
}