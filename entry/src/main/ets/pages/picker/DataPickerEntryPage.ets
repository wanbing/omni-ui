import { DataPicker, Toast } from "@omni-ui/omni_component"
import { TextCascadePickerRangeContentWrapper } from "@omni-ui/omni_component/src/main/ets/components/picker/DataPicker"

@Builder
export function DataPickerEntryPageBuilder() {
  DataPickerEntryPage()
}

@Entry
@Component
struct DataPickerEntryPage {
  @State private alphabet: string[] =
    ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'o', 'p', 'q', 'r', 's', 't', 'u',
      'w', 'x', 'y', 'z']
  private fruits: string[] = ['apple', 'orange', 'banana', 'peach', 'pineapple']
  private animals: string[] = ['ant', 'elephant', 'monkey', 'panda', 'cat', 'mouse']
  private colors: string[] = ['red', 'black', 'blue', 'pink', 'yellow']
  @State private multi: string[][] = [this.fruits, this.animals, this.colors]
  @State private cascade: TextCascadePickerRangeContentWrapper[] = [
    new TextCascadePickerRangeContentWrapper('北京',
      [new TextCascadePickerRangeContentWrapper('北京市', [
        new TextCascadePickerRangeContentWrapper('朝阳区'),
        new TextCascadePickerRangeContentWrapper('其他区'),
        new TextCascadePickerRangeContentWrapper('昌平区'),
        new TextCascadePickerRangeContentWrapper('大兴区'),
        new TextCascadePickerRangeContentWrapper('东城区'),
        new TextCascadePickerRangeContentWrapper('房山区'),
        new TextCascadePickerRangeContentWrapper('丰台区'),
        new TextCascadePickerRangeContentWrapper('海淀区'),
        new TextCascadePickerRangeContentWrapper('怀柔区'),
        new TextCascadePickerRangeContentWrapper('门头沟区'),
        new TextCascadePickerRangeContentWrapper('密云区'),
        new TextCascadePickerRangeContentWrapper('平谷区'),
        new TextCascadePickerRangeContentWrapper('石景山区'),
        new TextCascadePickerRangeContentWrapper('顺义区'),
        new TextCascadePickerRangeContentWrapper('通州区'),
        new TextCascadePickerRangeContentWrapper('西城区'),
        new TextCascadePickerRangeContentWrapper('延庆区'),
      ])]),
    new TextCascadePickerRangeContentWrapper('天津',
      [new TextCascadePickerRangeContentWrapper('天津市', [
        new TextCascadePickerRangeContentWrapper('宝坻区'),
        new TextCascadePickerRangeContentWrapper('北辰区'),
        new TextCascadePickerRangeContentWrapper('滨海新区'),
        new TextCascadePickerRangeContentWrapper('东丽区'),
        new TextCascadePickerRangeContentWrapper('河北区'),
        new TextCascadePickerRangeContentWrapper('河东区'),
        new TextCascadePickerRangeContentWrapper('和平区'),
        new TextCascadePickerRangeContentWrapper('河西区'),
        new TextCascadePickerRangeContentWrapper('红桥区'),
        new TextCascadePickerRangeContentWrapper('蓟州区'),
        new TextCascadePickerRangeContentWrapper('津南区'),
        new TextCascadePickerRangeContentWrapper('静海区'),
        new TextCascadePickerRangeContentWrapper('南开区'),
        new TextCascadePickerRangeContentWrapper('宁河区'),
        new TextCascadePickerRangeContentWrapper('其他区'),
        new TextCascadePickerRangeContentWrapper('武清区'),
        new TextCascadePickerRangeContentWrapper('西青区'),
      ])]),
    new TextCascadePickerRangeContentWrapper('河北省',
      [new TextCascadePickerRangeContentWrapper('保定市', [
        new TextCascadePickerRangeContentWrapper('安国市'),
        new TextCascadePickerRangeContentWrapper('安新县'),
        new TextCascadePickerRangeContentWrapper('博野县'),
      ]),
        new TextCascadePickerRangeContentWrapper('沧州市', [
          new TextCascadePickerRangeContentWrapper('沧县'),
          new TextCascadePickerRangeContentWrapper('东关县'),
          new TextCascadePickerRangeContentWrapper('海兴县'),
        ])]),
  ]

  build() {
    NavDestination() {
      Column({ space: 10 }) {
        Button('单列选择器')
          .onClick(() => {
            DataPicker.getInstance(this.getUIContext()).show({
              range: this.alphabet,
              title: '请选择一个字母',
              onConfirm: (v, i) => {
                Toast.showText({ msg: '选中的值为：' + v + ', 选中的索引为: ' + i })
              },
              onCancel: () => {
                Toast.showText({ msg: '点击取消按钮' })
              }
            })
          })
        Button('单列选择器（设置默认值)')
          .onClick(() => {
            DataPicker.getInstance(this.getUIContext()).show({
              range: this.alphabet,
              selected: 2,
              title: '请选择一个字母',
              onConfirm: (v, i) => {
                Toast.showText({ msg: '选中的值为：' + v + ', 选中的索引为: ' + i })
              },
              onCancel: () => {
                Toast.showText({ msg: '点击取消按钮' })
              }
            })
          })
        Button('多列选择器')
          .onClick(() => {
            DataPicker.getInstance(this.getUIContext()).show({
              range: this.multi,
              title: '请选择你最喜欢的水果、动物和颜色',
              onConfirm: (v, i) => {
                Toast.showText({ msg: '选中的值为：' + v + ', 选中的索引为: ' + i })
              },
              onCancel: () => {
                Toast.showText({ msg: '点击取消按钮' })
              }
            })
          })
        Button('多列选择器（设置默认值）')
          .onClick(() => {
            DataPicker.getInstance(this.getUIContext()).show({
              range: this.multi,
              selected: [2, 2],
              title: '请选择你最喜欢的水果、动物和颜色',
              onConfirm: (v, i) => {
                Toast.showText({ msg: '选中的值为：' + v + ', 选中的索引为: ' + i })
              },
              onCancel: () => {
                Toast.showText({ msg: '点击取消按钮' })
              }
            })
          })
        Button('级联选择器')
          .onClick(() => {
            DataPicker.getInstance(this.getUIContext()).show({
              range: this.cascade,
              title: '请选择城市',
              onConfirm: (v, i) => {
                Toast.showText({ msg: '选中的值为：' + v + ', 选中的索引为: ' + i })
              },
              onCancel: () => {
                Toast.showText({ msg: '点击取消按钮' })
              }
            })
          })
        Button('级联选择器（设置默认索引）')
          .onClick(() => {
            DataPicker.getInstance(this.getUIContext()).show({
              range: this.cascade,
              selected: [0, 0, 2],
              title: '请选择城市',
              onConfirm: (v, i) => {
                Toast.showText({ msg: '选中的值为：' + v + ', 选中的索引为: ' + i })
              },
              onCancel: () => {
                Toast.showText({ msg: '点击取消按钮' })
              }
            })
          })
      }
    }
    .title('DataPicker示例')
  }
}