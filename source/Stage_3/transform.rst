��ʽת��
========

һ�����һ�£����Ƹ�ʽ��ת����ԱȽ����ף�����ֱ���ôʶԴʵ�ת������������������Ϊ��Ҫ�߼���λ�ͱȽ����ס�

���� twiki �� rst ��ת����

.. ::
   
   ---++++ Header3

��

.. ::

   Header3
   =======
 
������

:command:`:g/---+++ /s/---+++ // |t. |s/.*/\=repeat("=",len(submatch(0))). "\r"/`


�����б��ת����� �� `   \*` �滻�� `#.`  ֱ��

:command:`%s/    \* /#. /` 

���ڸ���һ���Ǿ��� link �ĸ�ʽ�� �滻 

�� ``[[baidu][wwww.baidu.com]]`` �� ```baidu <wwww.baidu.com>`_`` 

������һ���㶨

.. code-block:: vim

   %s/\[\[\(.\{-}\)]\[\(.\{-}\)]]/`\2 <\1>`_/g


���� dot graphviz ������е㸴����

.. code-block:: html
   <dot>
    digraph G {
       a->b;
    }
   </dot>  

��ת����   rst ��ʽ��Ҫ�����������

.. code-block:: vim

   g/<dot>/,/<\/dot>/s/.*/   &/
   g/<dot>/,/<\/dot>/s/.*<dot>/.. graphviz::\r
   %s/<\/dot>/\r/g


���������� vim�ű� ֱ�� :command:`:so twikifilter.vim` �Ϳ��ˡ�
  
.. code-block:: vim
   
   .. include:: /Stage_3/twikifiler.vim

���ǶԸ��ӵķ���Ϊ��λ���Լ�table�ȵȼ򵥵��滻�Ѿ������ˡ� ������ֱ�Ӹ㲻���ˣ�
������Ҫ��һ�����﷨���������㶨�ˡ�


