vim ����ɫ���﷨�ļ�
********************

���۶��ڲ�ɫ�����ж���Զ���ڴ��ڰ���ɫ�ġ���ͬ�����������Լ���ͬ��ʾ�������ı�����ʾЧ��Ҳ�ǲ�ͬ�ġ���δﵽ�����ʾЧ��������ı������ٶ��ء�

��ɫ�ǻ�����Ȼ�����﷨��ɫ

color scheme
============

:command:`colorscheme` �Ϳ��Կ���Ĭ�ϵ���ɫ�� 

vim Ĭ����17����ɫ.  blue, darkblue, default, delek, desert, elflord, evening, koehler, morning, murphy, pablo, peachpuff, ron, shine, slate, torte, zellner . ����ѡ����һ�ֺ��ء� ���������ʾ������ ������һ���� darblue, ����diffģʽ��һ���� *blue*. 

������ :command:`:colorscheme <schemename>` �Ϳ��Ըı���ɫ�ˡ�


�ڼ�������ַ�����ǰ���뱳����ͨ��ָ��ǰ���뱳��������ͬ����ɫЧ�����Ⲣ����ɫ�ǿ��Ի����ַ��ġ� 
Ҫ���ɫ�����ȵ�Ӳ��֧�ֲ��С�gvim����˵�ˣ��϶�֧���ˡ�����term��˵�����ڵ�term �󲿷ֶ���֧�ֵģ�������ʾ��ɫһ�㶼�����������⣬һ��ֻ����£�ֻҪ����һ�»��������Ϳ����ˡ�

  :command:`set-env TERM xterm-color` ���� :command:`TERM=xterm-color; export TERM`

ͬʱ����vim ���ַ�gui,��cterm,����ģʽ��ǰ���뱳������vim����ô�������
  
.. csv-table:: 
   :header: Name , Content

   cterm,   ��ɫ�ն�
   ctermfg, ��ɫ�ն˵�ǰ��
   ctermbg, ��ɫ�ն˵ı���
   guifg,   ͼ�λ������ǰ��
   guibg,   ͼ�λ�����ı��� 

��Ȼ�Ѿ�֪����ÿһ���ַ������ɫ��һ������ɫ���ͽ���ˡ�һ����̫�鷳�ģ���򵥵ķ�ʽ���Ǿ��������ַ���ǰ���뱳��ͳһ��Ҳ��ҳ����ķ�ʽ�� ��һ�ַ�ʽ�����ı������߼��飬��Щ�߼��ṹ��ʲô��ɫ����vim���Զ�������ɫ��

vim �ж�����72���߼���,�󲿷ֶ����������� Ҳ����ͨ�� :command:`:so $VIMRUNTIME/syntax/colortest.vim` �鿴vim ��֧�ֵķ����뱾ɫ������groupҲ��major��minor,���ǿ��ж����Ƕ�׵ġ���ķ�����԰���С�ķ��顣

.. csv-table:: 11 major group

   Comment	
   Constant	
   Identifier	
   Statement	
   PreProc	
   Type		
   Special	
   Underlined	
   Ignore		
   Error		
   Todo		

.. include:: colorgroup.txt


��Ȼÿһ�׵���ɫ��������Ҫ���������group����ɫ��ÿһ�鶼��Ĭ�ϵ���ɫ�� ����blue��ɫ��˵�����ֻ���� 34  group ����ɫ��

vim  ��Ҫ���������һ����Ϊ�ض����Եģ�һ�������ǰ���Щlink ��vim ������ķ���ġ�
��������������Եģ������� :command:`:hi` �����еġ�


��ο��Ƶ����ַ�����ɫ �������� :command:`:syn keyword` ��ʵ�֡� ��ȻҲ������ :command:`:echoh` �����������


�﷨����
========

*usr_06.txt*  �����ŵĽ��ܣ� *usr_44.txt*  �ǽ����д�﷨�ļ��ġ� ȫ������Ľ����� *syntax.txt* 
Ȼ����Ƕ����߼����ˣ���ʵҲ���Ǳ���ԭ���дʷ������ˣ�vimΪ�˼ӿ��ٶȣ���û�в���ȫ�ķ����ķ��������ǲ��þֲ������ķ�����

��������Ҫ��
------------

*keyword*  Ҫ���� :command:`iskeyword` ������ �Ĺؼ���. 

*Match* ��һ�������ʽ��ƥ��

*Region*  ����������ʽ��һ��ƥ��ͷһ��ƥ��β��

�������ߵ����ȼ� keyword>Region>Match.

Ȼ���ǰ���Щ�� link ���ӵ� color����Щgroup��ȥ��

���ڼ򵥵ĵ�Ȼ�����͹��ˣ����ڸ��ӵ��ǻ����õ������ĵ���Ϣ�ġ�������� Nested Items,�Լ� Following groups,�Լ� ��߸����Ե� *clusters* ����.

������� if, while ������ɫ����Ҫ�õ���Щ�ˡ��õ���Щ�������﷨������ˮƽ���� vim��syntax���� �о��� *contanined* �� *nextgroup* �����ˡ�


��ε���
========

���������﷨�����ǳ���ʱ���㻹���� profiling һ�ѣ�����������ʲô���ˡ�

:command:`syntime on` ��ʼ��ʱ
:command:`syntime off`  ֹͣ
:command:`syntime clar` ����
:command:`syntime report` ����report

