# Patch_DBD

## 简介

本脚本由付导的录播组制作

**智障组直到今天都还要用户手动修改配置文件来实现本来应该游戏界面中呈现的功能，真的垃圾**

~~因开发者故意屏蔽配置文件，该脚本功能已经失效，所做修改也无效，在出现新的方法前将无限期停更~~

~~可能可以通过N卡设置强制去修改，具体方法请自行探索~~

## 更新日志

### V1.5 - 2022-05-18

- 1.修复失效的抗锯齿关闭选项，现在可以重新关闭垃圾抗锯齿了（适用于5.7.2版本）

- 2.如果之前使用过本脚本的老版本或者自己更改过配置文件，可以先使用恢复初始文件再重新修改

### V1.4 - 2020-12-01

- 1.修复部分解锁帧数失败的bug

- 2.增加自定义锁帧选项（可能可以有效解决因为无帧数上限导致帧率不稳而出现的游戏卡顿问题）

- 3.补充部分说明，脚本锁帧只能最高120，需要更高的请使用最新N卡驱动

本脚本可【解锁官方帧数限制】、【自定义锁帧】和【解决当前杀鸡画质高糊】

## 注意

请勿二改 传播请标明原出处

**请关闭游戏后运行此脚本，运行一次后就不用再打开了**

**凡是提示拒绝访问的都是没有以管理员模式开启！！！**

原理是对游戏配置文件 *Engine.ini/GameUserSettings.ini* 文件进行修改，也就是贴吧所流传的解锁帧数方法然后简化成脚本操作

具体原理在以下网站可以找到

> https://steamcommunity.com/sharedfiles/filedetails/?id=877701418

> https://tieba.baidu.com/p/6177302348

> https://tieba.baidu.com/p/6276493302

> https://forum.deadbydaylight.com/en/discussion/136099/how-can-i-disable-anti-aliasing

> https://forum.deadbydaylight.com/en/discussion/320752/fixed-anti-aliasing-forcefully-enabled-in-5-7-0

至于会不会**封号**，并**不知道**，请自行决定是否使用该脚本，本脚本只是简化操作，使用即为**同意承担风险**

## 关于**自定义锁帧**的数值选择

您可以【先不】自定义锁帧，运行游戏后查看游戏【平均帧数】，然后关闭游戏

将【稳定的平均帧数的略高值】作为【自定义值】(尽量数值别小于60，你比官方限制的都低，就别优化了，没意义) ，高于120则被限制在120

**如果您需要更高（高于120）的锁帧，请不要用脚本锁，用脚本【解锁】即可，然后改用最新N卡驱动去设置，具体设置请自行百度**

**刚打开游戏时帧率会很高，等他加载完用户配置文件后进入游戏大厅就正常了**

## 效果图

**此为解锁60帧数但没有去抗锯齿**

![before](https://raw.githubusercontent.com/github-h/Patch_DBD/master/pic/before.jpg)

**此为解锁60帧率去了抗锯齿（注意看人物轮廓，可以看出帧数也有提高）**

![after](https://raw.githubusercontent.com/github-h/Patch_DBD/master/pic/after.jpg)

**此为自定义锁 88 帧**

![after](https://raw.githubusercontent.com/github-h/Patch_DBD/master/pic/lock.jpg)

## 下载

[Github](https://github.com/github-h/Patch_DBD/releases) / [百度云盘](https://pan.baidu.com/s/1c11eGm0gnzKUrGrWfTPqnQ#aili) 提取码: aili / [蓝奏云](https://aili.lanzous.com/iz5Fvixpmeh) 密码:agfq

**用过【先前版本】必须先运行 4 恢复初始文件再运行其他的**

## 补充

*运行成功后,建议设置游戏为低画质+关闭自动调整，以得到更好体验*

![setting](https://raw.githubusercontent.com/github-h/Patch_DBD/master/pic/setting.jpg)
