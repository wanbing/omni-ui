import { AlbumInfo, AlbumPickerComponent, AlbumPickerOptions, PickerColorMode } from "@kit.MediaLibraryKit"

@Builder
export function OmniImageAlbumPickerPageBuilder() {
  OmniImageAlbumPickerPage()
}

@Component
export struct OmniImageAlbumPickerPage {
  @Consume('pathStack') pageStack: NavPathStack;

  albumOptions: AlbumPickerOptions = new AlbumPickerOptions();

  onAlbumInfoClick(albumInfo: AlbumInfo): boolean {
    this.pageStack.pop(albumInfo)
    return true
  }
  build() {
    NavDestination() {
      AlbumPickerComponent({
        albumPickerOptions: this.albumOptions,
        onAlbumClick: (albumInfo: AlbumInfo): boolean => this.onAlbumInfoClick?.(albumInfo) ?? false
      })
    }
    .title("相册选择")
  }

  aboutToAppear(): void {
    this.albumOptions.themeColorMode = PickerColorMode.AUTO

  }
}