import { DisplayMode, OmniCalendar, SelectMode, Toast } from '@omni-ui/omni_component'

@Builder
export function OmniCalendarExamplePageBuilder() {
  OmniCalendarExamplePage()
}

@Component
struct OmniCalendarExamplePage {
  build() {
    NavDestination() {
      Scroll() {
        Column() {
          Text('单选-无控制-周视图')
            .padding({bottom: 15 })
          OmniCalendar({
            displayMode: DisplayMode.week,
            showControllerBar: false,
            dateChange: (date) => {
              Toast.showText({ msg: `选中的时间： ${this._formatDate(date)}` })
            },
          })

          Divider()
            .vertical(false)
            .strokeWidth(40)
            .color('#F0F0F0')

          Text('单选-周视图')
            .padding({ top: 15, bottom: 15 })
          OmniCalendar({
            displayMode: DisplayMode.week,
            initDisplayDate: new Date(Date.parse('2024-10-01')),
            minDate: new Date(2024, 0, 1),
            maxDate: new Date(2025, 11, 31),
            dateChange: (date) => {
              Toast.showText({ msg: `选中的时间： ${this._formatDate(date)}` })
            },
          })

          Divider()
            .vertical(false)
            .strokeWidth(40)
            .color('#F0F0F0')

          Text('范围选-周视图')
            .padding({ top: 15, bottom: 15 })
          OmniCalendar({
            displayMode: DisplayMode.week,
            selectMode: SelectMode.range,
            initDisplayDate: new Date(Date.parse('2024-10-01')),
            minDate: new Date(2024, 0, 1),
            maxDate: new Date(2025, 11, 31),
            rangeDateChange: (rangeDate) => {
              Toast.showText({
                msg: `开始时间： ${this._formatDate(rangeDate.start)} , 结束时间：${this._formatDate(rangeDate.end)}`
              })
            }
          })

          Text('单选-月视图')
            .padding({ top: 15, bottom: 15 })
          OmniCalendar({
            displayMode: DisplayMode.month,
            initDisplayDate: new Date(Date.parse('2024-10-01')),
            minDate: new Date(2024, 0, 1),
            maxDate: new Date(2025, 11, 31),
            dateChange: (date) => {
              Toast.showText({ msg: `选中的时间： ${this._formatDate(date)}` })
            },
          })

          Divider()
            .vertical(false)
            .strokeWidth(40)
            .color('#F0F0F0')

          Text('范围选-月视图')
            .padding({ top: 15, bottom: 15 })
          OmniCalendar({
            displayMode: DisplayMode.month,
            selectMode: SelectMode.range,
            minDate: new Date(2024, 0, 1),
            maxDate: new Date(2025, 11, 31),
            rangeDateChange: (rangeDate) => {
              Date
              Toast.showText({
                msg: `开始时间： ${this._formatDate(rangeDate.start)} , 结束时间：${this._formatDate(rangeDate.end)}`
              })
            }
          })

        }.padding(20)
      }
    }.title('OmniCalendar示例')
  }

  _formatDate(date: Date): string {
    let year = date.getFullYear();
    let month = date.getMonth() + 1;
    let day = date.getDate();
    return `${year}年${month}月${day}日`;
  }
}