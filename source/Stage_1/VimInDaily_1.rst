
各种IDE的打造 
=============

网络上这种文档到处都是。这里简单取几个例子吧。

对于个语言支持最基本就是 comments 的支持，而vim 是能够自动实别的大部分的语言的comments,主要是通过  
*comments* 格式，有的时候可以借用某种语言的注释格式，vim支持最好的那就是C。

-- Main.GangweiLi - 16 Sep 2012


*状态栏* 

你可以使用　&statusline, rulerformat 来定制它。

-- Main.GangweiLi - 16 Sep 2012




Make vim as IDE for python
--------------------------

#. `pydiction <http://www.vim.org/scripts/script.php?script_id=850>`_   使用tab键来进行字典匹配，并且可以自己生成自己。
#. `python语法文件 <http://www.vim.org/scripts/script.php?script_id=790>`_ 
#. `ctags的增强版本，自动生成tags 文件 <http://www.vim.org/scripts/script.php?script_id=3114>`_ 
#. `vim-as-your-ide for python <http://haridas.in/vim-as-your-ide.html>`_ 
#. `pythoncomplete omni-completion  <http://www.vim.org/scripts/script.php?script_id=1542>`_ 
#. `pydoc 命令 <http://www.vim.org/scripts/script.php?script_id=910>`_ 
#. `vim debugger python <http://www.2maomao.com/blog/win32-vim-debug-python/>`_  下一个目标把vim 打造一个调试前端。 vimgdb

Make vim as IDE for C
---------------------

`程序设计时常用的几个参见 <http://edyfox.codecarver.org/html/vimplugins.html>`_  taglist,A,WinManager,echofunc,complete

Make vim as IDE for perl
------------------------

如何用perldoc在vim里
^^^^^^^^^^^^^^^^^^^^

其实也很简单,直接另开一个窗口

..code-block:: vim
    :function Mfunc(myarg)
    :let s:text = a:myarg
    :if exists(s:text)||strlen(s:text)!=0
    :top new "perl help"
    :let s:doc = system("perldoc -t ".s:text)
    :put! = s:doc
    :else
    :echo "no topic"
    :endif
    :endfunction

    :command -nargs=? My :call Mfunc('<args>')
    :map <F2> :execute ":My " . expand("<cWORD>")<CR>gg
    :map <F3> :q!<CR>


Make vim as terminal 
--------------------

#. `Conque Shell : Run interactive commands inside a Vim buffer  <http://www.vim.org/scripts/script.php?script&#95;id&#61;2771>`_  自己也开始让vim走上emacs之路了


浏览器
------

#. `UTL.VIM <http://www.vim.org/scripts/script.php?script&#95;id&#61;293>`_  可以根据URL 打开各种文件，就像浏览器一样。可以打开.pdf,.jpg,.doc等
#. `TxtBrowser&#34; plugin is a pla <http://www.vim.org/scripts/script.php?script&#95;id&#61;2899>`_  

#. `xml.vim 插件  <http://www.vim.org/scripts/script.php?script&#95;id&#61;1397>`_  编辑xml文件的利器，主要实现机制就是 &#42;omnifunc&#42; 的补全功能
#. `vim 离合器 <http://hackaday.com/2012/06/21/building-a-clutch-for-vim/>`_  利用脚来实现键盘操作
#. `vim latex 插件 <http://atp-vim.sourceforge.net/>`_ 
#. `fuzzyfinder <http://hi.baidu.com/sowill/item/7621706e50c957156995e6a2>`_  VIM中的文件查找利器
#. `csv.vim <http://www.vim.org/scripts/script.php?script&#95;id&#61;2830>`_  vim超强的插件，用它之后就像在使用excel一样，但是同时具有Vim的各种功能
#. `vim debugger for perl <http://search.cpan.org/~kablamo/Vim-Debug-0.8/lib/Vim/Debug/Perl.pm>`_ 
#. `vimgvim支持对齐线.html <http://www.vimer.cn/2012/05/vimgvim&#37;E6&#37;94&#37;AF&#37;E6&#37;8C&#37;81&#37;E5&#37;AF&#37;B9&#37;E9&#37;BD&#37;90&#37;E7&#37;BA&#37;BF.html>`_  :command:`:set cc=61;1,3,5` 就直接出现标尺了
#. `给 vim 增加查字典功能 <http://hi.baidu.com/ilqxd9l0vj/item/c1abc2d4665ba0e1b3f777a6>`_  这个很实用在写与看文档的时候
#. `Vim 中文输入法 <http://vim.sourceforge.net/scripts/script.php?script&#95;id&#61;2506>`_  VimIM 是一个基于Vim的嵌入式中文输入法。  不启动中文输入法，不换模式，就可以输入中文。 不打开弹出式菜单，不敲中文，也可以搜索中文。 　　　　 中文输入与英文输入不再相互折腾。 中文搜索与英文搜索不再分为彼此。并且有云输入 


设置标题
--------

:command:`:set title titlestring=%F%y%m%r`



远程编辑
--------

网速慢的时候，以及想充分利用自己本地vim环境时，可以直接像untralEdit一样远程编辑。`edit remote file by vim <http://tigerlee.me/p/edit-remote-file-by-vim/>`_ . 

但是如vimserver是什么还是没有搞明白。
现在明白了，可以给已经打开vim发送命令。另外查看原始字符可以使用`set list`来查看

数据库的IDE
-----------

#. `dbtext.vim <http://vim.sourceforge.net/scripts/script.php?script&#95;id&#61;356>`_  可以通过这个插件去访问各种数据库
   




vim 跨两个显示器显示
--------------------

.. code-block:: vim

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



