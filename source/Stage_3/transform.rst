格式转换
========

一般情况一下，类似格式的转换相对比较容易，可以直接用词对词的转换，并且两都是以行为主要逻辑单位就比较容易。

例如 twiki 到 rst 的转换。

.. ::
   
   ---++++ Header3

到

.. ::

   Header3
   =======
 
可以用

:command:`:g/---+++ /s/---+++ // |t. |s/.*/\=repeat("=",len(submatch(0))). "\r"/`


对于列表的转换最简单 把 `   \*` 替换成 `#.`  直接

:command:`%s/    \* /#. /` 

对于复杂一点那就是 link 的格式的 替换 

由 ``[[baidu][wwww.baidu.com]]`` 到 ```baidu <wwww.baidu.com>`_`` 

可以这一条搞定

.. code-block:: vim

   %s/\[\[\(.\{-}\)]\[\(.\{-}\)]]/`\2 <\1>`_/g


对于 dot graphviz 插件就有点复杂了

.. code-block:: html
   <dot>
    digraph G {
       a->b;
    }
   </dot>  

来转换成   rst 格式。要就三条语句了

.. code-block:: vim

   g/<dot>/,/<\/dot>/s/.*/   &/
   g/<dot>/,/<\/dot>/s/.*<dot>/.. graphviz::\r
   %s/<\/dot>/\r/g


这里是整个 vim脚本 直接 :command:`:so twikifilter.vim` 就可了。
  
.. code-block:: vim
   
   .. include:: /Stage_3/twikifiler.vim

但是对复杂的非行为单位，以及table等等简单的替换已经不行了。 这样的直接搞不定了，
就是需要更一点点的语法分析了来搞定了。


