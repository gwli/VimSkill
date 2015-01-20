" process the link
"
echohl MatchParen | echo "process the link" | echohl None
%s/\[\[\(.\{-}\)]\[\(.\{-}\)]]/`\2 <\1>`_/g
" process %IF{ ....}% MACRO afer the list
%s/%IF{.\{-}}%//g

echohl MatchParen | echo "process Headline" | echohl None
" process the Headline ---+++
g/---+++ /s/---+++ // |t. |s/.*/\=repeat("=",len(submatch(0))). "\r"/
" process the Headline ---++++
g/---++++ /s/---++++ // |t. |s/.*/\=repeat("=",len(submatch(0))). "\r"/

echohl MatchParen | echo "process graphviz" | echohl None
" process graphviz
"
g/<dot>/,/<\/dot>/s/.*/   &/
g/<dot>/,/<\/dot>/s/.*<dot>/.. graphviz::\r
%s/<\/dot>/\r/g

echohl MatchParen | echo "process verbatim" | echohl None
" process verbatim
g/<verbatim>/,/<\/verbatim>/s/.*/   &/
%s/<verbatim>\(\_.\{-}\)<\/verbatim>/\r.. ::\r \1\r/


echohl MatchParen | echo "process blockqote" | echohl None
" process blockquote
"
g/<blockquote.*>/,/<\/blockquote>/s/.*/   &/
%s/<blockquote.*>\(\_.\{-}\)<\/blockquote>/\r.. ::\r \1\r/


" Process the *list
"
echohl MatchParen | echo "process the *list" | echohl None
%s/   \* /#. /
%s/   1\. /#. /






echohl MatchParen | echo ":)(:  Finish" | echohl None
