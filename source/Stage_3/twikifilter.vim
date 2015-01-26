" process the link
"
echohl MatchParen | echo "process the link" | echohl None
%s/\[\[\(.\{-}\)]\[\(.\{-}\)]]/`\2 <\1>`_ /g
" process %IF{ ....}% MACRO afer the list
%s/%IF{.\{-}}%//g

echohl MatchParen | echo "process Headline" | echohl None
%s/+++\zs[^ ]/ &/
" process the Headline ---+++
g/---+++ /s/---+++ // |t. |s/.*/\=repeat("=",len(submatch(0))). "\r"/
" process the Headline ---++++
g/---++++ /s/---++++ // |t. |s/.*/\=repeat("=",len(submatch(0))). "\r"/

echohl MatchParen | echo "process graphviz" | echohl None
" process graphviz
"
g/<dot>/,/<\/dot>/s/.*/   &/
g/<dot>/,/<\/dot>/s/.*<dot>/\r.. graphviz::\r
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

" Process the table
"
echohl MatchParen |echo "process the table" |echohl None

%s/^[^|]*\_s\zs\(\_^ *|\_.\{-}\)\ze\_^[^|]*$/\r.. csv-table:: \r\r&\r/g
%g/^ *|/s/|/,/g
%g/^ *,/s/^ *, \{0,2}/   /g


" Process the math
"
echohl MatchParen |echo "process the math" |echohl None
%s/%\$\(.*\)\$%/\r.. math:: \1/g



" Process the %META
"
echohl MatchParen |echo "process the Meta" |echohl None
:g/%META/d

" Process the %Reference
"
echohl MatchParen |echo "process the Referencelink" |echohl None
:g/#Re/,/ENDTWISTY/d
:g/TWISTY/d
echohl MatchParen | echo ":)(:  Finish" | echohl None

"wq!
