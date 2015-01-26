vim 配置管理
************

玩Vim的人都会改vim 配置，但是做的好没有几个。大部分都是在网上抄一段，直接放在.vimrc文件里，最后这个文件奇大无比，vim的启动也变得很慢。这个还是还好的，更烦的是配置冲突，例如对.c文件的配置与.java是冲突的，(这里有两个假如，假如这些.c 用四个字符缩进的，而.java是用3字符缩进的）。于是有人就每次手工去改vimrc，每切换一次环境就重写一次。很是麻烦，其实vim早就解决了这个问题，只是大部分人没有深入了解而己。
这一节的主要内容

..

   引用各节标题（这是什么？）

vim 配制文件路径
================

要知道配置在哪里， 直接 :command:`:help vimrc` 就可以找到，vim的配置文件分两层，global and local。*linux*中的 global 文件一般在 :file:`/etc/vim/vimrc` 或者 :file:`/usr/share/vim`. local 文件一般都在:file:`$HOME/.vim/vimrc` 下面。 *Windows* 中 global 一般在 :file:`$VIM/vimrc` 路径一般是在 :file:`C:\Program Files (x86)\Vim`， local同linux一样，不过 windows下的$HOME指的是 :file:`C:\Users\<userName>`.
（这里应该讲讲怎么打开这个文件，我感觉我使用:file:`$VIM/vimrc`, 并不能打开文件）
.. note::

   如果你需要自定义你的配置文件，你可以配置 vim的编译选项.
   
   .. code-block:: make
      
      make CPPFLAGS=-DSYS_VIMRC_FILE=\\\"/etc/vim/vimrc\\\"   # setting this cause vim to look for the /etc/vimrc file that containts the global vim settings. Normally this file is looked for in /usr/share/vim.

每个目录里都会有一个 :file:`README.txt` ，如果使用直接查看这个文档就可以了。
(这里不连贯，是什么)
.. csv-table:: Vim configuration director：
   :header: Name, Content , Remark
  
   doc， 所有vim的帮助文档，几乎所有你需要的信息都可以在这里找到，命令 :command:`:help XXXX`. 
   colors， 这里是所有配色文件，如果改变默认的配色可以用 :command:`: colorscheme XXX` 我最常用那就是darkblue
   compiler，这里是vim为各种编程语言配置compiler的地方，具体可以查看 :command:`help write-compiler-plugin` 
   ftdetect， 文件类型检测配置，vim启动会自动加载这个下面的脚本， 手工设置:command:`set filetype=XX` ， :command:`filetype detect` 就会加载这个下面的脚本（这个是什么作用？）
   ftplugin，各种与文件类相关的plugin，例如cpp.vim，c.vim, ant.vim等等（是不是latex也有这样的插件？？）。
   indent， 各种类型文件缩进的配置，如果你想自定义自己的缩进文件可以来这里操作。具体可以查看 http://man.chinaunix.net/newsoft/vi/doc/indent.html
   keymap， 不同语言的键盘配置，一般情况很少用到。 
   plugin， 通用功能插件都放在这里，例如BGrep插件都是放在里。
   syntax， 所有的语法高效文件都是放在里（这是什么?），如果你想自定义语法文件可以在这里用你熟悉的语法文件为参考来修改。

.. note::

   ft -> file type


写配置文件正确的做法，例如一个新的XXX类型添加各种配置

#. 在ftdetect目录下创建一个 XXX.vim 并且写入如下内容
   
   .. code-block:: vim
      
      au BufRead，BufNewFile *.XXX	set filetype=XXX

   .. note::

      这里不仅可以提指文件名，还可以通配文件路径（后面是什么？）

#. 在ftplugin目录下创建 XXX.vim， 需要的配置都放在这里，例如缩进、常用快捷键的map定义、以及自定义的小函数。

#. 简单配置都可以在ftplugin/XXX.vim完成，复杂的配置例如语法文件等，可以自己一个语法文件实现，保存为 :file:`syntax/XXX.vim`. 
   也可以直接在 :file:`ftplugin/XXX.vim` 采用现成语法文件，例如C语言的语法文件。其主要通过如下命令加载：
   
   .. code-block:: vim
      
      runtime! syntax/C.vim

#. 进一步地可以把这些配置文件用git管理起来，放在github上面这样出了错可以随时恢复。


*mode line*

另一种自动识别的机制那就是用mode line. 那就是开头或者结尾用注释的方式来写vim mode line. 如下

.. code-block:: vim
   
   vim: textwidth=78 wrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab


插件安装方法
============

通过上述的讲解，现在明白了插件的原理，你自己下载的插件直放在对应的目标里就可以了，一般每一个插件自带的README都告诉你放在哪个目录里。
一般都是在www.vim.org 下载插件，现在有往github移的趋势。


vim 配置文件是如何加载的
========================

具体可以查看 :command:`:help starting.txt` 这个在 :command:`:help syntax.txt` 里更详细的描述。
