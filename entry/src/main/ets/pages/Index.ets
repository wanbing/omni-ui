import { CATEGORY_DATA } from '../data/CategoryData';
import { CategoryItem } from '../data/CategoryItem';
import { CategoryItemCard } from '../component/CategoryNavigation';
import { Toast } from '@omni-ui/omni_component';

@Entry
@Component
struct Index {
  @Provide('pathStack') pathStack: NavPathStack = new NavPathStack()
  private categoryItems: CategoryItem[] = CATEGORY_DATA

  aboutToAppear(): void {
    Toast.initToast(this.getUIContext())
  }

  build() {
    Navigation(this.pathStack) {
      Column() {
        List() {
          ForEach(this.categoryItems, (categoryItem: CategoryItem) => {
            ListItem() {
              Column() {
                CategoryItemCard({ categoryItem: categoryItem })
              }
              .ColumnStyle()
            }
            .margin({ top: 6, bottom: 6 })
          })
        }
        .width("100%")
        .height("100%")
        .padding({ left: 16, right: 16, top: 16 })
      }
      .width("100%")
      .height("100%")
      .backgroundColor(0xfff1f3f5)
    }
    .title('OmniUI')
    .titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Auto)
  }
}

@Extend(Column)
function ColumnStyle() {
  .width('100%')
  .borderRadius(24)
  .backgroundColor(Color.White)
  .padding({
    left: 12,
    right: 12,
    bottom: 4,
    top: 4
  })
}