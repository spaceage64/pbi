/*
The following function code can be used to easily convert text to ASCII characters only, while at the same time
maintaining legibility by stripping only the accents from characters, not removing the characters themselves.
Characters that cannot be rendered (e.g., α, β, γ) will simply be ommited.
In addition, it will Clean, Trim, and Upper the text. Replace "Text.Upper" with "Text.Lower" or "Text.Proper" if
that's what you would prefer instead.

Example: "Café, Cortège, Naïve, Entrepôt, Façade, Jalapeño"
Becomes: "CAFE, CORTEGE, NAIVE, ENTREPOT, FACADE, JALAPENO"

*/

(inputText as text) as text =>
  let
    ReplaceDiacritics = Text.FromBinary(Text.ToBinary(inputText, 28597), TextEncoding.Ascii), 
    RemoveQuestionMarks = Text.Replace(ReplaceDiacritics, "?", " "),
    RemoveExcessSpaces = Text.Combine(List.RemoveItems(Text.Split(Text.Trim(RemoveQuestionMarks), " "), {""}), " "),
    CleanText = Text.Clean(Text.Trim(Text.Upper(RemoveExcessSpaces))) // May replace "Upper" with "Lower" or "Proper"
  in
    CleanText
