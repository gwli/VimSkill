************
vim ���ù���
************

��Vim���˶����vim ���ã��������ĺ�û�м������󲿷ֶ�����ô�����ϳ�һ�Σ�ֱ�ӷ���.vimrc�ļ���������ļ�����ޱȣ�����vim������Ҳ��ú�����������ǻ��õģ����������ǲ����ó�ͻ�ˣ������.c�ļ���������.java�ǳ�ͻ�ģ�������Щ.c ���ĸ��ַ������ģ���.java����3�ַ������ġ��е��˶���ÿһ���ֹ�ȥ��vimrc. ÿ�л�һ�λ�������дһ�Ρ������鷳����ʵvim��͸�������������⣬ֻ�Ǵ󲿷�û�������˽������
��һ�ڵ���Ҫ����:

..  
  ����������ڵı���


vim �����ļ�·��
----------------

Ҫ��֪������������, ֱ�� :command:`:help vimrc` �Ϳ����ҵ���vim�������ļ������㣬global and local:
#. *linux*, global һ������ :file:`/etc/vim/vimrc` ���� :file:`/usr/share/vim`.  local ��һ�㶼�� :file:`$HOME/.vim/vimrc` ����
#. *Windows*  global ��һ������ :file:`$VIM/vimrc` ���һ������ :file:`C:\Program Files (x86)\Vim`, localͬlinuxһ�������� windows�µ�$HOME��ָ�� :file:`C:\Users\<userName>` 

.. note::

   ��Ȼ�����Զ�����������ļ���λ�ã���������� vim�ı���ѡ��.
   
   .. code-block:: make
      
      make CPPFLAGS=-DSYS_VIMRC_FILE=\\\"/etc/vim/vimrc\\\"   # setting this cause vim to look for the /etc/vimrc file that containts the global vim settings. Normally this file is looked for in /usr/share/vim.

ÿһ��Ŀ¼�ﶼ����һ�� :file:`README.txt` ,���ʹ��ֱ�Ӳ鿴����ĵ��Ϳ����ˡ�
.. csv-table:: Vim configuration directory
   :header: Name, Content , Remark
   
   doc, ����vim�İ����ĵ���������������Ҫ����Ϣ�������������ҵ�,���� :command:`:help XXXX` ���Ǵ�����õ� 
   colors, ������������ɫ�ļ�,����ı�Ĭ�ϵ���ɫ������ :command:`: colorscheme XXX` ������Ǿ���darkblue
   compiler,������vimΪ���ֱ����������compiler�ĵط�,������Բ鿴 :command:`help write-compiler-plugin` 
   ftdetect, �ļ����ͼ�����ã�vim�������Զ������������Ľű�, �ֹ�����:command:`set filetype=XX` , :command:`filetype detect` �ͻ�����������Ľű�
   ftplugin,�������ļ�����ص�plugin,����cpp.vim,c.vim, ant.vim�ȵȡ�
   indent, ���������ļ����������ã���������Զ����Լ��������ļ����������������������Բ鿴 http://man.chinaunix.net/newsoft/vi/doc/indent.html
   keymap, ��ͬ�����Եļ�������,һ����������õ� 
   plugin, ͨ�ù��ܲ������������,����BGrep������Ƿ����
   syntax, ���е��﷨��Ч�ļ����Ƿ�����,��������Զ����﷨�ļ�����������������Ϥ���﷨�ļ�Ϊ�ο����޸�

.. note::
   ft -> file type


д�����ļ���ȷ������������һ���µ�XXX������Ӹ�������

#. ��ftdetectĿ¼�´���һ�� XXX.vim ����д����������
   
   .. code-block:: vim
      
      au BufRead,BufNewFile *.XXX	set filetype=XXX

   .. note::

      ����ⲻ�������ָ�ļ�����������ͨ���ļ�·��

#. ��ftpluginĿ¼�´��� XXX.vim, ����Ҫ���ö�����������������Լ����ÿ�ݼ���map�����Լ��Զ����С��������

#. �����ö�������ftplugin/XXX.vim��ɣ����ӵ����������﷨�ļ��ȣ�������Լ�ʵ��һ�����Է��ļ�����Ϊ :file:`syntax/XXX.vim`. 
   Ҳ����ֱ���� :file:`ftplugin/XXX.vim` ֱ�Ӳ����ֳ��﷨�ļ�������C���Ե��﷨�ļ������ֱ�Ӽ��������� 
   
   .. code-block:: vim
      
      runtime! syntax/C.vim

#. ��������ٺ�һЩ�أ�����Щ�����ļ���git��������������github���档�������˴������ʱ�ָ���git clone �͸㶨�ˡ�     






mode line
---------
��һ���Զ�ʶ��Ļ����Ǿ�����mode line. �Ǿ��ǿ�ͷ���߽�β��ע�͵ķ�ʽ��дvim mode line. ����

.. code-block:: vim
   
   vim: textwidth=78 wrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab


�����װ����
------------

ͨ�������Ľ��⣬���������˲����ԭ�����Լ����صĲ��ֱ���ڶ�Ӧ��Ŀ����Ϳ����ˣ�һ��ÿһ������Դ���README������������ĸ�Ŀ¼�
һ�㶼����www.vim.org ���ز������������github�Ƶ����ơ�


vim �����ļ�����μ��ص�
------------------------

������Բ鿴 :command:`:help starting.txt`
