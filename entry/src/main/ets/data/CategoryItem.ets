export interface CategoryItem {
  icon: Resource
  title: string
  components: ComponentItem[]
}

export interface ComponentItem {
  title: string,
  url: string | undefined
}