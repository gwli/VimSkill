Vim 编程
********

vim 有自身的脚本语言，同时也支持其他常见的语言，例如 python, tcl,perl等等。 当你熟悉这些之后，你基本上就
可以对vim二次开发了，例如一些插件。既使不写插件，这些同样有用。语言的支持 再加上那些丰富的命令，都可实现
支持只用命令很难实现或者实现不了功能。 就非常的容易了。

另一方便，对于初级篇中很东东，都不但知其然，并知其所以然。用起来就会更加的高效。当然对于
出现的问题的，也少一些的茫然，而不是只会google了。

Vim shell
=========
每一个语言都都有变量， vim 支持标量，以及列表以及字典。 然后就是内在结构。主要是寄存器。
各种的 options.
再有函数的支持，以及一些内建函数的支持。

基本语法就不讲了，可以参考 :command:` :help usr_41.txt`.  如何添加命令 :command:`:help usr_40.txt`.

只讲一些主要的，vim的shell比较简单的，复杂的实现是可以用ptyhon等语言来实现的。对于vim shell 还有一个增强版本 https://github.com/xolox/vim-shell 

变量的作用域
------------

vim 的变量作用域是通过前缀来识别的简单的分为四类:

.. csv-table:: 作用域

   b:name, variable local to a buffer
   w:name, variable local to a window
   g:name, global variable (also in a function)
   v:name, variable predefined by Vim
   s:name, script-variable local the script file


Vim 编程模型
============


特殊的变量
----------
主要三种特殊的变量，环境变量，寄存器，options. 分别用不同前缀来表示。 而正常的变量是不需要前缀的。

寄存器
------


环境变量
^^^^^^^^
**$NAME**  表示环境变量，是可读可写的，如果你运行时修改环境变量，就这样修改。 :command:`:set $NAME=VALUE` 。

option
^^^^^^
**&name** vim 里各种option, 例如 :command:`:set auto=`,以及:command:`set encoding=utf8` 在代码中需要用 *&* 前缀来读取。

寄存器
^^^^^^
**@r** 用到最多的寄存器。用@前缀来读取，你在初级篇的学习那些命令再加上寄存器，就可以实现十分强大的功能。

Vim 中大量的寄存器保存各种各样信息，以与CPU寄存器的作法，有过之而不及。

一共有九种寄存器 具体用法可以查看  :command:`:h registers` 
#. The unnamed register ""
#. 10 numbered registers "0 to "9
#. The small delete register "-
#. 26 named registers "a to "z or "A to "Z
#. four read-only registers ":, "., "% and "#
#. the expression register "=
#. The selection and drop registers ``"*, "+ and "~ ``
#. The black hole register "_
#. Last search pattern register "/

下面通过例子来讲解常用寄存器的用法, 当你需要用一些特殊的直接来查就行了。

查看当前所有寄存器的值 :command:`:reg`


匿名寄存器
""""""""""
 
主要是  :command:`d c s x y p` 等命令的默认寄存器，如果没有指令的寄存器的，最后一次的 d 删除的内容就放在 这里，同理p粘贴命令的内容也是从这里来的。

数字寄存器
""""""""""

这十个是 ring buffer, 主要用来 yank 与delete 命令。 0 最新一次操作内容，1 次新操作内容，以及类推。

这个对于常规剪切功能更强的应用，一般的编辑器的剪切功能只对最后剪切有效。vim 没有专门剪切命令，是通过这些数字寄存器再删除与粘贴命令实现的。
并且功能更加，那就是支持默认支持最近十次的剪切功能。 

:command:`"1p` 例如粘贴倒数二次的剪切的内容

.. note::  " 是双引号

如果想更多，利用命名寄存器了

26 个命名寄存器 a-z
^^^^^^^^^^^^^^^^^^^

命令行操作的需要用 `"` 来指定，例如

:command:`"ad` 的删除的内容放在寄存器 a
:command:`"byy` 把当前行yank 到寄存器 b 中
:command:`"bp`  把寄存器b中内容放在当前位置

在宏录制的时候也是可以可把命令存在命名的寄存器中 

:command:`qc` 开始宏的录制，并放在 寄存器c中。

*"+* 系统剪贴板寄存器,如何用命令行vim外部的东东copy到vim里，
:command:`"+p` 就可以了。



剩下的这几个对象，在编程中会遇到比较多，不像前面的寄存器在平时命令也会用到很多。几个对象主要有 buffer object, Range object,Window object, Tab page objects, vim.bindeval object.
基本原理都在初级篇讲过了，但是只是讲其编程接口。

并且主要基于python 来讲吧，具体的可查看 :command:`help :python` .

可以直接通过 :command:`pydo` 直接执行 python的命令。
 :command:`pydo <<EOF` 直接代码块
 :command:`pfile filename` 直接执行python 脚本

来一个简单的例子

.. code-block:: python

   :pydo if line: return "%4d: %s"%(linenr,line)

*:pydo* 默认的输入参数是 line, linenr, 具体可考 :command:`:help :pydo`

重要的时，可以利用 每条 :pydo 都在一个session里，第一条 *:pydo* 会建立这个session. 也就是说下面的代码是工作的。 

.. code-block:: vim
   
   :pydo import os
   :pydo import os.listdir(.)

vim 的python会有一个vim module.

另一个方式那就是直接在 :ConqueTerm python,打开一个python。如果直接import vim那就完美了。

.. csv-table:: vim module
   :header: Name, Content, Example

    vim.windows, all the windows, vim.windows[0] 第一个窗口
    vim.buffers, all the buffers, vim.buffers[0] 每一个buffer
    vim.current, current 指针 包含当前所有状态, vim.current.window当前的窗口 vim.current.buffer 当前的buffer
    vim.current.buffer[m:n], 当前buffer中m到n行
    vim.comand, 可以用来执行Ex命令,vim.command("%s/lgw/zgg")
    vim.eval, 执行vim命令并取得返回值, :command:`:py str = vi.eval("12+12")
    vim.bindeval,执行vim命令并返回 ptyhon对象
    vim.tabpages, vim中再tabpages.
    vim.vars vim.options, vim中变量以及options
    vim.current.range,这个会经常用到对应就是visual选择模式。


编程脚本在日常的应用
====================

让 vim 像 sed,与awk 一样工作 
----------------------------

如何加载脚本 :command:`:so[ource]  scripts.vim` 就像bash 中的 source 命令一样的。
这样就可以用 vim来代替 sed,与awk.

``vim -`` 直接可以直接读标准输入的，

``vim -c cmd`` 直接可以执行命令， 我们直接用上面的加载命令就不就可以像sed，awk 这样的加载脚本了。
你用命令行能做的，在脚本都能做。 甚至可以直接 ``vim -W`` 记录所有命令到文件，然后直接加载。当然也可以在vim `q` 来把命令都录制在寄存器，然后把寄存器内容写入到文件就行了。


如何插入序列
------------
例如我们我们要一个case 编号要求 case_1-> case_1000 用如下方法
先把 case_XX 复制1000 行，然后替换

.. code-block:: vim
   
   :let i = 1
   :g/case_/s/XX/\=i/g| let i = i + 1

更好玩，利用vim 生成各种测试数据见 http://www.ibm.com/developerworks/cn/linux/l-cn-vimcolumn/index.html

如何插入模式使用寄存器
----------------------

:command:`ctrl-r` 就可以直接读取值了，
:command:`ctrl-r#` 例如现在当前位置插入本文件的文件名, *#* 是特殊寄存器的存当前文件名。

如何插入模式下直接调用vim的函数
-------------------------------

这个就要用到 *=* 表达式寄存器了，例如现在我在此计算 cos(10)是多少。
:command:`ctrl-r=cos(10)` 就是得到了-0.839072 
:command:`ctrl-r=strfile("%c")` 就是插入一个日期.

这里是有一个bug的，那就是表达式寄存器是不认的 :pydo命令的。
:command:`ctl-r=pydo os.listdir(".")` 是会报错的
