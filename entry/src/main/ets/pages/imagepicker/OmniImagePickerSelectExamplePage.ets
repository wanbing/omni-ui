import { OmniImagePicker } from '@omni-ui/omni_component'
import { AlbumInfo } from '@kit.MediaLibraryKit';

@Builder
export function OmniImagePickerSelectExamplePageBuilder() {
  OmniImagePickerSelectExamplePage()
}
@Component
export struct OmniImagePickerSelectExamplePage {
  @Consume('pathStack') pageStack: NavPathStack;

  @State currentAlbumUrl?: string = ""
  @State currentAlbumName?: string = "照片和视频"
  build() {
    NavDestination() {
      OmniImagePicker({
        currentAlbumUrl: this.currentAlbumUrl,
        onFinished: (result: Object) => {
          this.pageStack.pop(result)
        },
        goAlbumPicker: () => {
          this.pageStack.pushPathByName("OmniImageAlbumPickerPage", null, (popInfo: PopInfo) => {
            if (popInfo.result instanceof AlbumInfo) {
              this.currentAlbumUrl = popInfo.result.uri
              this.currentAlbumName = popInfo.result.albumName
            }
          }, true)
        }
      })
    }
    .title(this.currentAlbumName)
  }
}