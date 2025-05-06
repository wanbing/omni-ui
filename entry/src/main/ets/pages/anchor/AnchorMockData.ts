export interface BaseInfoItem {
  type?: string
  centerImg?: string
  centerImgWidth?: string
  centerImgHeight?: string
  color?: string
  title?: string
  textSize?: string
  textColor?: string
  bgColor?: string
  leftImg?: string
  rightImg?: string
  action?: string
  borderRadius?: string
  borderWidth?: string
}

export const mockBaseInfo: BaseInfoItem[] = [{
  "type": "houseFillImage",
  "centerImgWidth": "102",
  "centerImgHeight": "22",
  "color": "#0f2588D4",
  "title": "舒适型公寓",
}, {
  "title": "邻地铁",
  "color": "#249DB8D7",
  "textSize": "12",
  "textColor": "#6884A5",
  "bgColor": "#249DB8D7",
  "leftImg": "",
  "rightImg": "",
  "action": "",
  "borderRadius": "3",
  "borderWidth": "3"
}, {
  "title": "押一付一",
  "textSize": "12",
  "color": "#249DB8D7",
  "textColor": "#6884A5",
  "bgColor": "#249DB8D7",
  "leftImg": "",
  "rightImg": "",
  "action": "",
  "borderRadius": "3",
  "borderWidth": "3"
}, {
  "title": "配套齐全",
  "textSize": "12",
  "color": "#249DB8D7",
  "textColor": "#6884A5",
  "bgColor": "#249DB8D7",
  "leftImg": "",
  "rightImg": "",
  "action": "",
  "borderRadius": "3",
  "borderWidth": "3"
}, {
  "title": "精装修",
  "textSize": "12",
  "color": "#249DB8D7",
  "textColor": "#6884A5",
  "bgColor": "#249DB8D7",
  "leftImg": "",
  "rightImg": "",
  "action": "",
  "borderRadius": "3",
  "borderWidth": "3"
}, {
  "title": "南北通透",
  "textSize": "12",
  "color": "#249DB8D7",
  "textColor": "#6884A5",
  "bgColor": "#249DB8D7",
  "leftImg": "",
  "rightImg": "",
  "action": "",
  "borderRadius": "3",
  "borderWidth": "3"
}, {
  "title": "有阳台",
  "textSize": "12",
  "color": "#249DB8D7",
  "textColor": "#6884A5",
  "bgColor": "#249DB8D7",
  "leftImg": "",
  "rightImg": "",
  "action": "",
  "borderRadius": "3",
  "borderWidth": "3"
}, {
  "title": "随时看房",
  "textSize": "12",
  "color": "#249DB8D7",
  "textColor": "#6884A5",
  "bgColor": "#249DB8D7",
  "leftImg": "",
  "rightImg": "",
  "action": "",
  "borderRadius": "3",
  "borderWidth": "3"
}, {
  "title": "有电梯",
  "textSize": "12",
  "color": "#249DB8D7",
  "textColor": "#6884A5",
  "bgColor": "#249DB8D7",
  "leftImg": "",
  "rightImg": "",
  "action": "",
  "borderRadius": "3",
  "borderWidth": "3"
}, {
  "title": "普通住宅",
  "textSize": "12",
  "color": "#249DB8D7",
  "textColor": "#6884A5",
  "bgColor": "#249DB8D7",
  "leftImg": "",
  "rightImg": "",
  "action": "",
  "borderRadius": "3",
  "borderWidth": "3"
}]

export interface Questions {

  title?: string;
  questions?: QuestionItem[];
}

export interface QuestionItem {
  title?: string;
  send_url?: string;
  requestUrl?: string;
}

export const mockQuestions: Questions = {
  title: '提问',
  questions: [
    {
      title: '是和房东签约吗？'
    },
    {
      "title": "什么时候能看房？"
    },
    {
      "title": "中介费多少钱？"
    },
    {
      "title": "租金能便宜吗？"
    },
    {
      "title": "房子在几层？"
    },
    {
      "title": "有电梯吗？"
    }
  ]
}