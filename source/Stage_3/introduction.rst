

走到这里，词法分析基本上在你的正则表达式的应用应该非常的熟练了。走到这里应该学习词法分析。并且能够一些AST以及巴斯特范式等等。 当然这也不是一个新话题了，所以已经大的成熟稳定的工具与库可以用了。

以及各种格式的之间的相互转换，主要是通过AST与进行翻译。并且大部分的标准语法树的转换都已经有现成的实现，能够看懂拿来用


其实转换起来很简单，只要语法树了建立了，也就是一个

.. code-block:: python

   for node in nodelist:
       switch node_type:
            doing something.


巴斯特范式


从SGML 到HTML再到 XML，再到  YAML以及后面的Markdown语法

troff -> tex -> 可计算文档

.. graphviz:: 

   digraph  flow {
    
   "make tree" -> "parse the Tree" -> "filter"; 
   
   }



