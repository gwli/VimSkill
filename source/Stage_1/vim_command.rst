vim 的命令
**********

vim 的大部分命令都是来自于ex，而ex 是 ed 的改进版。包括sed的命令集基于ed。所以也就会发现这几个工具的命令集都差不多。并且RCS的版本格式也这样的，并且diff的输出也支持ex命令，其实patch也是利用ex的命令集的。

基本命令行前面都已经讲过了，都在 :command:`:exu` 中.  或者直接查看
:command:`:help index.tx`

本书只讲一些经常会用到，但是前面又没有提到命令， 按照模式来讲吧

Vim经常被人吐槽的各种模式的切换。特别一个小的改动就来回切换切回来。vim 针对这些也有了一些改进，在每一种模式都会通过组合键提供临时执行其他模式的命令，执行完自动切回当前模式。 

各个模式下的命令
================

Insert mode 
-----------

:command:`CTRL-D` 缩进的，是按照 tab长度来走的。
:command:`CTRL-Y` 自动复制上行对应列的字母
:command:`CTRL-E` 自动复制下行对应列的字符
:command:`CTRL-O` 临时切到normal mode 执行一条命令，再自动切回insert mode，相反过程是 :command:`r` 替换当前的字母然后切回到Nomral模式。
:command:`CTRL-X submode` 自动补行，就是用它实现的 :command:`CTRL-X CTRL-L`. 
:command:`CTRL-X s` 自动拼写检查
:command:`CTRL-X CTRL-U` 按照自定义的补全函数来补全

另外那就是通过定义 缩小来加速输入
*inoreabbr，iabbr* 在case的时候如何用上这些功能，能够快速打出不，而不是去搜索。

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

   若想用 CTRL-X， CTRL-C 和 CTRL-V， 这些标准的 MS-Windows 操作方式怎么办？有办法！
   用 $VIMRUNTIME\mswin.vim 这个脚本解决。你可以把下面这条命令放到你的 _vimrc 文
   件里:

       :command:`source $VIMRUNTIME/mswin.vim`

   这样一来 CTRL-C 就变成"复制"命令了，但是原先的 CTRL-C 是中止操作的命令呀，没
   办法，用 CTRL-Break 来结束任务吧。

   因为 CTRL-V 被用做"粘贴"，所以你不能用它来启动"可视 块"的选择模式，不过可
   以用 CTRL-Q 代替。你也可以在"插入"模式和"命令"模式中用 CTRL-Q 代替 CTRL-V。
   但是 CTRL-Q 常常被用作控制流，这时候它在某些终端下就不好用了。
    
   .. seealso::  `vim_windows手册 <http://man.chinaunix.net/newsoft/vi/doc/gui&#95;w32.html>`_  

窗口的操作
==========

:command:`CTRL-W` 为前缀
:command:`CTRL-W f` 另开一个窗口打开当前光标下文件名
:command:`CTRL-W z` 关掉预览窗口
:command:`CTRL-W |` 设置窗口的宽度

更全面的命令可以见 :command:`:h CTRL-W` 。 


一些有用的查询命令
------------------

:command:`g CTRL-G` 查看光标的位置信息，在第几行，第几列，第几个char，第几个word，第几个byte.
:command:`gv`  重新选中最近一次选择对象
:command:`ga`  查看当前字符的编码的十进制，十六进制，八进制显示
:command:`gm`  跳到这一行的中间
:command:`gq`  格式化
:command:`gx`   执行当前光标下的命令
:command:`gs`   sleep 函数默认是1秒
:command:`g~[motion]`  翻转当前行大小写
:command:`gU[motion]`  变大写， :command:`gu[motion]` 变小写


一些有用的z 命令
:command:`zr` 打开折行
:command:`z=` 给出拼写提示


visual mode
-----------

command:`a"` 高亮一个双引号字符串，同理还的有 :command:`a'`， :command:`a(` 等等 这在代码除错的时候非常用。
command:`J` 当前所选所有行，拼接成一行，这个在字符串与列表之间的转换时非常的方便，直接用替换就可以实现split的功能。


ex 命令
=======

前面大部分命令都有对应的 ex 命令。 全部的ex 命令可以查看:command:`:h holy-grail`

这里只讲最有用命令

ex 命令管道
-----------

:help :|  查看多行命令同行的问题。

let i = i | let a=3


命令 :g
-------

.. code-block:: vim
    
   :[range]g[lobal]{pattern}/[cmd]

:help  g:  来查看命令的说明，工作原理，两遍的scan，第一次标记，第二次执行命令，并且支持:g!反逻辑。

当你想条件式的替换的时候，利用 :command:`:g` 是再合适不过了。 这个会在后面的例子体现出来，这个命令再加上宏录制功能，就无非强大了。
另外那就是用查询了，例如  

命令 :t
-------

例如把自把标题一下自动添加=号呢

.. code-block::
   
   header1
     ||
     \/
   header1
   =======

:command:`:t.|s/./=/g` 就可以了，如果标题是中文  :command:`t.|s/./==/g`

（是否哪里说明这个命令的含义？）

处理偶数行处理 
^^^^^^^^^^^^^^
perform a substitute on every other line

:command:`:g/^/ if line('.')%2|s/^/zz /`

display prettily
^^^^^^^^^^^^^^^^

.. code-block:: vim

   :g/<pattern>/z#.5           : display with context
   :g/<pattern>/z#.5|echo "=========="  : display beautifully


如何在ex 执行其他模式的命令
===========================

Combining g// with normal mode commands

.. code-block:: vim
   
   :g/|/norm 2f|r*     " replace 2nd | with a star





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

vim 默认使用的shell 是可以通过 :option:`shell` 得到， 想在vim 加载不同shell， 设置不同&shell值就可以了。


!!， ! 可以 external cmd 交互。

.. seealso:: http://www.softpanorama.org/Editors/Vimorama/vim_piping.shtml


vim 本身也是可以当做sed，或者awk 一样的命令来用的。 首先要看一下其 *启动参数*
#. - 可以直接从stdin接受输入的，可以直接接受管道来的值。
#. *+* 可直接加行号打开就直接跳到目标行。

   .. csv-table::
   
     + ， 行号 
     +/ ， 正则表表达式 
     +{} ， 命令 相当于-c

#. -oOp 可以同时打开多个窗口与tab pages.   
#. vim -dev 直接当做串口使用。 根据自己的应用场景来挖掘吧。

这个功能在代码移值的时候特别有用，你要不断去对比，查找问题，最后输入你可以输入到vim 中来这样可以大大的加快你的速度。另外那就是 find  -iname 不区分大小，然后 :command:`find . -iname "xfadfa" |xargs |grep af | vim` 这样大大加快的自己的速度。
并且在添加几个系统命令，例如常用地址，变成变量，就会很方便。

:command:`vim -E -s -c "let g:html_no_progress=1" -c "syntax on" -c "set ft=c" -c "runtime syntax/2html.vim" -cwqa myfile.c` 

转换成html.



另外那就是录制
--------------

:command:`qa` 开始录制，:command:`q` 停止录制  :command:`@a` 调用寄存品中宏


格式化
------

vim 本身支持排版的，vim  自身的help文档就都是 vim 直接排版的。

:command:`:ce` 中间 对齐
:command:`:ri` 右对齐
:command:`:le` 左对齐

:command:`gq` 执行 *formatexpr*

*echon/echoerr/echoh/echom/* 这一系列的命令可以控制输出的各种格式。

-- Main.GangweiLi - 22 Jun 2012

   * `vim edit tables <http://vimdoc.sourceforge.net/htmldoc/usr&#95;25.html#25.5>`_  %IF{" '现在再看这个文档，也明白了gq的意义，vim 的各种排版命令的意义了' = '' " then="" else="- "}%现在再看这个文档，也明白了gq的意义，vim 的各种排版命令的意义了

既然说到格式排版，就不得不说 打印了，vim 直接打印了。

:command:`:hardcopy`  就打印整个文档了
:command:`:Tohtml` 输出成HTML

并且都还支持部分的输出 

:command:`:10，40harcopy` 只打印  10-40行，同理对于 :command:`:TOhtml` 也是一样的。

diff 下的命令
=============

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


 how to display the total number of differences between the files?

-- Main.GangweiLi - 22 Jun 2012


如何添加一条命令
================

两种方式，直接用keymapping 来完成 ex 命令的调用 另一种直接调用vim的函数来实现一个命令行命令 具体参考中级篇的内容

