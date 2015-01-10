Vim 的窗口管理 
**************

Vim 的初始介面看上去很简单了，就像notepad. 但功能没有notepad那样简单的，可以说Vim本身就是功能很强的IDE。build,edit,debug. 都是支持的。 只是方式现在的IDE方式略有不同罢了。当然你可以把它打造各种现代的IDE,网上这样的配置很多，插见还也很多。 但是都以vim的窗口管理为基础的。而vim 窗口管理又是以buffer,window,tab page为是基础。 但是很大一部分人并不知道自身就支持tab page.有些人为使用tab page,还要额外的装插件。 

在学习篇的时候同时参考 :comand:`help windows.txt` , :command:`:help usr_07.txt` 以及:command:`help usr_08.txt`

buffer,window,tab
=================

明白了Vim的窗口管理，就会明白了各种IDE的原理。 各种窗口管理的时候经常用的MVC结构。 M 指的就是buffer,而View就是各个Window,而Vim 就是那个Controller.  tab page是可以多个view. 也就是多个window.
从官方的定义:

#.  A buffer is in-memory text of a file.
#.  A window is a viewport of on a buffer.
#.  A tab page is collection of windows.

简单地说那就是显示与数据分开的。你可以用windows查看同一buffer. 最常用的分屏查看了. 先来试一试吧,看看 :command:`:sp` 会看有什么效果。 水平分成两屏了，不但可以水平的分。还可以垂直的分，就像diff时也要一样, :command:`:vsp` . 并且可以这样不断的分下去。同样在分配的还可指窗口的大小 :command:`:2sp` 看看是什么效果，分出一个只有两行的window的。 垂直分屏同样如此。
知道这些你想分多少窗口，就分多少。就是现在Visual studio 也只是支持只两屏，并且只能是水平的。

另外解释一下，很少用到vim tab page呢，原因是vim 的这种MVC结构已经做的灵活了。一般编辑需求根本不需要这么用到tab page. 那为什么别的编辑却要需要那么多的tab page呢。因为它做不到Vim的这中窗口管理水平。

分屏的能力上面已经说了，一般编辑器也就支持水平两屏的能力，而vim支持水平与垂直的任意的分。进一步呢，正因为显示与数据分开的，在一个window里可以查看任意一个buffer的内容。而一个buffer里内容可在任意多个window里显示。 而一般的编辑器window与buffer是不分的，并且绑定在一起的。想打开buffer的内容就只能开多个window了，也用了所谓的tab page了。 并且少数的编辑器 Visual Studio里OutputsWindow里多个子窗口，例如build,debug等窗口。 再回看到 vim 的tab page的定义。是不是突然明白了一些。原来这些所谓的高级的功能，Vim早就有了。

只要明白了熟悉这些，所谓的那些IDE不像就是多一些自定义的buffer,window而己。很少还需要用tab pages.当你非得在vim中使用 tab page 才能完成的你的功能，要么你没有掌握Vim,要么就是需求真的有那么的复杂。


buffer
------
一般情况一下， 可以这么理解一个文件对应buffer, 当你用 vim 当然打开多个文件的时候 :command:`vim a.txt b.txt c.txt`. 就相应的会有三个buffer产生分别对应 三个文件。你可以通过 :command:`:ls` 来查看打开了多少个buffer. 当然还有特殊的 buffer用于特殊的用途。

`Vim wiki Buffer FAQ <http://vim.wikia.com/wiki/Vim_buffer_FAQ>`_ 

buffer type
^^^^^^^^^^^

vim 五种类型可以通过 :command:`:help buffertype` 查看。

这里只说经常用buffer,以及常用buffer操作。



我们正常打开文件的buffer,自不必说。另外特殊buffer我们用到。 

*command line* buffer, 在编辑 :command:`:XX` 这些命令，要查看记录,也想像正常的文本编辑那样编辑 命令呢。 在 command:`:XX` 之后再按一下 :command:`ctrl+f` 就看到这个buffer了。 你可以看到所有命令的历史记录，并且还可以编辑修改那些命令。 然后你按一下 :command:`Enter` 就执行了。


*unlisted* 这个buffer的不可见，不用来编辑，主要用记录一些file name以及marks. 你用 *mark* 书签的就会用到。 vim 是支持书签功能的，但是只能是单字符的书签。所以最多只能有26个，*a-z* . 在 *Normal mode* 下 :command:`m` 来建立书签。例如 :command:`ma` 就是在当前行插入书签a. 然后用 :command:`'` 来进行书签的跳转。 例如 :command:`'a` 跳转书签a 处，这个功能是分析代码的时候特别的有用。 但是这些书签存在哪里，就是在 unlisted buffer里。

*direcotry* 目录buffer, vim 也是可以做文件浏览器的打开目录的。 直接用 Vim 打开一个目录 试一试便知。

*quickfix* 就像类似于IDE中那个error windows. 一般写代码的模式 都是edit-compile-edit 模式。 当你编译好，他会编译显示错误的信息。 例如 **BGrep** 插件就是利用这个来实现的。这个buffer是不能像正常的文件那样直接读写的。是需要 :command:`:cwindow` 以及 :command:`lwindow`.  详细的用法 :command:`:help quickfix.txt` . 

*help* buffer 主要是用查看help文档的，是不能修改的。 当然也会支持一些特珠格式与语法。 这个你以通过 help文档就可以看出来。

buffer的常用操作
^^^^^^^^^^^^^^^^
:command:`:ls` :command:`:files` :command:`:buffers` 查看已经打开的buffer
:command:`:file` 显示当前buffer的文件全名
:command:`:bn`  在当前窗口显示下一个buffer
:command:`:bp`  前一个
:command:`:b XXX`  显示 xxxx bufffer. 并且支持tab 自动补齐。
:command:`:badd` 打开一个新buffer
:command:`:bdelete` 删除一个buffer
:command:`:sb`  在新窗口编辑buffer.
:command:`:bufdo`  在所有buffer中 执行命令 

.. note::

   在用 *bufdo* 时候，一般在切换buffer时，Vim 会去检查你是否保存改动，如果没有保存，会拒绝切换。 可以通过设置 buffer属性来解决这个问题。
   :command:`:set hidden` 就可以了。

quickfix buffer 常用操作
^^^^^^^^^^^^^^^^^^^^^^^^
:command:`:cc n`  跳到 error n 处
:command:`:cn`    跳到下一个错误处
:command:`:cp`    跳到上一个错误处
:command:`:cl`    显示错误例表



Window 的常见操作
-----------------

对于window的操作有两种模式一种命令模式 如 :command:`:sp` 另外是在 *Normal Mode* 下的Emacs风格的组合键 与 :key:`Ctrl-W` 当前缀的。 所以:key:`Ctrl-W s` 也是分屏的意思。
个人常用command 模式，组合键模式可以参考 :command:`:help opening-windows`.

:command:`:vs` 垂直分屏
:command:`:sp` 水平分屏
:command:`:new` 打一个新window
:command:`:vne` 垂直打开新window  
:command:`:q`  退出当前窗口 当然也支持 *all* 关键字  ， 试一试 :command:`qall`.
:command:`:only` 只留当前窗口

:command:`:lefabove` :command:`:abo` :command:`:rightb` :command:`:bel` :command:`:top` 这些都打开窗的操作  分别表示上下左右。 另如在打左上角打开一个新window 来编辑 a.txt :command:`:top edit a.txt`. 


光标在窗口间的切换
^^^^^^^^^^^^^^^^^^

一般采用组合键 :command:`ctrl-W` 加上 :command:`hjkl` 来进行移动， 例如移到上面一个空口。 :command:`ctrl-W k`
当然也可以用命令 :command:`:winc[md]` 来实现。


窗口的本身的移动
^^^^^^^^^^^^^^^^
:command:`ctrl-W r` 向下或向右移
:command:`ctrl-W R` 向上或者向左移
:command:`ctrl-W x` 与下一个window互换
:command:`ctrl-W K` 把当前window移到顶部
:command:`ctrl-W J` 移到底步
:command:`ctrl-W H` 移到最左
:command:`ctrl-W L` 移到最右
:command:`ctrl-W T` 移到新tab page.


窗口大小不常用不写在这里，具体可以查看 :command:`:help window-resize`. 


tab page 操作
-------------

其实需要用到地方不多，简单的列举最可能用到一些命令吧. 它哪有类似于window的大部分操作查看，编辑，移动等等,用到的话可以查看 :command:`help tabpage.txt` 
:command:`:tabe` :command:`:tabnew` 打开一个新 tab page.
:command:`:tabc` 关闭tab page. :command:`:tabo[nly]` 关闭其他 tab page.

项目文件与tag文件
=================

另外感觉Vim 不像IDE的原因，就是Vim 没有项目文件,例如 .vcxproj 等。 其实是Vim也是有的，并且最加强大与通用。
第一个误区可能就是不知道 vim是支持一次多开多个 文件。 并且还可以UtraEdit那样可以远程编辑,并且还支持各种网络协议具体可以参考 :command:`:help remote.txt` ， 同时一个机器上的多个vim进程还可以就相互发消息与命令的，具体可以查看 vim 的 *server client mode*. 

vim session
-----------

Vim虽然项目文件，但是有一个session文件。它可以保存当前的vim所有的状态，另如mark,register,以及打开的文件和窗口的部局。 下一次打开的就可以继续当前工作，就像没有关闭过一样。
:command:`mkseesion` 生成 session 文件。 下次打开的时候  :command:`vim -S   t.session` 就可以了。 不想每一次保存可以用 :command:`au VimLeave` 实现每一次自动保存session功能。


tags 
----
vim 是支持 ctags以及cscope的，只要生成tags, 并用 :command:`set tags=` 加载了你 tags 文件。 可以查询tag.  详细的用法可以查看 :command:`:help tags` 与 :command:`:help tagsrch.txt` .
常用命令如下:
:command:`tags` 查看tags列表
:command:`Ctrl-]` 跳转到 tag的定义
:command:`ctrl-T` 或者 :command:`ctl-O` 跳回上级tag, Vim tag 支持 tag stack中。
:command:`ts[elect` tag 选择功能 。

另一个好玩的功能那就是 :command:`:ptag`  类似于VS2013中Peek Definition的功能。 当然你要以用 :command:`map` 来映射一个快捷键来操作。


关于自动补全
------------

就光自带的:command:`ctrl+n` 与:command:`ctrl+p` 功能就靠你了。 你用插件来增强一下，那就更强了。大部分情况下自带就功能靠。

vim 可以基于字典补全 :command:`set dictionary=` 来设置字典， 并且用 :command:`ctrl-x ctrl-k` 来补全。

还有行补全 :command:`ctrl-x ctrl-l`.  以及从一行补全 :command:`ctrl-y`,以及从下一行补全 :command:`ctl-e` .

各种IDE的打造 
=============

网络上这种文档到处都是。这里简单取几个例子吧。

Make vim as IDE for python
--------------------------

#. `pydiction <http://www.vim.org/scripts/script.php?script_id=850>`_   使用tab键来进行字典匹配，并且可以自己生成自己。
#. `python语法文件 <http://www.vim.org/scripts/script.php?script_id=790>`_ 
#. `ctags的增强版本，自动生成tags 文件 <http://www.vim.org/scripts/script.php?script_id=3114>`_ 
#. `vim-as-your-ide for python <http://haridas.in/vim-as-your-ide.html>`_ 
#. `his is the pythoncomplete omni-completion script shipped with vim 7.  Updated versions will appear here, as the vim tarballs do not ship with updated runtime files.  <http://www.vim.org/scripts/script.php?script_id=1542>`_ 
#. `pydoc 命令 <http://www.vim.org/scripts/script.php?script_id=910>`_ 

数据库的IDE
-----------

#. `dbtext.vim <http://vim.sourceforge.net/scripts/script.php?script&#95;id&#61;356>`_  可以通过这个插件去访问各种数据库
   



-- Main.GangweiLi - 19 Jun 2012


