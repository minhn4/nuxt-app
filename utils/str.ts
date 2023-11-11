// Convert a string to title case, e.g., ALBERTA'LYN SMITH -> Alberta'lyn Smith
export function toTitleCase(str: string | undefined) {
  if (!str) return "";
  return str.replace(/([^\W_]+[^\s-]*) */g, function (txt: string) {
    return txt.charAt(0).toUpperCase() + txt.substring(1).toLowerCase();
  });
}
