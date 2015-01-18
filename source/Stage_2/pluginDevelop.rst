plugin 插件开发
***************

走到这里已经, vim shell 也会用了，也会用其他语言来操作 vim. 是不是有想写一些东东的欲望了。再动手之前，还是google，不要闭门造车，真的需要完全重新动手的时候不多，大部分的情况是已经有了现成的解决方案，或者有一个半成品不太符合你的需要。只需要动手小修就可以了。

真发现全新的东东需要你来写，机会不容易，好好珍惜吧。

基本知识可以参考 
:command:`:help usr_40.txt  usr_42.txt usr_43.txt usr_44.txt`. 

这里主要分析vim 扩展的开发框架。
各种键盘事件，以及autocomand(在其他的语言中叫event),一般地 commmand. 

人机的接口，消息传递的机制。与外面的交互。

人机接口
========

Normal mode 命令大部分都有对应的 command line, 都是对 *ex* 命令做的wrapper.  如何实现各种键盘的消息。可以查看 :command:`:help map`.
主要有 

.. csv-table::  key map
   :header: command, content

   :map,	Normal Visual and Operator-pending
   :vmap,	Visual
   :nmap,	Normal
   :omap,	Operator-pending
   :map!,	Insert and Command-line
   :imap,	Insert
   :cmap,	Command-line

特殊字符用 <> 来括起来

.. csv-table:: 特殊字符

   <F1> , 表示 F1.
   <CR> , 表示回车键
   <ESC>, 表示退出键

vim 中所有event定义可以查看 :command:`:help autocmd.txt`, 查看当前vim 中的定义可以查看 :command:`:autocmd`. 
并且这些事件还是可以分组的，,然后按组来处理这些event,具体命令可以查看 :command:`:help autocmd-groups`

command
-------
:command:`:command` 不加任何参数，就可以查看当前vim中所有command定义

:command:`:function` 可以查看当前系统中有多少命令


对于 vim内置内对象操作，就是前面已经讲过的 buffer/range/window object. 可以OS的操作，也可以通过 管道，或者python来进行交互。

大部分插件开发流程
==================

#. 先用一堆的 *:map* 来定义各种 command 的key mapping 或者一堆 *AutoCommnds*  hook 各种event, 例如 BufWritePre 等等。
#. *:command* 定义相对应的 command 并调用各个函数的接口
#. 实现各个函数，以及对应补全函数。



先分析一些现成plugin的开发，对于key mapping 最好玩例子那是  $VIMRUNTIME/macro 下那两个游戏了，maze,与hanoi.
完全用key mapping来做的。把这个看明白了，你对 vim 的key mapping就完全掌握了。

`vim calender <http://www.vim.org/scripts/script.php?script&#95;id&#61;52>`_  颜色的配置 就是利用键盘map捕捉键盘并且可以抓取环境变量例如当下的字符等，然后实现消息拦截，利用syn match 实现各种颜色的不同

*vim 消息hook* 可以在用map来实现，并且控制各种环境，例如<Leader> <LocalLeader> <Plug><SID>

vim 实现弹出菜单可以用 popup File,tearoff


*command complete*  there is three key para, the ArgLead,Comline,CursorPos. :command:`:help -complete`

.. code-block:: vim

   It is possible to define customized completion schemes via the "custom,{func}"
   or the "customlist,{func}" completion argument.  The {func} part should be a
   function with the following signature: >
   
   	:function {func}(ArgLead, CmdLine, CursorPos)
   
   The function need not use all these arguments. The function should provide the
   completion candidates as the return value.
   
   For the "custom" argument, the function should return the completion
   candidates one per line in a newline separated string.
   
   For the "customlist" argument, the function should return the completion
   candidates as a Vim List.  Non-string items in the list are ignored.
   
   The function arguments are:
   	ArgLead		the leading portion of the argument currently being
   			completed on
   	CmdLine		the entire command line
   	CursorPos	the cursor position in it (byte index)



如何调试与开发
==============

如何控制vim 的启动。
:command:`vim --noplugin` 可以干净的vim 启动， :command:` vim -u <vimrc>` 加载指定的 .vimrc 配置文件。这个就像windows 的安全模式。
并且vim 本身还有一个debug mode, :command:`vim -D file.txt` 就可以开始 debug.  并且在也可以其他语言一样加断点以及debug. 具体可以查看 :help debug-scripts` .

除了断点debug外，还有log的功能， 可以控制 log的输出等级 例如 :command:`:set verbose=20` . 


vim 更强的是自带一个profiling 功能。  
:command;`:prof start {fname}` 开始 profiling
:command:`:prof pause/contine/stop` 控制 profiling 的进度
:command:`prof  func {attern}` profiling 具体函数

具体详细的功能可以查看 :command:`help profiling`


如果使vim 崩溃了，可以使用 gcc与gdb 来定位与调试 具体可以看 http://vimcdoc.sourceforge.net/doc/debug.html


如何查看map 的工作原理
----------------------

当你的插件装多了，就会出现冲突，就时候就要诊断了。

.. code-block:: vim

   To see what it is mapped to, and who mapped it, simply ask Vim with:
   
   :verbose map ys
   
   This will tell you what the mapping invokes, and also which file set up the mapping. From there it should be trivial to figure out which plugin it belongs to.
    
   If it is an insert-mode mapping (for example, the CTRL+S mapping of surround.vim), use:
   
  :verbose map! <C-S>

  .. seealso:: 
     http://vim.wikia.com/wiki/Troubleshooting
     http://vim.wikia.com/wiki/Debug_unexpected_option_settings


vba 
===

`vimball <http://man.lupaworld.com/content/manage/vi/doc/pi&#95;vimball.html>`_   是针对插件制作一种封装工具，就像tar一样
`vim-addon-manager <http://blog.harrspy.com/vim-addon-manager>`_  插件管理器，就像debian的包管理机制一样


http://stackoverflow.com/questions/2033078/how-to-install-a-vimball-plugin-with-vba-extension
or  use :help vba to see the document.
