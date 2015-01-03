各种IDE的打造 

Make vim as IDE for python
--------------------------

   * `pydiction <http://www.vim.org/scripts/script.php?script_id=850>`_   使用tab键来进行字典匹配，并且可以自己生成自己。
   * `python语法文件 <http://www.vim.org/scripts/script.php?script_id=790>`_ 
   * `ctags的增强版本，自动生成tags 文件 <http://www.vim.org/scripts/script.php?script_id=3114>`_ 
   * `vim-as-your-ide for python <http://haridas.in/vim-as-your-ide.html>`_ 
   * `his is the pythoncomplete omni-completion script shipped with vim 7.  Updated versions will appear here, as the vim tarballs do not ship with updated runtime files.  <http://www.vim.org/scripts/script.php?script_id=1542>`_ 
   * `pydoc 命令 <http://www.vim.org/scripts/script.php?script_id=910>`_ 

数据库的IDE
-----------

   * `dbtext.vim <http://vim.sourceforge.net/scripts/script.php?script&#95;id&#61;356>`_  %IF{" '可以通过这个插件去访问各种数据库' = '' " then="" else="- "}%可以通过这个插件去访问各种数据库
   



-- Main.GangweiLi - 19 Jun 2012


*speed up looping through all buffers* 
The buffer switch is loading the next buffer, and maybe processing autocommands for the buffer.
>
 If you are going to be processing the same files repeatedly, :set hidden will load them only the first time.
Using :bufdo always suppresses syntax autocommands, and is a clean way to loop through the buffers. 

-- Main.GangweiLi - 21 Jun 2012
