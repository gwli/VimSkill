vim 的配色与语法文件
********************

人眼对于彩色的敏感度是远高于纯黑白两色的。不同光照条件下以及不同显示器，对文本的显示效果也是不同的。如何达到最好显示效果提高你文本处理速度呢。

配色是基础，然后是语法配色

color scheme
============

:command:`colorscheme` 就可以看到默认的配色。 

vim 默认有17种配色.  blue, darkblue, default, delek, desert, elflord, evening, koehler, morning, murphy, pablo, peachpuff, ron, shine, slate, torte, zellner . 至于选用哪一种好呢。 这个根据显示器来的 例如我一般用 darblue, 而在diff模式我一般用 *blue* . 

可以用 :command:`:colorscheme <schemename>` 就可以改变配色了。


在计算机里字符都是前景与背景。通过指定前景与背景。来不同的着色效果，这并且着色是可以基于字符的。 
要想彩色，首先等硬件支持才行。gvim不用说了，肯定支持了。对于term来说，现在的term 大部分都是支持的，不能显示彩色一般都是配制有问题，一般只情况下，只要设置一下环境变量就可以了。

  :command:`set-env TERM xterm-color` 或者 :command:`TERM=xterm-color; export TERM`

同时，在vim 里又分gui,与cterm,两种模式下前景与背景。在vim是这么几个概念。
  
.. csv-table:: 
   :header: Name , Content

   cterm,   彩色终端
   ctermfg, 彩色终端的前景
   ctermbg, 彩色终端的背景
   guifg,   图形化界面的前景
   guibg,   图形化界面的背景 

既然已经知道了每一个字符如何着色，一个个上色不就解决了。一个来太麻烦的，最简单的方式，那就是所有字符的前景与背景统一。也大家常见的方式。 另一种方式，对文本定义逻辑块，哪些逻辑结构是什么颜色，由vim来自动给你上色。

vim 中定义了72组逻辑块,大部分都能望文生义 也可以通过 :command:`:so $VIMRUNTIME/syntax/colortest.vim` 查看vim 的支持的分组与本色，并且group也分major与minor,组是可有二层的嵌套的。大的分组可以包含小的分组。

.. csv-table:: 11 major group

   Comment	
   Constant	
   Identifier	
   Statement	
   PreProc	
   Type		
   Special	
   Underlined	
   Ignore		
   Error		
   Todo		

.. include:: /Stage_2/colorgroup.txt


当然每一套的配色方案不需要定义的所有group的颜色，每一组都有默认的颜色， 就像blue配色来说，这就只定义 34  group 的颜色。

vim  主要三类高亮。一个是为特定语言的，一般做法是把这些link 到vim 的自身的分组的。
另个用于所有语言的，还有用 :command:`:hi` 命令行的。


如何控制单个字符的颜色 可以利用 :command:`:syn keyword` 来实现。 当然也可以用 :command:`:echoh` 来控制输出。


语法高亮
========

*usr_06.txt*  是入门的介绍， *usr_44.txt*  是讲如何写语法文件的。 全面深入的讲解是 *syntax.txt* 
然后就是定义逻辑块了，其实也就是编译原理中词法分析了，vim为了加快速度，并没有采用全文分析的方法，而是采用局部分析的方法。

三个基本要素
------------

*keyword*  要根据 :command:`iskeyword` 来定义 的关键字. 

*Match* 用一个正则表式的匹配

*Region*  从两个正达式，一个匹配头一个匹配尾。

并且三者的优先级 keyword>Region>Match.

然后是把这些组 link 连接到 color中那些group上去。

对于简单的当然这样就够了，对于复杂的那还得用到上下文的信息的。这个就用 Nested Items,以及 Following groups,以及 提高复用性的 *clusters* 功能.

例如对于 if, while 语句的配色就需要用到这些了。用到这些就上升语法分析的水平。在 vim的syntax分析 中就是 *contanined* 与 *nextgroup* 两者了。


如何调试
========

当发现在语法高亮非常慢时，你还可以 profiling 一把，看看到底是什么慢了。

:command:`syntime on` 开始计时
:command:`syntime off`  停止
:command:`syntime clar` 清零
:command:`syntime report` 生成report



Vim 是如何识别各个语法文件
==========================

在首行或者尾行用注释添加 `modeline <http://vim.wikia.com/wiki/Modeline_magic>`_  就可以做到。 同时还是记得让vim enble 识别 *modeline*  的功能。 只要在 :file:`.vimrc` 中加一条 :command:`:set modeline`


