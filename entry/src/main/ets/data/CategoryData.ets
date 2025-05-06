import { CategoryItem } from './CategoryItem'

export const CATEGORY_DATA: CategoryItem[] = [
  {
    icon: $r('app.media.icon_category_theme_style'),
    title: "主题",
    components: [
      {
        title: "样式设置",
        url: "OmniThemeDemoPage"
      }
    ]
  },
  {
    icon: $r('app.media.icon_category_view'),
    title: "视图",
    components: [
      {
        title: "标签Tag",
        url: "TagEntryPage"
      },
      {
        title: "富文本RichText",
        url: 'OmniRichTextExamplePage'
      },
      {
        title: "图片浏览Gallery",
        url: 'OmniGalleryExamplePage'
      },
      {
        title: "图片概览Summary",
        url: 'OmniSummaryExamplePage'
      },
      {
        title: "下拉刷新PullToRefresh",
        url: 'OmniPullableExamplePage'
      },
      {
        title: "步骤条StepBar",
        url: 'OmniStepLineExamplePage'
      },
      {
        title: "筛选FilterBar",
        url: 'OmniFilterBarExampleEntryPage'
      },
      {
        title: "日历Calendar",
        url: 'OmniCalendarExamplePage'
      },
      {
        title: "引导Guide",
        url: 'OmniGuideExamplePage'
      },
      {
        title: "可折叠文本ExpandableText",
        url: 'OmniExpandableTextEntryPage'
      },
      {
        title: "自动换行布局AutoLineGrid",
        url: 'OmniAutoLineGridEntryPage'
      }
    ]
  },
  {
    icon: $r('app.media.icon_category_form'),
    title: "表单",
    components: [
      {
        title: "单选/多选选择器DataPicker",
        url: 'DataPickerEntryPage'
      },
      {
        title: "图片选择ImagePicker",
        url: 'OmniImagePickerExamplePage'
      },
      {
        title: "搜索框SearchBar",
        url: 'OmniSearchExamplePage'
      }
    ]
  },
  {
    icon: $r('app.media.icon_category_operatefeedback'),
    title: "操作反馈",
    components: [
      {
        title: "吐司Toast",
        url: 'ToastEntryPage'
      },
      {
        title: "加载框Loading",
        url: 'LoadingEntryPage'
      },
      {
        title: "对话框Dialog",
        url: 'DialogEntryPage'
      }
    ]
  },
  {
    icon: $r('app.media.icon_category_navigation'),
    title: "导航",
    components: [
      {
        title: "导航栏NavigationBar",
        url: 'OmniNavigationBarPageExample'
      },
      {
        title: "选项卡Tabs",
        url: "OmniTabExamplePage"
      },
      {
        title: "底部导航BottomBar",
        url: "OmniBottomBarExamplePage"
      },
      {
        title: "锚点Anchor",
        url: 'OmniAnchorExamplePage'
      },
    ]
  },
  {
    icon: $r('app.media.icon_category_chart'),
    title: "图表",
    components: [
      {
        title: "柱状图ProgressBar",
        url: "OmniProgressBarChartExamplePage"
      },
      {
        title: "折线图BrokenLine",
        url: "OmniLineChartExamplePage"
      },
      {
        title: "雷达图Radar",
        url: "OmniRadarChartExamplePage"
      },
      {
        title: "环状图Doughnut",
        url: "OmniPieChartExamplePage"
      },
      {
        title: "漏斗图Funnel",
        url: 'OmniFunnelChartExamplePage'
      }
    ]
  }
]