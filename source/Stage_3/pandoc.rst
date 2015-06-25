Pandoc
======

`Pandoc <http://johnmacfarlane.net/pandoc/>`_ 现在支持常见的各种文档的格式。并且基本格式之间相互转换。


.. graphviz::
   
   digraph flow {
      reader -> ast -> writer;
   }

可以通过filter来实现对插件语法的支持。但是filter只是在reader阶段的，如果还需要writer阶段的支持话就还需要template的支持了。


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

内部采用 `JSON <http://www.json.org/json-zh.html>`_ 来做为语法的。

分两部分，可以直接从pandocfilters.py中得到。

.. csv-table:: Block

   Plain = elt('Plain', 1)
   Para = elt('Para', 1)
   CodeBlock = elt('CodeBlock', 2)
   RawBlock = elt('RawBlock', 2)
   BlockQuote = elt('BlockQuote', 1)
   OrderedList = elt('OrderedList', 2)
   BulletList = elt('BulletList', 1)
   DefinitionList = elt('DefinitionList', 1)
   Header = elt('Header', 3)
   HorizontalRule = elt('HorizontalRule', 0)
   Table = elt('Table', 5)
   Div = elt('Div', 2)
   Null = elt('Null', 0)

.. csv-table:: inline elements

   Str = elt('Str', 1)
   Emph = elt('Emph', 1)
   Strong = elt('Strong', 1)
   Strikeout = elt('Strikeout', 1)
   Superscript = elt('Superscript', 1)
   Subscript = elt('Subscript', 1)
   SmallCaps = elt('SmallCaps', 1)
   Quoted = elt('Quoted', 2)
   Cite = elt('Cite', 2)
   Code = elt('Code', 2)
   Space = elt('Space', 0)
   LineBreak = elt('LineBreak', 0)
   Math = elt('Math', 2)
   RawInline = elt('RawInline', 2)
   Link = elt('Link', 2)
   Image = elt('Image', 2)
   Note = elt('Note', 1)
   Span = elt('Span', 2)
   
http://www.cnblogs.com/ouxiaogu/archive/2013/09/16/3323507.html



pandoc 手工编译
===============

从官网下载代码,或者直接从github上clone, 然后解压后，直接 :command:`make` 就可以了。

用pandoc转换从twiki到rst
========================



对于它的应用，不仅要知道其reader的处理，还要知道 writer处理，然后才可以真正掌握灵活的处理。

例如pandoc是对于 graphviz 的本身结构识别就太格式，并且reader 的结构，还是不很清楚。
用来起还是比较麻烦。
没有直接处理来的快速。


requiremnt
----------

#. 基本格式都可以转换。
#. graphviz 支持
#. 对于latex的支持。
#. verbatim 的支持。
#. 其他。。



生成一个简单的dailyTodo
=======================

这个使用pandoc 生成一个单页的html还是非常的方便。

pandoc --self-contained Today.rst -o ToDo.html -H default.css 
mutt -e "set content_type=text/html" -s "DailyToDo" email@address < ToDo.html

有点不爽的那就是pandoc对于rst 的指令并不是那么完全。 对于 table并没有支持 csv-table等等，
只支持了简单的 ASCII table.  生成 ascii table也很容易自己实现或者直接使用 python tabulate package. 就行了。再加 rstcloth可以直接生成rst, 然后再pandoc 来生成各种格式。自己需要写一种markdown就够了。 

但是对于一个dailyToDo来说应该是足够了。 现在想想完全用自己买一个todo应该不麻烦。


