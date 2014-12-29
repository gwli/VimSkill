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

