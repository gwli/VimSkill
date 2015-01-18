Vim 的日常应用
==============


用vim 来快速实现循环的功能
--------------------------
我们经常会一些一次性工作，但是量又有点大。写代码不值，不写的话，一个个手工删除太慢。那个时候就可以vim帮助你了。

问题
^^^^
把windows 下所有的usb driver给删除了。在我们经常使用各种device的人，经常会遇到device认不出来的问题，原因一般会可能系统把usb 认错设备了，或者认没有了。也有需要配制  /home/.android.ini 中配制的由于安全原因。这里只讲删除 usb driver.

#. 首先查看一下有多少，
   
   :command:`pnputil -e`

   一下就有200多条怎么办， pnputil -d -f oem297.inf 一条一条来到时候才能完呢

   .. code-block:: bash

      Published name :            oem297.inf
      Driver package provider :   VMware, Inc.
      Class :                     Universal Serial Bus controllers
      Driver date and version :   05/21/2009 4.0.4.0
      Signer name :               Microsoft Windows Hardware Compatibility Publisher
      
      Published name :            oem199.inf
      Driver package provider :   Intel
      Class :                     Universal Serial Bus controllers
      Driver date and version :   12/21/2010 9.2.0.1021
      Signer name :               Microsoft Windows Hardware Compatibility Publisher
      
      Published name :            oem289.inf
      Driver package provider :   STMicroelectronics
      Class :                     System devices
      Driver date and version :   11/04/2011 2.2.2.0
      Signer name :               Microsoft Windows Hardware Compatibility Publisher
      
      Published name :            oem298.inf
      Driver package provider :   VMware, Inc.
      Class :                     Network Service
      Driver date and version :   06/30/2011 4.1.2.0
      Signer name :               Microsoft Windows Hardware Compatibility Publisher
      
      Published name :            oem299.inf
      Driver package provider :   VMware, Inc.
      Class :                     Network adapters
      Driver date and version :   06/30/2011 4.1.2.0
      Signer name :               Microsoft Windows Hardware Compatibility Publisher

 
用vim 来搞定
 
 #. 建立一个 clean.bat 文件
    
    .. code-block:: bash

       pnputil -f -d oemXX.inf
 
 #. 用vim 打开输入以下命令

    .. code-block:: vim
    
       yy10p
       :let i=0
       :g/XX/s/XX/\=i/g |let i=i+1
       :wq

 #. 执行clean.bat 就OK了。    





How to get insert date or time
------------------------------

#. one is use strftime("%y-%m-%d") [VimWiki]_
#. use the python time and calendar module :py:mod:`time` and :py:mod:`calendar`



