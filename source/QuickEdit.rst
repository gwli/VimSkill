快速编辑
********



How to get insert date or time

   #. one is use strftime("%y-%m-%d") [VimWiki]_
   #. use the python time and calendar module :py:mod:`time` and :py:mod:`calendar`



How to replace tab with blank::

   set autoindent
   set shiftwidth=4
   set tabstop=4
   :%retab  //to replace the tab 



14-07-10
========

如何跳转文件go to file(gf)
==========================
简单配置一下，可以直接find,grep,并且goto file,vim自身的文档就是利用这个。 这个就是vim file searching rule. 这个可以参考 `editing.txt这个可以参考 `editing.txt`.
设置一下suffixes, `set suffixesadd=.rst`

如何统计选中多少字，词，行，以及字节数
======================================
这个特别是在统计查看文本的统计数据的特别有用。`{Visual}g  CTRG-G`. 就可以显示了。

如何改当前的文件名
==================
`:file {name}` 就会改当前文件名。


如何打开搜索后文件
==================
用`就可以了，并且`=就执行函数。


14-07-14
========

如何列式操作
============

直接ctrl-v就变成例模式，并且在搜索的时候/\%<23v 就是例模式可以通过`:help \%`得到。


如何重定向的命令的输出
======================
利用`:redir`来进行控制，或者直接通过quifix window操作::

    cexpr system("ls -al") |copen
    :redir @a
    :g//
    :redir END
    :new 
    :put! a
 

2014-07-25
==========

如何执行shell
=============

这个直接使用conque_term就行了，并且直接利用python为vim开发插件还是容易的，并且`musicbox.vim` 利用gstrem 的python 库直接来实现mp3 播放器。
并且vim 的python中也有vim接口。例如 b=vim.buffer[0]
并且还可以pyfile加载python的模块，并且pydo执行过滤操作。

easytags 非常慢的问题
=====================

直接升级到新版本就好了。这也是解决问题最简单与常用的办法。


sort in vim
===========
自己想要功能，过滤，数字，十六进制，反序，去重复等等功能，这里都有，这样自己以后不需要每一次多步去做了。并且自己经常用的表达式给记录一下。并做成快捷键。
但是shell的排序功能没有分字段与分组的功能，这个可以通过正则表达式来解决。所以功能可以通过`:help sort` 来得到。


to do
=====

#. `repeat.vim <http://www.vim.org/scripts/script.php?script&#95;id&#61;2136>`_   当需要重复一些操作的时候，最简单的那就是 "."操作。还有一种那就是 * :undojoin* 命令。另外就是看 `vim repeat documentation <http://vimdoc.sourceforge.net/htmldoc/repeat.html>`_  .如果功能更复杂，这个插件可能适合你。
#. `Vim 7.3正式版：新功能介绍 <http://xbeta.info/vim73b.htm>`_   *conceal text* Vim支持语法高亮，有的语法高亮需要一些额外的标注符，它们并不是文本内容的一部分。但是实现各种折叠功能，但是这些标记符号如何显示，就可以conceal text 功能。另外更重要的功能，那就是 *rnu* 相对行号。用于计算距离的时候是非常方便的。
#. `vim encoding 文件乱码的问题 <http://edyfox.codecarver.org/html/vim&#95;fileencodings&#95;detection.html>`_ 
