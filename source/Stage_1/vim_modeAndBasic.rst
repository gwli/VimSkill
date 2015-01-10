vim 工作模式与原理
******************

入门问题
========

在文本的编辑的主要是查找替换编辑，难点在于精确处理，快速的精确处理那就更难了，主要是以下几个问题。

#. *不要多改*  这个在替换操作最明显，每个编辑器都替换的操作，但是一般人不敢用，主要是原因是怕多改了。把不需要改的也改了。  
#. *不要少改*  当需要修改的地方当超过一屏的时候，需要出现的漏改的现象。 鼠标一滚，不就不知道滚到哪里。这个时候就需要Visual mode,以及下面 字词句功能
#. 就是快速，如何来保证快速了，就要靠vim中的命令了。 

而vim 的各种模式与命令都是为快速精确的处理而设计的。

工作模式
========

vim 主要模式有以几种，为什么要区别这些模式，给你一个notepad，然后你想实现一些功能，不是通过菜单项来实现(这个是常见的windows模式)，另一种那快捷键模式，emacs/vim都是采用快捷键的模式，功能众多，如何组织这些快捷键，vim 采用模式+单字符的快速键，emacs采用的组合键的模式。相比较而言，vim的按键次数要少于emacs.


.. csv-table:: vim mode
   :header: mode, abbr,remark

   Normal mode, n, 默认的模式，不可以编辑，但可以上下左右移动以及跳转
   Visual mode, v, 编辑选择模式，把它翻译成选择模式会有助于理解 这个对于块操作会特别有用，可以按行选，也可以按列选，以及按照字符选择
   Insert mode, i, 这个就是一般编辑器可以输入文字了
   Command-line mode, c, 就是那些Ex commands(":"),以及搜索/,?,以手filter command(!).
   
当你学会了基本了 :command:`hjkl` 之后，以及简单的编辑之后，你并不会觉得这样操作与别的编辑器有什么区别呢。并且你也会觉得这样会也没有多快。


vim 的字词句
============

字词句是一个抽象说法，vim主要擅长英语字符的处理，还是按照英语的单位来讲。也正是因为有了这些逻辑结构才使vim 变得强大。一般的编辑器是没有这些概念的。例如Word里才有了段落的概念。一些类似word的处理都是需要标记语言来实现格式排版的。vim仅依靠这些基本的概念就能够一些基础的排版了。具体的排版指令见 :command:`help =` .  并且逻辑块的概念之后，可以用有 *折行* 的功能。 但是vim 没有页的概念，所以也不能显示页号的操作。
学习这一部分同时参考 `user_03.txt` . 

.. csv-table:: vim 的文本单位
   :header: "Name", "Abbr",Remark

   字母letter,l,单个字母
   单词,w, 以空格 
   句,W, 与标点符为分隔符 
   段,{  },以空行为分隔符
   行,  , 以换行符为分隔符
   屏,  ,窗口屏幕的大小 的为单位

以后移动编辑都是这些单位的，除了字母本身，没有头与尾之外。其他几个单位都是有的。

.. csv-table:: ediit command
   :header:"Name", "Remark"

    修改, c C s S
    插入, i/I 
    跳转, [ ' %
    查找, / ? * # f t
    删除, x d 
    复制,y Y 
    粘贴,p P


有了这些，就可以精确的跳转。再加上Visusal mode 就可以精确的选择了。 vim 命令操作标准模式。

**range:command:parameter**

#. 在不同场景模式range会不同默认值  
#. 大部分命令的会有大小写两种,意义是不一样的 


光标的移动
^^^^^^^^^^
下面仅以移动为例，其他的命令以此类推

字母的移动
""""""""""

:command:`h l` 是默认是按照letter移动, 如何一次移动 5字符呢，试试 :command:`5h` . 是不是向前移动了5个字符，参考上面的命令格式去理解。 下面各种逻辑单位的移动也都是这样的加前缀的来重复的。

单词的移动
""""""""""

:command:`w e b`, 是单词移动，:command:`w` 是移到下一个单词，:command:`b` 是移动单词的开头， :command:`e` 移动单词的结尾

句子的移动
""""""""""
:command:`W` 是句子移动, 同上 :command:`W` 是移到下一个句子，:command:`B` 是移动句子的开头， :command:`E` 移动句子的结尾

段落的移动
""""""""""

:command:`{` 向前移一个段落 ，:command:`}` 向后移一段落

在跳转指令 :command:`[ {` 就会跳到最近的{ 里。这在类c语言的编程语言里直接代码块的开始与结尾的非常方便。

行的移动
""""""""
:command:`jk` 是默认单行移动，:command:`10j` 向下移10行。 :command:`0`  行首， :command:`$` 行尾, :command:`^` 行首第一个非空字符， :command:`_` 行尾最后一个非空字符 

屏的移动
""""""""
:command:`ctrl+F` 向下滚一整屏，:command:`ctrl+B` 向上滚一整屏，:command:`ctrl+D` 向下滚半屏， :command:`ctrl+U` 向上滚半屏，:command:`ctrl+Y` 向下滚一行，:command:`ctrl+E` 向上滚一行。


跳转
^^^^
行内跳转
""""""""
:command:`f` 正向找， :command:`t` 是反向找,当然前面也是可以加数字的。例如 :command:`2fa` 打到当前行中第二个a. 这些命令什么会用到，当一行特别长的时候就会用到，直接跳转你又怕弄错了行。 当一行不不超过20字符时，可能用途不大了。


行的跳转
""""""""
:command:`gg` 跳到第一行，:command:`G` 到最后一行。 :command:`100gg` 跳到第100行。 :command:`50%` 跳到50%处，这个是行数计算的百分比。

对于:ed 命令都是基于行来操作。:ed 命令后面会有专门的讲。

块的跳转
""""""""
:command:`%` 跳转匹配的括号，这个是对于查找括号缺失的时候非常的方便。
:command:`[{` 跳到块首，:command:`[}` 跳转到块尾。 当然 :command:`[` 在不同的编程言下有不同的用途，可以查看各种tag,具体可以查看 :command:`help [`.

屏内的跳转
""""""""""
:command:`zt` 跳到屏幕的首行，:command:`zb` 跳到屏幕的尾行，:command:`zz` 跳到屏幕中央，这个一条最有常用。

另一条常用的命令那就是打开折行 :command:`zr` 具体可以参考教程 :command:`help user_28.txt`. 


任意的跳转
""""""""""
:command:`/` 通过搜索来跳转，至于正则表式放在正则表达式来讲。这里后些特殊特别有用法。这个命令前面同样可以加数字，例如 :command:`2/abc` 从当前位置开始搜索第二个 abc. :command:`/abc/;/123/`, 找到abc之后再找123. 
:command:`/test/e` 跳到匹配的词尾 ,再试一试 :command:`/test/+1`, :command:`/test/s+2`, command:`/test/b-3`. 
:command:`/\%>199l\%<300llimit` 在199行与300行之间找limit

.. note::
   
   当然跳转不仅这些，例如 *buffer* 之间的跳转，以及文件的之间的跳转，以及基于tag的跳转。

对于修改指令简单说一下，也都是可以操作这些逻辑单位为基础的
:command:`caw`, 修这个单词，同时对比 :command:`cw` :command:`c3w` 以及 :command:`c/abc`. 以及这些以上命令混合使用。

:command:`dd` 删除一行, :command:`d3l` 删除三个字符，:command:`3dd` 删除三行。

:command:`g ctl+G`
对于复制粘贴 类似于删除，自行去试一试。
:command:`yy` 复制一行, :command:`y3l` 复制三个字符 :command:`3yy` 复制三行。
:command:`pp` 粘贴一行, :command:`p3l` 粘贴三个字符 :command:`3pp` 粘贴三行。

在vim是没有剪切命令，是由删除命令与粘贴复制组合的。因为vim 的删除命令自动把删除的内容放在ring buffer中，这个ring buffer,保存最近十次的删除，分别用0-9表示。关于寄存器的具体用法会在中级篇里详细的讲。

.. note::

   *paste*  :command:`:set paste` Put Vim in Paste mode.  This is useful if you want to cut or copy
   	some text from one window and paste it in Vim.  This will avoid
   	unexpected effects.
   	Setting this option is useful when using Vim in a terminal, where Vim
   	cannot distinguish between typed text and pasted text.
   
-- Main.GangweiLi - 22 Jun 2012

选择操作
^^^^^^^^
前面所讲的移动与跳转命令都在 *Vsiual Mode* 都是适用的。在 *Visual Mode* 下还有几个特殊的操作 :command:`'<` 代表选中块的块首，command:`'>`代表选中块的块尾。 :command:`ctrl+o` 可以选中块的块首与块尾之间跳转。

按字符选 :command:`v`.  按行选 :command:`V`. 按列选 :command:`ctrl+V`. 如何精确选列 :command:`\%<20c` 前20列
