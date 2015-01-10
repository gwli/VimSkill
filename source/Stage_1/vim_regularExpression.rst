正则表达式
**********

*\%* 这是一个range限定词, *\@* 是一个条件词作用相当于\ze \zs 但是它有一个不同那就是它可以使用反逻辑。\@! Match with zero width if the preceding atoms does not match at the current position.
<verbatim>
|/\%$|	\%$	\%$	end of file |/zero-width|
|/\%V|	\%V	\%V	inside Visual area |/zero-width|
|/\%#|	\%#	\%#	cursor position |/zero-width|
|/\%'m|	\%'m	\%'m	mark m position |/zero-width|
|/\%l|	\%23l	\%23l	in line 23 |/zero-width|
|/\%c|	\%23c	\%23c	in column 23 |/zero-width|
|/\%v|	\%23v	\%23v	in virtual column 23 |/zero-width|
\%(\)   A pattern enclosed by escaped parentheses.	*/\%(\)* */\%(* *E53*
	Just like \(\), but without counting it as a sub-expression.  This
	allows using more groups and it's a little bit faster.
see :help \% or :help \@
</verbatim>

-- Main.GangweiLi - 21 Jun 2012
