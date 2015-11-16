sphinx
******

template
========

sphinx 的模板用的是jinjia,类似于perl template toolkit，主要上下左右几部分，每一部分二次二次的代理，

例如sphinx 对整个分成了五部分

#. doctype
#. linktags
#. extrahead   如果想独立的html可以把style 放在这里。
#. rootrellink
#. document 对于 body同时还一个page.html的模板。定义一下就个树了。其实也很简单。

例如就是封面，章，节等等。 

.. code-block:: html
    
   {% extends "!layout.html" %}
   {% set reldelim1 = '&gt;' %}
   {% block footer %} {% endblock %}


sphinx 能够实现的只用一个template engine都很容易实现。只要稍微把模板灵活一些，其实就搞定了。

.. code-block:: python

   class doc:
         foreword = ""
         chapters =[]
         end=""
   class chapter:
         sections = []
         titile = ""

   foreach print anyformat


现在sphinx 已经把文档结构给解析好了。只需要实现reader 就行了。

而sphinx采用的是node 的机制。
http://sphinx-doc.org/latest/extdev/nodes.html
采用vistor 模式。这样也就是每节点类型，都会有一个自己的解析函数，每一个vistor 要实现自己需要处理的node.
http://zh.wikipedia.org/wiki/%E8%AE%BF%E9%97%AE%E8%80%85%E6%A8%A1%E5%BC%8F


所以写builder也就容易了，reader已经把结构给读好了，我只要这些vistor方法实现一遍即可。
而在Visoter用的是 `dispatch_vist(),walkabout` 采用getattr的方法来判定这里是有由

默认的方法是原样copy,当然也可以skipNode. 可以这样的丰富。

``vist_...`` 的方法， 在writers/html.py里面是一目了然。writer 就像包管理中的dpkg,而builder 就像是apt-get.
中间的连接用的是 publish pattern, pub.reader,以及pub.writer的方法。
http://docutils.sf.net/docs/api/publisher.html
从这里就可以看publish_parts 就看协议包的构造了，如何来构造了。并且每一块对应关系就有了。只要把流程搞明白了，如何实现采用什么样的pattern是自然而然的事情。
http://docutils.sourceforge.net/docs/peps/pep-0258.html
而整个sphinx 是建立在docutils 的基础上的。

哈哈，原来那些unit 测试都是采用这样的方法的设计的，采用vistor模式。

设计方法很简单

.. code-block:: python
   
   import test
   clslist = getclstst(test)
   for cls in clslist:
          name = cls.__class_.__name__
          setup = getattr(cls,"setup__")
          run = getattr(cls,"run__")
          close = getattr(cls,"close__")
          print "begin testing {}" %(name)
          print "  setup: {} " %(name)
          setup()
          print "  run:{} " %(name)
          run()
          close()
          print "  finish{} " %(name)



而sphinx 的内部结构可以http://docutils.sourceforge.net/docs/ref/docutils.dtd 这时得到，同时对应，docutils/nodes.py就可以了。


其被背后用是https://docs.python.org/2/library/xml.dom.minidom.html，其实起来了也很简单。
其整个的实现方法，那就在nodes.py里，每一个节点就是一个tag,并且都会指定自己的accept方法。

都每个都有startag,以及endtag.
http://docutils.sourceforge.net/docs/ref/doctree.html
singlehtml
----------

对于sphinx现在没有办法方便做到，singlehtml重新写一个新的builder,不过也应该不是很难。 一个简单的办法，利用模板
直接把需要东东都放在 header. 例如把样式表放在前面。 然后所有需要放东东都放在style.css中就行了。

  
.. code-block:: html
    
    {% extends "!layout.html" %}
    {% set reldelim1 = '&gt;' %}
    {% block extraheader %}
    {% include "../_static/sytle.css %}
    {% endblock %}


对于数学公式的支持
------------------

ftp://ftp.ams.org/ams/doc/amsmath/short-math-guide.pdf


生成pdf
=======

默认的documentclass只有两种 howto,manual, 或者自定义，没有也行
但如果title 指定了中文，同时指定了manual就报错了，应该是manual对中文的支持不够。

添加对文献的支持用 bibtex 参考 http://sphinxcontrib-bibtex.readthedocs.org/en/latest/usage.html。
现在的问题是添加文献，没有索引号，但是第一版是可以的，看看是哪里配置做了。

sphinx 进行二次开发
===================

http://sphinx-doc.org/extdev/tutorial.html#exttut
http://docutils.sourceforge.net/docs/ref/doctree.html

http://sphinx-doc.org/extdev/nodes.html#nodes

内部结构的存储，用node的链表



单个文本的转换，可以用http://docutils.sourceforge.net/docs/api/cmdline-tool.html
这些实现，当然也可以采用pandoc来实现。
