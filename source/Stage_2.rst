======
中级篇
======



当你对vim的各种接口熟悉了之后，就可以另一部分操作了。
http://learnvimscriptthehardway.stevelosh.com/

   | good start to learn the learning vimscript |  help eval.txt  options.txt |
   | `Learn Vimscript the Hard Way <http://learnvimscriptthehardway.stevelosh.com/ >`_  |
   | `vimUnit  <http://www.vim.org/scripts/script.php?script_id=1125>`_  | vim 下的unit测试工具|


*vim 消息hook* 可以在用map来实现，并且控制各种环境，例如<Leader> <LocalLeader> <Plug><SID>


vim 实现弹出菜单可以用 popup File,tearoff

-- Main.GangweiLi - 18 Jun 2012


*printf*  在需要计算生成数据时，使用printf就会很方便，你把关键的数据用正则式表达出来，然后通过printf来调用户各种函数输出，就可以不需要太多转义字符
<verbatim>
:%s/[0-9]\{2,5}/\=printf("A is %.2f,B is %.2f%,submatch(0)*0.2)/gc
</verbatim>

*如何debug maps起了作用*   当你的插件装多了，就会出现冲突，就时候就要诊断了。
<verbatim>
To see what it is mapped to, and who mapped it, simply ask Vim with:

 :verbose map ys

This will tell you what the mapping invokes, and also which file set up the mapping. From there it should be trivial to figure out which plugin it belongs to.

If it is an insert-mode mapping (for example, the CTRL+S mapping of surround.vim), use:

 :verbose map! <C-S>

See:

http://vim.wikia.com/wiki/Troubleshooting
http://vim.wikia.com/wiki/Debug_unexpected_option_settings
</verbatim>

-- Main.GangweiLi - 22 Jun 2012

*command complete*  there is three key para, the ArgLead,Comline,CursorPos.  :help -complete
<verbatim>
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
</verbatim>

-- Main.GangweiLi - 25 Oct 2012

*字符串反序*
<verbatim>
join(reverse(split("ABCDE",'\zs')),"")
:s/.*/\=join(reverse(split(submatch(0),'\zs')),'')/g
</verbatim>
-- Main.GangweiLi - 02 Nov 2012



*vim vba* 
http://stackoverflow.com/questions/2033078/how-to-install-a-vimball-plugin-with-vba-extension

or  use :help vba to see the document.

-- Main.GangweiLi - 12 Dec 2013


*ptyhon in Vim* :py 就可以直接执行python的命令，同时ilist 打印所有打到的行。类似于Bgrep的功能。

-- Main.GangweiLi - 19 Jun 2014


*:g命令很强大，并且例如偶数行处理， 

<verbatim>
 perform a substitute on every other line
:g/^/ if line('.')%2|s/^/zz / 

" display prettily
:g/<pattern>/z#.5           : display with context
:g/<pattern>/z#.5|echo "=========="  : display beautifully
" Combining g// with normal mode commands
:g/|/norm 2f|r*                      : replace 2nd | with a star

:help  g:  来查看命令的说明，工作原理，两遍的scan,第一次标记，第二次执行命令，并且支持:g!反逻辑。
:help :|  查看多行命令同行的问题。


http://www.softpanorama.org/Editors/Vimorama/vim_piping.shtml

   * `vim 寄存器 <http://www.cnblogs.com/chenyadong/archive/2011/07/11/2103249.html>`_  %IF{" '利用Vi &#61; 表达式可实现自线计算' = '' " then="" else="- "}%利用Vi &#61; 表达式可实现自线计算





How to get insert date or time

   #. one is use strftime("%y-%m-%d") [VimWiki]_
   #. use the python time and calendar module :py:mod:`time` and :py:mod:`calendar`

.. [VimWiki] http://vim.wikia.com/wiki/Insert_current_date_or_time


How to replace tab with blank::

   set autoindent
   set shiftwidth=4
   set tabstop=4
   :%retab  //to replace the tab 



14-07-10
--------

如何跳转文件go to file(gf)
**************************
简单配置一下，可以直接find,grep,并且goto file,vim自身的文档就是利用这个。 这个就是vim file searching rule. 这个可以参考 `editing.txt这个可以参考 `editing.txt`.
设置一下suffixes, `set suffixesadd=.rst`

如何统计选中多少字，词，行，以及字节数
**************************************
这个特别是在统计查看文本的统计数据的特别有用。`{Visual}g  CTRG-G`. 就可以显示了。

如何改当前的文件名
******************
`:file {name}` 就会改当前文件名。

如何在一个新窗口查看一个文件
****************************
`CTRL-W_CTRL-F`就可以了。

如何打开搜索后文件
******************
用`就可以了，并且`=就执行函数。


14-07-14
--------

如何列式操作
************

直接ctrl-v就变成例模式，并且在搜索的时候/\%<23v 就是例模式可以通过`:help \%`得到。


如何重定向的命令的输出
**********************
利用`:redir`来进行控制，或者直接通过quifix window操作::

    cexpr system("ls -al") |copen
    :redir @a
    :g//
    :redir END
    :new 
    :put! a
 

2014-07-25
----------

如何执行shell
*************

这个直接使用conque_term就行了，并且直接利用python为vim开发插件还是容易的，并且`musicbox.vim` 利用gstrem 的python 库直接来实现mp3 播放器。
并且vim 的python中也有vim接口。例如 b=vim.buffer[0]
并且还可以pyfile加载python的模块，并且pydo执行过滤操作。

easytags 非常慢的问题
*********************

直接升级到新版本就好了。这也是解决问题最简单与常用的办法。


sort in vim
***********
自己想要功能，过滤，数字，十六进制，反序，去重复等等功能，这里都有，这样自己以后不需要每一次多步去做了。并且自己经常用的表达式给记录一下。并做成快捷键。
但是shell的排序功能没有分字段与分组的功能，这个可以通过正则表达式来解决。所以功能可以通过`:help sort` 来得到。


2014-07-26
----------

如何另外的打开窗口
******************
vim 支持窗口的任意切开，其实所谓taglist也就是么干的。主要 是`ctrl-W`来控制，上下左右的切，并且交换buffer,以及位置都是很方便的。并且例如VS2013中的Peek也是很容易的。
`sfind` 直接开窗口
`top {cmd}` 可以打开一个新窗口执行命令。
并且还有preview的功能。

远程编辑
********

网速慢的时候，以及想充分利用自己本地vim环境时，可以直接像untralEdit一样远程编辑。`edit remote file by vim <http://tigerlee.me/p/edit-remote-file-by-vim/>`_ . 

但是如vimserver是什么还是没有搞明白。
现在明白了，可以给已经打开vim发送命令。另外查看原始字符可以使用`set list`来查看。

如何用perldoc在vim里
********************

其实也很简单,直接另开一个窗口::
  
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




