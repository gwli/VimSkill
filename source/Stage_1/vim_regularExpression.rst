正则表达式
**********

简介
====

正则表达式是进阶高级的文本处理的基础。并且正则表达式是程序员七大武器老大长生剑。可见其重要性。 并且在linux下大部分的工作都是支持正则表达式，grep,sed,awk等等。

并且正则表式是编译原理中，词法分析中用的最多的方法。如果再把正则表式的功能扩展一些，例如条件正则表式就具备了语法分析的功能。

文本处理的中快速，精确，灵活。中灵活就是通过正则表达式来实现。 正则表式的关键是熟练。本身的理解的是没有任何难度的。要想高效，就必须熟练。

简单的正则表达式基础，网上的各种文档很多，这么不讲了，基础可以参考网上的。 或者 vim 自带的 :command:`:help pattern.txt`

:modifier:type:num:

基本语法就是这样

#. modifier, 位置的修饰符，^ 行首，$行尾等。
#. type 字母的类型，[a-Z],[0-9], 直接列举的方式，或者缩写符号。这些都无所谓的。
#. num 字母的个数，例如 ? 代表0或者1个，`*` 代表任意多个，``\{m,n}`` m-n 之间个。

另外就是分组，group, ()的概念。有了分组就可以引用了。
传统的是分9组。 0 代表匹配到的整个字符串，1-9代表字符串组。 有些语言是支持嵌套分组，例如perl,这样的话是从外往内数 , 例如

  ``a(b(cd)e)f`` 第一组就是bcde,而第二组就是cd.

正则表达式主要是查找与替换上。

剩下那些转义字符了，基本上大同小异

vim 是练习正则表达式的最佳地方
------------------------------

#. vim的正表式的语法与标准语法大部分相同
#. 熟悉之后，是可以直接应用中平时的文本处理之中


后面主要是基于vim 的一些高级功能
================================


贪婪与非贪婪
------------

vim 默认是贪婪模式(最长匹配) ，非贪婪模式(最短匹配) 可以用 \{-} 表示。 

.. code-block:: vim
    abcfae 
    .*     //match abcae 
    .\{-}  //match a 


跨行与不跨行
------------

Vim 中默认的匹配是按行处理的，如果遇到复杂的处理，文本块不是按行分隔的，而是用空行来分隔的，跨行怎么办呢，:command:`\_.` 代替 :command:`.` 就可以跨行了。 

.. code-block:: vim
   
   /.*
   /\_.*


条件正则式
----------

有两种做法简单的可以用offset来实现例如这些:

.. code-block:: vim
    
   /abc/e-2
   /abc/s+1

而在替换的时候可以这样用:
\ze 以结尾
\zs 以什么开头

.. code-block:: vim
   
   %s/abc\zs(hello) (.*)\zefafa/\2 \1/gc


正则表达式中的与或非
--------------------

一些基本命令只要再加一个与或非操作，就可以复杂的操作。与或非是逻辑运算的基本集，所有逻辑去算都是化成与或非。
正则表式中与或非

*与*  这个是默认的行为， 例如:command:`a.*b` 就是a,b 同时有了

*或*  这个要用 :command:`\|` 例如 :command:`lgw \|zgg` 就是 lgw 或者 zgg.

*与*  这个要用 :command:`\@!`  例如 :command:`\@!abc` 就是不包含abc

分隔符替换
----------

:command:`%s` 命令默认分隔符是 :command:`/`,当遇到需要匹配的模式有大量 的:command:`/` 或者 :command:`\ ` 时就会很头疼了。这个时候可以通过改变分隔符，这样 /\ 就可以用了。
例如 :command:`%s#pattern#replace#gc`  分隔符变替换成了 #。 


对于位置限定词
--------------
除了 :command:`^$` 的行首与行尾之外还有这些。

*\%* 这是一个range限定词, *\@* 是一个条件词作用相当于\ze \zs 但是它有一个不同那就是它可以使用反逻辑。\@! Match with zero width if the preceding atoms does not match at the current position.

.. code-block:: vim

   \%$	\%$	end of file |/zero-width|
   \%V	\%V	inside Visual area |/zero-width|
   \%#	\%#	cursor position |/zero-width|
   \%'m	\%'m	mark m position |/zero-width|
   \%23l	\%23l	in line 23 |/zero-width|
   \%23c	\%23c	in column 23 |/zero-width|
   \%23v	\%23v	in virtual column 23 |/zero-width|
   \%(\)   A pattern enclosed by escaped parentheses.	*/\%(\)* */\%(* *E53*
   Just like \(\), but without counting it as a sub-expression.  This
   allows using more groups and it's a little bit faster.

.. seealso::

   :command:`:help \%` or :command:`:help \@`


常见应用
--------

我们经常做的作法，查找与排序

查找
^^^^
在修改编辑之前，我们经常先看一下我们有哪些需要修改 你可以用 
:command:`:ilist /pattern/` 来查看。 并且还可以匹配到了多少行。 

如果想精确的知道匹配了多少个 可以用 :command:`%s/pattern//n`
当然你想进一步，利用quick-fix 窗口 来像error list 那样查看的话，你可以 安装一个 *Bgrep* 插件 来实现。 使用方法 :command:`:Bgrep /pattern/` .

再进一步，查看到每pattern的上下文呢，对于改代码的时候很有用，例如pattern周围上下5行 
:command:`g/pattern/z#5 |echo "---------------"` 

:command:`z#` 用法可以查看 :command:`:help :z`. 

同时还可以把vim 当做 :command:`less` or :command:`more` 来使用 :command:`cat log.txt |vim -` 或者只需要读的可以用 :command:`cat log.txt |view -`  view 是vim -R

*随时随地打开高亮*  在看一些东西的时候，会很方便，例如\t 时就会很方便，set hls(highlightsearch) 或者使用:hl 命令打开各种高亮。对于查错的时候很方便。 当然关闭高亮 :command:`:noh`


排序
^^^^
根据 /pattern/ 进行排序 :command:`:sort /pattern/`, 例外 :command:`:sort` 还有剔除重复的功能。 更多的功能 查看 :command:`:help :sort`




highlighting search results from within a function   
The problem is that the search register is saved before a function
call and restored after, so when your function returns the search
register no longer contains "this".  See ":help
function-search-undo".

see gmail

-- Main.GangweiLi - 22 Jun 2012
