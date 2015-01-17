vim 的命令
**********

vim 的大部分命令都是来自于ex,而ex 是 ed 的改进版。包括sed的命令集基于ed。
所以也就会发现在这几个工具的命令集都差不多。并且RCS的版本格式也这样的，
并且diff的输出也支持ex命令。其实patch也是利用ex的命令集的。


基本命令行前面都已经讲过了，所有的命令集都在 :command:`:exu`.  或者直接查看
:comman:`:help index.txt`

这里只讲一些经常会用到，但是前面又没有提到命令吧. 按照模式来讲吧

Vim经常被人吐槽的各种模式的切换。特别一个小的改动就来回切换切回来。vim 针对这些也有
了一些改进，在每一种模式都会通过组合键提供临时执行其他模式的命令。执行完自动切回当前
模式。

Insert mode 
-----------

:command:`CTRL-D` 缩进的，是按照 tab长度来走的。
:command:`CTRL-Y` 自动复制上行对应列的字母
:command:`CTRL-E` 自动复制下行对应列的字符
:command:`CTRL-O` 临时切到normal mode 执行一条命令，再自动切回insert mode,相反过程是 :command:`r` 替换当前的字母然后切回到Nomral模式。
:command:`CTRL-X submode` 自动补行，就是用它实现的 :command:`CTRL-X CTRL-L`. 
:command:`CTRL-X s` 自动拼写检查
:command:`CTRL-X CTRL-U` 按照自定义的补全函数来补全


Normal mode
-----------

:command:`CTRL-A N` 自动当前光标下数字加N 默认是加1. :command:`CTRL-X N` 就是加
:command:`CTRL-T`  是tag stack返上一个。
:command:`CTRL-O`  是跳回上一次 :command:`CTRL-]` 的地方。
:command:`CTRL-V`  是列选择模式
:command:`CTRL-Z` 挂起 vim. 可以fg 返回。
:command:`!` :command:`!!` filter 命令，把选中text传回filter命令，可以是系统命令然后结果保存在当前位置
:command:`<<` 与:command:`>>` 是Normal模式的下缩进同 insert下的缩进一样的
:command:`q:` 或者 :command:`: CTRL-F`  快速打开命令行窗口

.. note:: 

   若想用 CTRL-X, CTRL-C 和 CTRL-V, 这些标准的 MS-Windows 操作方式怎么办？有办法！
   用 $VIMRUNTIME\mswin.vim 这个脚本解决。你可以把下面这条命令放到你的 _vimrc 文
   件里:
        source $VIMRUNTIME/mswin.vim
   这样一来 CTRL-C 就变成"复制"命令了，但是原先的 CTRL-C 是中止操作的命令呀，没
   办法，用 CTRL-Break 来结束任务吧。
                                                        *CTRL-V-alternative*
    因为 CTRL-V 被用做"粘贴"，所以你不能用它来启动"可视 块"的选择模式，不过可
    以用 CTRL-Q 代替。你也可以在"插入"模式和"命令"模式中用 CTRL-Q 代替 CTRL-V。
    但是 CTRL-Q 常常被用作控制流，这时候它在某些终端下就不好用了。
    
   .. seealso::  `vim_windows手册 <http://man.chinaunix.net/newsoft/vi/doc/gui&#95;w32.html>`_  

另一块就是窗口的操作了
:command:`CTRL-W` 为前缀了， 
:command:`CTRL-W f` 另开一个窗口打开当前光标下文件名
:command:`CTRL-W z` 关掉预览窗口
:command:`CTRL-W |` 设置窗口的宽度

更全面的命令可以见 :command:`:h CTRL-W` 。 


一些有用的查询命令

:command:`g CTRL-G` 查看光标的位置信息，在第几行，第几列，第几个char,第几个word,第几个byte.
:command:`gv`  重新选中最近一次选择对象
:command:`ga`  查看当前字符的编码的十进制，十六进制，八进制显示
:command:`gm`  跳到这一行的中间
:command:`gq`  格式化
:command:`gx`   执行当前光标下的命令
:command:`gs`   sleep 函数默认是1秒
:command:`g~[motion]`  翻转当前行大小写
:command:`gU[motion]`  变大写, :command:`gu[motion]` 变小写


一些有用的z 命令
:comand:`zr` 打开折行
:command:`z=` 给出拼写提示


visual mode
-----------

command:`a"` 高亮一个双引号字符串,同理还的有 :command:`a'`, :command:`a(` 等等 这在代码除错的时候非常用。
command:`J` 当前所选所有行，拼接成一行，这个在在字符串与列表之间的转换起来非常的方便，直接用替换就可以实现split的功能。


ex 命令
=======
前面大部分命令都有对应的 ex 命令。 全部的ex 命令可以查看:command:`:h holy-grail`
这里也讲一些最常用命令，那就是 :command:`:g` 

.. code-block:: vim
    
   :[range]g[lobal]{pattern}/[cmd]

当你想条件式的替换的时候，利用 :command:`:g` 是再合适不过了。 这个会在后面的例子体现出来，这个命令再加上宏录制功能，就无非强大了。
另外那就是用查询了，例如  

:command:`g/pattern/z#5| echo "-----------------------"` 自己试一下。


Vim 重定向  example
-------------------

.. code-block:: vim

   When I print result of the execution of global command into register:
   :redir @a
   :g/pattern/
   :redir END
   and then insert the register in buffer
   "ap


与外部shell的交互
-----------------
!!, ! 可以 external cmd 交互。

vim 本身也是可以当做sed,或者awk 一样的命令来用的。

:command:`vim -E -s -c "let g:html_no_progress=1" -c "syntax on" -c "set ft=c" -c "runtime syntax/2html.vim" -cwqa myfile.c` 

转换成html.

内部分命令行 pipe
-----------------

let i = i | let a=3

另外那就是录制
--------------

:command:`qa` 开始录制，:command:`q` 停止录制  :command:`@a` 调用寄存品中宏


格式化
------

vim 本身支持排版的，vim  自身的help文档就都是 vim 直接排版的。

:command:`:ce` 中间 对齐
:command:`:ri` 右对齐
:command:`:le` 左对齐

:comman:`gq` 执行 *formatexpr*

*echon/echoerr/echoh/echom/* 这一系列的命令可以控制输出的各种格式。

-- Main.GangweiLi - 22 Jun 2012

   * `vim edit tables <http://vimdoc.sourceforge.net/htmldoc/usr&#95;25.html#25.5>`_  %IF{" '现在再看这个文档，也明白了gq的意义，vim 的各种排版命令的意义了' = '' " then="" else="- "}%现在再看这个文档，也明白了gq的意义，vim 的各种排版命令的意义了

既然说到格式排版，就不得不说 打印了，vim 直接打印了。

:command:`:hardcopy`  就打印整个文档了
:command:`:Tohtml` 输出成HTML

并且都还支持部分的输出 

:command:`:10,40harcopy` 只打印  10-40行，同理对于 :command:`:TOhtml` 也是一样的。

diff 下的命令
============
如何比较两个不同的文件，如何比较同一个文件两部分，或者不同文件的两部分。

基本命令
--------
:command:`]c` 跳转到下一个差异处
:command:`]c` 跳转到上一个差异处
:command:`do` 当前的差异merge到另方
:command:`dg` 把差异merge到自己
 

两个文本部分内容的对比
----------------------
可以借助 :command:`g:html_diff_one_file`.

如何添加一条命令
================

两种方式，直接用keymapping 来完成 ex 命令的调用 另一种直接调用vim的函数来实现一个命令行命令 具体参考中级篇的内容

   * `Vim 中文输入法 <http://vim.sourceforge.net/scripts/script.php?script&#95;id&#61;2506>`_  %IF{" 'VimIM 是一个基于Vim的嵌入式中文输入法。  不启动中文输入法，不换模式，就可以输入中文。 不打开弹出式菜单，不敲中文，也可以搜索中文。 　　　　 中文输入与英文输入不再相互折腾。 中文搜索与英文搜索不再分为彼此。并且有云输入 ' = '' " then="" else="- "}%VimIM 是一个基于Vim的嵌入式中文输入法。  不启动中文输入法，不换模式，就可以输入中文。 不打开弹出式菜单，不敲中文，也可以搜索中文。 　　　　 中文输入与英文输入不再相互折腾。 中文搜索与英文搜索不再分为彼此。并且有云输入 
   * `Vimcdoc <http://vimcdoc.sourceforge.net/>`_  %IF{" 'online document' = '' " then="" else="- "}%online document
   * `repeat.vim <http://www.vim.org/scripts/script.php?script&#95;id&#61;2136>`_  , %IF{" 'this enhanc.' = '' " then="" else="- "}% 当需要重复一些操作的时候，最简单的那就是 "."操作。还有一种那就是 * :undojoin* 命令。另外就是看 `vim repeat documentation <http://vimdoc.sourceforge.net/htmldoc/repeat.html>`_  .如果功能更复杂，这个插件可能适合你。
   * `vim-addon-manager <http://blog.harrspy.com/vim-addon-manager>`_  %IF{" '插件管理器，就像debian的包管理机制一样' = '' " then="" else="- "}%插件管理器，就像debian的包管理机制一样
   * `csv.vim <http://www.vim.org/scripts/script.php?script&#95;id&#61;2830>`_  %IF{" 'vim超强的插件，用它之后就像在使用excel一样，但是同时具有Vim的各种功能' = '' " then="" else="- "}%vim超强的插件，用它之后就像在使用excel一样，但是同时具有Vim的各种功能
   * `Conque Shell : Run interactive commands inside a Vim buffer  <http://www.vim.org/scripts/script.php?script&#95;id&#61;2771>`_  %IF{" '自己也开始让vim走上emacs之路了' = '' " then="" else="- "}%自己也开始让vim走上emacs之路了
   * `程序设计时常用的几个参见 <http://edyfox.codecarver.org/html/vimplugins.html>`_  %IF{" 'taglist,A,WinManager,echofunc,complete' = '' " then="" else="- "}%taglist,A,WinManager,echofunc,complete
   * `vimball <http://man.lupaworld.com/content/manage/vi/doc/pi&#95;vimball.html>`_  %IF{" 'vimball 是针对插件制作一种封装工具，就像tar一样' = '' " then="" else="- "}%vimball 是针对插件制作一种封装工具，就像tar一样
   * `Vim 7.3正式版：新功能介绍 <http://xbeta.info/vim73b.htm>`_  %IF{" '&#42;conceal text&#42; Vim支持语法高亮，有的语法高亮需要一些额外的标注符，它们并不是文本内容的一部分。但是实现各种折叠功能，但是这些标记符号如何显示，就可以conceal text 功能。另外更重要的功能，那就是&#42;rnu&#42; 相对行号。用于计算距离的时候是非常方便的。' = '' " then="" else="- "}% *conceal text* Vim支持语法高亮，有的语法高亮需要一些额外的标注符，它们并不是文本内容的一部分。但是实现各种折叠功能，但是这些标记符号如何显示，就可以conceal text 功能。另外更重要的功能，那就是 *rnu* 相对行号。用于计算距离的时候是非常方便的。
   * `vim encoding 文件乱码的问题 <http://edyfox.codecarver.org/html/vim&#95;fileencodings&#95;detection.html>`_  %IF{" '' = '' " then="" else="- "}%
