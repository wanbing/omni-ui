export default class ObjectUtil {
  static ObjectFromEntries(source: Iterable<readonly any[]>): Object {
    return Object.fromEntries(source)
  }
}