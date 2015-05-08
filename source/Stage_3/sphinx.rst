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

.. code-block:: thml
    
    {% extends "!layout.html" %}
    {% set reldelim1 = '&gt;' %}
    {% block footer %} {% endblock %}


singlehtml
----------

对于sphinx现在没有办法方便做到，singlehtml重新写一个新的builder,不过也应该不是很难。 一个简单的办法，利用模板
直接把需要东东都放在 header. 例如把样式表放在前面。 然后所有需要放东东都放在style.css中就行了。

  
.. code-block:: thml
    
    {% extends "!layout.html" %}
    {% set reldelim1 = '&gt;' %}
    {% block extraheader %}
    {% include "../_static/sytle.css %}
    {% endblock %}


对于数学公式的支持
------------------

ftp://ftp.ams.org/ams/doc/amsmath/short-math-guide.pdf


sphinx 进行二次开发
===================

http://sphinx-doc.org/extdev/tutorial.html#exttut
http://docutils.sourceforge.net/docs/ref/doctree.html

http://sphinx-doc.org/extdev/nodes.html#nodes

内部结构的存储，用node的链表


