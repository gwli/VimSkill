Pandoc
======

`Pandoc <http://johnmacfarlane.net/pandoc/>`_ 现在支持常见的各种文档的格式。并且基本格式之间相互转换。

可以通过filter来实现对插件语法的支持。


.. graphviz::
   
   digraph flow {
      reader -> ast -> writer;
   }

所以输入与输出是独立的，但是中间这个AST 就是异常通用兼容。

#. 初步试验
  
   :command:`pandoc -f twiki abc.txt -t rst -o abc.rst`




直接生成中文的pdf 

  :command:`pandoc demo.rst -o demo.pdf --latex-engine=xelatex -V mainfont="WenQuanYi Micro Hei"`


Pandoc 的template
-----------------

它的模板是存放在 :file:`/usr/share/pandoc-1.9.2/templates` , 同时可以用  :command:`pandoc -D html` 输出
其template 的定义。


Pandoc的 filter
---------------

可以直接用haskell 来写，也可以用其他语言来写。
例如 python, 这里有 `pandocfilters <https://pypi.python.org/pypi/pandocfilters>`_ 


可以通过管道或也可以 :option:`--filter filter.py` 来用。

如看其pandoc 的内部格式
-----------------------

:command:`pandoc -t native test.txt`

其内部结构定义 可以考能 `pandoc type definiton <http://hackage.haskell.org/package/pandoc-types>`_ 


用pandoc转换从twiki到rst
========================

requiremnt
----------

#. 基本格式都可以转换。
#. graphviz 支持
#. 对于latex的支持。
#. verbatim 的支持。
#. 其他。。



