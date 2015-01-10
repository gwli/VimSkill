vim 配置管理
************

玩Vim的人都会改vim 配置，但是做的好没有几个。大部分都是怎么在网上抄一段，直接放在.vimrc文件里，最后这个文件奇大无比，并且vim的启动也变得很慢，这个还是还好的，更烦的那是不配置冲突了，例如对.c文件的配置与.java是冲突的，假如这些.c 用四个字符缩进的，而.java是用3字符缩进的。有的人都是每一次手工去改vimrc. 每切换一次环境就重写一次。很是麻烦，其实vim早就给你解决了这个问题，只是大部分没有深入了解而己。
这一节的主要内容:

..  
  引用下面各节的标题


vim 配制文件路径
================

要想知道配置在哪里, 直接 :command:`:help vimrc` 就可以找到，vim的配置文件分两层，global and local:
#. *linux*, global 一般是在 :file:`/etc/vim/vimrc` 或者 :file:`/usr/share/vim`.  local 是一般都是 :file:`$HOME/.vim/vimrc` 下面
#. *Windows*  global 是一般是在 :file:`$VIM/vimrc` 这个一般是在 :file:`C:\Program Files (x86)\Vim`, local同linux一样，不过 windows下的$HOME是指的 :file:`C:\Users\<userName>` 

.. note::

   当然你想自定义你的配置文件的位置，你可以配置 vim的编译选项.
   
   .. code-block:: make
      
      make CPPFLAGS=-DSYS_VIMRC_FILE=\\\"/etc/vim/vimrc\\\"   # setting this cause vim to look for the /etc/vimrc file that containts the global vim settings. Normally this file is looked for in /usr/share/vim.

每一个目录里都会有一个 :file:`README.txt` ,如果使用直接查看这个文档就可以了。

.. csv-table:: Vim configuration directory
   :header: Name, Content , Remark
   
   doc, 所有vim的帮助文档，几乎所有你需要的信息都可以在这里找到,你用 :command:`:help XXXX` 都是从这里得到 
   colors, 这里是所有配色文件,如果改变默认的配色可以用 :command:`: colorscheme XXX` 我最常用那就是darkblue
   compiler,这里是vim为各种编程语言配置compiler的地方,具体可以查看 :command:`help write-compiler-plugin` 
   ftdetect, 文件类型检测配置，vim启动会自动加载这个下面的脚本, 手工设置:command:`set filetype=XX` , :command:`filetype detect` 就会加载这个下面的脚本
   ftplugin,各种与文件类相关的plugin,例如cpp.vim,c.vim, ant.vim等等。
   indent, 各种类型文件缩进的配置，如果你想自定义自己的缩进文件可以来这里操作。具体可以查看 http://man.chinaunix.net/newsoft/vi/doc/indent.html
   keymap, 不同的语言的键盘配置,一般情况很少用到 
   plugin, 通用功能插件都放在这里,例如BGrep插件都是放在里。
   syntax, 所有的语法高效文件都是放在里,如果你想自定义语法文件可以在这里用你熟悉的语法文件为参考来修改

.. note::
   ft -> file type


写配置文件正确的做法，例如一个新的XXX类型添加各种配置

#. 在ftdetect目录下创建一个 XXX.vim 并且写入如下内容
   
   .. code-block:: vim
      
      au BufRead,BufNewFile *.XXX	set filetype=XXX

   .. note::

      这里光不光可以提指文件名，还可以通配文件路径

#. 在ftplugin目录下创建 XXX.vim, 你想要配置都放在这里，例如缩进以及常用快捷键的map定义以及自定义的小函数啊。

#. 简单配置都可以在ftplugin/XXX.vim完成，复杂的配置例如语法文件等，你可以自己实现一个语言法文件保存为 :file:`syntax/XXX.vim`. 
   也可以直接在 :file:`ftplugin/XXX.vim` 直接采用现成语法文件，例如C语言的语法文件。如何直接加载呢如下 
   
   .. code-block:: vim
      
      runtime! syntax/C.vim

#. 如果想做再好一些呢，把这些配置文件用git管理起来，放在github上面。这样出了错可以随时恢复，git clone 就搞定了。     

mode line
---------
另一种自动识别的机制那就是用mode line. 那就是开头或者结尾用注释的方式来写vim mode line. 如下

.. code-block:: vim
   
   vim: textwidth=78 wrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab


插件安装方法
============

通过上述的讲解，现在明白了插件的原理，你自己下载的插件直放在对应的目标里就可以了，一般每一个插件自带的README都告诉你放在哪个目录里。
一般都是在www.vim.org 下载插件，现在有往github移的趋势。


vim 配置文件是如何加载的
========================

具体可以查看 :command:`:help starting.txt`

