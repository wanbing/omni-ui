import {
  OmniImagePickerTrigger
} from "@omni-ui/omni_component/src/main/ets/components/imagepicker/OmniImagePickerTrigger";

@Builder
export function OmniImagePickerExamplePageBuilder() {
  OmniImagePickerExamplePage()
}

@Component
export struct OmniImagePickerExamplePage {
  @Consume('pathStack') pageStack: NavPathStack;
  @State selectUris: Array<string> = new Array<string>();

  build() {
    NavDestination() {
      OmniImagePickerTrigger({
        selectUris: $selectUris,
        goImagePicker: () => {
          this.pageStack.pushPathByName("OmniImagePickerSelectExamplePage", null, (data: PopInfo) => {
            if (data.result instanceof Array) {
              data.result.forEach((url: string) => {
                this.selectUris.push(url)
              })
            }
          }, true)
        }
      })
    }
    .title("图片选择器示例")
  }
}