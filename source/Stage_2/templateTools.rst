template
********

template 主要是解决就是复用问题。

最简单的template就是先写几个占位符，然后再加上一个全局替换就搞定了。

复杂的一些，加入一些嵌套与包含关系，例如include指定等等。

再复杂一些，支持 循环与条件。

再复杂一些，可以外界系统进行交互，例如 os, 或者数据库。
这个的实现，一般都是内嵌一个语言的解析器来搞定的。基本一个语言都有各种数据的接口。


list 的生成
===========

这个最简单，只要加一个简单的计数，复杂一点再加上indent。 无非进去一层重新计数。
采用深度优先的来解决




table的生成
===========

各个看起来有点难，其实也很简单，对于html,xml的表格就不用说了，直接生成指令就行了。
对于字符表格生成，看起来很难。只直接用一个列表来存储一个table,一行是一个元素。

单行表格生成
------------

#. 统计的各行各例的字符数，
#. 找到各例的最大值
#. 按照样式以及对齐方式逐行生成就行

.. code-block:: python
   
   #count
   zip(*[[len(item) for item in row] for row in grid])

 
http://stackoverflow.com/questions/11347505/what-are-some-approaches-to-outputting-a-python-data-structure-to-restructuredte

并且在python 中有现成的 tabulate 包，可以直接生成各种表格。


对于编码的处理
==============

对于vim, 有 ``encoding``, ``fileencoding`` 等等。
对于python来编程语言来都说，在读写文件的时候都会有一个  encoding属性，平时大家都不写，对于C/C++来说，就是那些IOStream大显身手的
时候。
如何快速查看编码，直接用浏览器打开就查看了，它是支持编码最全面的。

同时需要转换的可以用iconv来实现批量的转化。
