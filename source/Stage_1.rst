######
初级篇
######

能在网上找到教程，就不在这里啰嗦了，直接给链接，这里只介绍网上很难找到或者找不到以及自己的一些心得

网上已经相当多的文档了，来介绍的初级水平的，相对比较好的，大可以从 `简明Vim 练习攻略 <http://coolshell.cn/articles/5426.html>`_ . 如果英语好，可以直接原文 `Learn-Vim-Progressively <http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/>`_ .

vim 自身也有很好的教程， 直接查询usermanual中，getStarted 教程，从user_01.txt ~ user_45.txt 一课一课学习就练习就行了。
这里只介绍原理帮助理解与提高,以及遇到常见的困惑。

vim 的第一个要适应的那是 :command:`hjkl` 的使用。网上都有热心的vim fan提供了一个小游戏来练习了，http://vim-adventures.com/ 
当然如果你觉得自己一的vim水平还可以，那就来自测一下 `Best of Vim Tips <http://www.rayninfo.co.uk/vimtips.html >`_ . 这是一个用了vim 22年 老法师的总结，看看你能看懂会用多少。
能看40% 说明你已经过了初级了.

安装
****

对于ubuntu 来说直接发  :command:`apt-get install vim` 就可以了。对于window或者直接源码的安装可以去 www.vim.org 直接下载安装。


vim 工作模式与原理
******************

vim 主要模式有以几种，为什么要区别这些模式，给你一个notepad，然后你想实现一些功能，不是通过菜单项来实现(这个是常见的windows模式)，另一种那快捷键模式，emacs/vim都是采用快捷键的模式，功能众多，如何组织这些快捷键，vim 采用模式+单字符的快速键，emacs采用的组合键的模式。相比较而言，vim的按键次数要少于emacs.


.. csv-table:: vim mode
   :header: mode, abbr,remark

   Normal mode, n, 默认的模式，不可以编辑，但可以上下左右移动以及跳转
   Visual mode, v, 编辑选择模式，这个对于块操作会特别有用，可以按行选，也可以按列选，以及按照字符选择
   Insert mode, i, 这个就是一般编辑器可以输入文字了
   Command-line mode, c, 就是那些Ex commands(":"),以及搜索/,?,以手filter command(!).
   

buffer,window,tab
=================



.. include:: Stage_1/vim_configurationManagement.rst
.. inlcude:: Stage_1/vim_projectManagement.rst




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


*paste* =:set paste= Put Vim in Paste mode.  This is useful if you want to cut or copy
	some text from one window and paste it in Vim.  This will avoid
	unexpected effects.
	Setting this option is useful when using Vim in a terminal, where Vim
	cannot distinguish between typed text and pasted text.

-- Main.GangweiLi - 22 Jun 2012


*:version* 可以给出这个版本的详细信息

-- Main.GangweiLi - 22 Jun 2012


*"+* 系统剪贴板寄存器

-- Main.GangweiLi - 22 Jun 2012


*echon/echoerr/echoh/echom/* 这一系列的命令可以控制输出的各种格式。

-- Main.GangweiLi - 22 Jun 2012


*Text object motions/selection* 
<verbatim>
aw,iw,aW,iW,as,is,ap,ip,],),ab,<,at,....
</verbatim>

-- Main.GangweiLi - 22 Jun 2012


*Vim Ex 命令* 可以用=:help holy-grail= 来查看 
*查看所有模式下的命令* 可以用 =:help index.txt= 来查看

-- Main.GangweiLi - 22 Jun 2012


Vim 重定向  example
<verbatim>
When I print result of the execution of global command into register:
:redir @a
:g/pattern/
:redir END
and then insert the register in buffer
"ap
</verbatim>

-- Main.GangweiLi - 22 Jun 2012


设置标题
<verbatim>
set title titlestring=%F%y%m%r
</verbatim>

-- Main.GangweiLi - 22 Jun 2012


 how to display the total number of differences between the files?

-- Main.GangweiLi - 22 Jun 2012


*vim 跨两个显示器显示*
<verbatim>
. Run "gvim -N -u NONE -i NONE"
. Put the Application window across the boundary between
  the two monitors
. Enter command ":vsplit"
Workaround is :set guioptions+=l, :set guioptions-=L, :set guioptions+=r
or :set guioptions-=R.

When splitting window vertically, Vim shows scrollbar.  It causes window
resize.  When resizing window, Vim try to keep window completely on
screen.  And currently it is performed by comparing window position with
workarea (not entire screen).  Therefore, Vim window always moves when
it is across the boundary the two monitors.
</verbatim>
详情见gmail

-- Main.GangweiLi - 22 Jun 2012




highlighting search results from within a function   
The problem is that the search register is saved before a function
call and restored after, so when your function returns the search
register no longer contains "this".  See ":help
function-search-undo".

see gmail

-- Main.GangweiLi - 22 Jun 2012


*shell* 
可以在vim 加载不同shell, 设置不同&shell值，相关于参数都可以设置的。

-- Main.GangweiLi - 16 Sep 2012


*vim 启动参数*
直接起用 - 可以直接从stdin接受输入的，可以直接接受管道来的值。+可直接加行号打开就直接跳到目标行。-oOp 可以同时打开多个窗口与tab pages.   
 | + | 行号 |
 | +/ | 正则表表达式 |
 | +{} | 命令 相当于-c |
vim -dev 直接当做串口使用。 根据自己的应用场景来挖掘吧。
这个功能在porting的时候，你要不断去对比，查找问题，最后输入你可以输入到vim 中来这样可以大大的加快你的速度。另外那就是 find  -iname 不区分大小，然后 find . -iname "xfadfa" |xargs |grep af | vim 这样大大加快的自己的速度。
并且在添加几个系统命令，例如常用地址，变成变量，就会很方便。

-- Main.GangweiLi - 16 Sep 2012


*随时随地打开高亮*  在看一些东西的时候，会很方便，例如\t 时就会很方便，set hls(highlightsearch) 或者使用:hl 命令打开各种高亮。对于查错的时候很方便。

-- Main.GangweiLi - 16 Sep 2012


*分块操作*
以前都是按行操作，结构化，定义好分界符是可以按块操作，:g,:v都可以。

-- Main.GangweiLi - 16 Sep 2012


*改变swap文件路径*  通过设置 &dir的值。

-- Main.GangweiLi - 16 Sep 2012


*减少的应用* inoreabbr,iabbr 在case的时候如何用上这些功能，能够快速打出不，而不是去搜索。

-- Main.GangweiLi - 16 Sep 2012


*QuickFix的使用技巧*
cn,cnf,ln,lnf, 经常修改的时候经常会这个模式，知道这些命令可以大大的提高你的效率。

-- Main.GangweiLi - 16 Sep 2012


*读写文件*
writefile, readfile函数。当你生成一些固定长度的格式，就可以使用repeat函数来实现。

-- Main.GangweiLi - 16 Sep 2012


*comments* 格式，有的时候可以借用某种语言的注释格式，vim支持最好的那就是C。

-- Main.GangweiLi - 16 Sep 2012


*状态栏*你可以使用　&statusline, rulerformat 来定制它。

-- Main.GangweiLi - 16 Sep 2012

[[amplitude phase estimation (APES)] [ftp://www.sal.ufl.edu/ywang]] 这个是谱估计的,但是现在还没有下载到,据说有二维估计,先保存下吧.




*scrolling*
关于屏幕的滚动，之前那些zz,zl,zh,zt以及ctrl-e/d,F,Y,u等等，以及多屏同步滚动问题都是在这里的。设置scrollingbind,以及syncbind功能。所有的说明都:help scroll.txt 就可以查到了。或者:help CTRL-D。
Vim scrolling功能也是极强的，目前我们差不能够想到了方式它都有了。同时现在对于Emacs自己也有了新的认识，那就是当你只专注一个方面的时候用Vim就比较好，但是当你经常在不同系统之间进行切换的时候，你就会发现在利用Emacs会更好，就像XWindows一样。

-- Main.GangweiLi - 25 Jan 2013






</verbatim>
*set showcmd*   显示选择了多少行

-- Main.GangweiLi - 19 Jun 2014


*http://vim.wikia.com/wiki/Modeline_magic* modeline  设置格式
当modline 不起作用时，在.vimrc中加一条set modeline

    
   * `vi.mm <%ATTACHURL%/vi.mm>`_ : vi.mm

  



   * `vim calender <http://www.vim.org/scripts/script.php?script&#95;id&#61;52>`_  %IF{" '利用键盘map捕捉键盘并且可以抓取环境变量例如当下的字符等，然后实现消息拦截，利用syn match 实现各种颜色的不同' = '' " then="" else="- "}%利用键盘map捕捉键盘并且可以抓取环境变量例如当下的字符等，然后实现消息拦截，利用syn match 实现各种颜色的不同
   * `Vim 中文输入法 <http://vim.sourceforge.net/scripts/script.php?script&#95;id&#61;2506>`_  %IF{" 'VimIM 是一个基于Vim的嵌入式中文输入法。  不启动中文输入法，不换模式，就可以输入中文。 不打开弹出式菜单，不敲中文，也可以搜索中文。 　　　　 中文输入与英文输入不再相互折腾。 中文搜索与英文搜索不再分为彼此。并且有云输入 ' = '' " then="" else="- "}%VimIM 是一个基于Vim的嵌入式中文输入法。  不启动中文输入法，不换模式，就可以输入中文。 不打开弹出式菜单，不敲中文，也可以搜索中文。 　　　　 中文输入与英文输入不再相互折腾。 中文搜索与英文搜索不再分为彼此。并且有云输入 
   * `Vimcdoc <http://vimcdoc.sourceforge.net/>`_  %IF{" 'online document' = '' " then="" else="- "}%online document
   * `vim edit tables <http://vimdoc.sourceforge.net/htmldoc/usr&#95;25.html#25.5>`_  %IF{" '现在再看这个文档，也明白了gq的意义，vim 的各种排版命令的意义了' = '' " then="" else="- "}%现在再看这个文档，也明白了gq的意义，vim 的各种排版命令的意义了
   * `repeat.vim <http://www.vim.org/scripts/script.php?script&#95;id&#61;2136>`_  , %IF{" 'this enhanc.' = '' " then="" else="- "}% 当需要重复一些操作的时候，最简单的那就是 "."操作。还有一种那就是 * :undojoin* 命令。另外就是看 `vim repeat documentation <http://vimdoc.sourceforge.net/htmldoc/repeat.html>`_  .如果功能更复杂，这个插件可能适合你。
   * `vim-addon-manager <http://blog.harrspy.com/vim-addon-manager>`_  %IF{" '插件管理器，就像debian的包管理机制一样' = '' " then="" else="- "}%插件管理器，就像debian的包管理机制一样
   * `csv.vim <http://www.vim.org/scripts/script.php?script&#95;id&#61;2830>`_  %IF{" 'vim超强的插件，用它之后就像在使用excel一样，但是同时具有Vim的各种功能' = '' " then="" else="- "}%vim超强的插件，用它之后就像在使用excel一样，但是同时具有Vim的各种功能
   * `Conque Shell : Run interactive commands inside a Vim buffer  <http://www.vim.org/scripts/script.php?script&#95;id&#61;2771>`_  %IF{" '自己也开始让vim走上emacs之路了' = '' " then="" else="- "}%自己也开始让vim走上emacs之路了
   * `程序设计时常用的几个参见 <http://edyfox.codecarver.org/html/vimplugins.html>`_  %IF{" 'taglist,A,WinManager,echofunc,complete' = '' " then="" else="- "}%taglist,A,WinManager,echofunc,complete
   * `vimball <http://man.lupaworld.com/content/manage/vi/doc/pi&#95;vimball.html>`_  %IF{" 'vimball 是针对插件制作一种封装工具，就像tar一样' = '' " then="" else="- "}%vimball 是针对插件制作一种封装工具，就像tar一样
   * `Vim 7.3正式版：新功能介绍 <http://xbeta.info/vim73b.htm>`_  %IF{" '&#42;conceal text&#42; Vim支持语法高亮，有的语法高亮需要一些额外的标注符，它们并不是文本内容的一部分。但是实现各种折叠功能，但是这些标记符号如何显示，就可以conceal text 功能。另外更重要的功能，那就是&#42;rnu&#42; 相对行号。用于计算距离的时候是非常方便的。' = '' " then="" else="- "}% *conceal text* Vim支持语法高亮，有的语法高亮需要一些额外的标注符，它们并不是文本内容的一部分。但是实现各种折叠功能，但是这些标记符号如何显示，就可以conceal text 功能。另外更重要的功能，那就是 *rnu* 相对行号。用于计算距离的时候是非常方便的。
   * `UTL.VIM <http://www.vim.org/scripts/script.php?script&#95;id&#61;293>`_  %IF{" '可以根据URL 打开各种文件，就像浏览器一样。可以打开.pdf,.jpg,.doc等' = '' " then="" else="- "}%可以根据URL 打开各种文件，就像浏览器一样。可以打开.pdf,.jpg,.doc等
   * `xml.vim 插件  <http://www.vim.org/scripts/script.php?script&#95;id&#61;1397>`_  %IF{" '编辑xml文件的利器，主要实现机制就是 &#42;omnifunc&#42; 的补全功能' = '' " then="" else="- "}%编辑xml文件的利器，主要实现机制就是 &#42;omnifunc&#42; 的补全功能
   * `vim 离合器 <http://hackaday.com/2012/06/21/building-a-clutch-for-vim/>`_  %IF{" '利用脚来实现键盘操作' = '' " then="" else="- "}%利用脚来实现键盘操作
   * `vim latex 插件 <http://atp-vim.sourceforge.net/>`_  %IF{" '' = '' " then="" else="- "}%
   * `GUI&#95;W32 <http://man.chinaunix.net/newsoft/vi/doc/gui&#95;w32.html>`_  %IF{" 'vim window设手册' = '' " then="" else="- "}%vim window设手册
       <verbatim>
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
       </verbatim>
   * `fuzzyfinder <http://hi.baidu.com/sowill/item/7621706e50c957156995e6a2>`_  %IF{" 'VIM中的文件查找利器' = '' " then="" else="- "}%VIM中的文件查找利器
   * `vim encoding 文件乱码的问题 <http://edyfox.codecarver.org/html/vim&#95;fileencodings&#95;detection.html>`_  %IF{" '' = '' " then="" else="- "}%
   * `vim debugger python <http://www.2maomao.com/blog/win32-vim-debug-python/>`_  %IF{" '下一个目标把vim 打造一个调试前端。' = '' " then="" else="- "}%下一个目标把vim 打造一个调试前端。 vimgdb
   * `vim debugger for perl <http://search.cpan.org/~kablamo/Vim-Debug-0.8/lib/Vim/Debug/Perl.pm>`_ 
   * `vimgvim支持对齐线.html <http://www.vimer.cn/2012/05/vimgvim&#37;E6&#37;94&#37;AF&#37;E6&#37;8C&#37;81&#37;E5&#37;AF&#37;B9&#37;E9&#37;BD&#37;90&#37;E7&#37;BA&#37;BF.html>`_  %IF{" 'set cc&#61;1,3,5,就直接出现标尺了' = '' " then="" else="- "}%set cc&#61;1,3,5,就直接出现标尺了
   * `给 vim 增加查字典功能 <http://hi.baidu.com/ilqxd9l0vj/item/c1abc2d4665ba0e1b3f777a6>`_  %IF{" '这个很实用在写与看文档的时候' = '' " then="" else="- "}%这个很实用在写与看文档的时候
   * `TxtBrowser&#34; plugin is a pla <http://www.vim.org/scripts/script.php?script&#95;id&#61;2899>`_  %IF{" '' = '' " then="" else="- "}%

   
