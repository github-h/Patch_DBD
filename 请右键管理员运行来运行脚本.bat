@echo off
echo ------------------------------------------------------------------------
echo 本脚本由付导的录播组制作  当前版本为V1.0
echo.
echo 请勿二改 大量传播
echo.
echo 本脚本可【解锁帧数】和【解决当前杀鸡画质高糊】的问题（也就是关闭默认抗锯齿的效果）
echo.
echo.
echo 请关闭游戏后运行此脚本，运行一次后就不用再打开了
echo.
echo 凡是提示拒绝访问的都是没有以管理员模式开启！！！
echo.
echo.
echo 原理是对游戏配置文件 Engine.ini 文件进行修改，也就是贴吧所流传的解锁帧数方法然后简化成脚本操作
echo.
echo 具体原理在以下网站可以找到
echo.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo https://steamcommunity.com/sharedfiles/filedetails/?id=877701418
echo.
echo https://tieba.baidu.com/p/6177302348
echo.
echo https://tieba.baidu.com/p/6276493302
echo.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo 至于会不会封号，并不知道，请自行决定是否使用该脚本，本脚本只是简化操作，使用即为同意承担风险
echo.
echo 若担心出现不可控问题请直接右上角关闭脚本并且删除,脚本到此并没有修改任何操作
echo.
echo ------------------------------------------------------------------------
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set file=%localappdata%\DeadByDaylight\Saved\Config\WindowsNoEditor\Engine.ini
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


set /p option=如果你认真阅读了以上内容，并且同意操作，请输入Y然后回车继续运行，输入其他的都会导致脚本退出
if %option%==Y goto :Verify
if %option%==y goto :Verify
exit


:Verify

echo.
echo 此为二次验证,旨在防止伸手党,喜欢UP的话记得【点个关注】并且【一键三连】啊！
echo.
choice /t 1 /d y /n >nul
explorer "https://space.bilibili.com/180659383"
set /p Nicename=请在打开的网页中找到并且输入UP的【昵称】以确认继续操作,昵称应该为大小写加下划线
if %Nicename%==Ailiaili_ goto :Start
exit

:Start
cls
echo.
echo 请选择要操作的选项
echo.
set /p choice=1.解锁帧数  2.解决当前杀鸡画质高糊  3.恢复原始文件 4.退出 
echo.
if %choice%==1 goto Unlock
if %choice%==2 goto Shut
if %choice%==3 goto Restore
if %choice%==4 goto End

:Unlock

echo.
(echo.) >> %file%
(echo [/script/engine.engine]) >> %file%
(echo bSmoothFrameRate=false) >> %file%
(echo MinSmoothedFrameRate=5) >> %file%
(echo MaxSmoothedFrameRate=144) >> %file%
(echo bUseVSync=false) >> %file%
echo 运行成功,回到选择界面
choice /t 2 /d y /n >nul
goto Start

:Shut

echo.
(echo.) >> %file%
(echo [/Script/Engine.RendererOverrideSettings]) >> %file%
(echo r.DefaultFeature.Bloom=False) >> %file%
(echo r.DefaultFeature.AmbientOcclusion=False) >> %file%
(echo r.DefaultFeature.AmbientOcclusionStaticFraction=False) >> %file%
(echo r.DefaultFeature.MotionBlur=False) >> %file%
(echo r.DefaultFeature.LensFlare=False) >> %file%
(echo r.DefaultFeature.AntiAliasing=0) >> %file%
echo 运行成功,Up建议设置游戏为【低画质+关闭自动调整】，以得到更好体验
echo.
pause
echo 正在回到选择界面
goto Start

:Restore

echo.
del /a /f /q %file%
(echo [Core.System]) >> %file%
(echo Paths=../../../Engine/Content) >> %file%
(echo Paths=%GAMEDIR%Content) >> %file%
(echo Paths=../../../Engine/Plugins/Runtime/VersionNumber/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Wwise/Content) >> %file%
(echo Paths=../../../Engine/Plugins/2D/Paper2D/Content) >> %file%
(echo Paths=../../../DeadByDaylight/Plugins/Runtime/ThirdParty/RedShellPlugin/Content) >> %file%
(echo Paths=../../../DeadByDaylight/Plugins/Runtime/Bhvr/OnlinePresence/Content) >> %file%
(echo Paths=../../../DeadByDaylight/Plugins/Runtime/Bhvr/MirrorsSdk/Content) >> %file%
(echo Paths=../../../DeadByDaylight/Plugins/Runtime/Bhvr/MirrorsAnalytics/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Runtime/Bhvr/MirrorsAnalytics/Content) >> %file%
(echo Paths=../../../DeadByDaylight/Plugins/Runtime/Bhvr/VersionNumber/Content) >> %file%
(echo Paths=../../../DeadByDaylight/Plugins/Wwise/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Editor/CryptoKeys/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Editor/MeshEditor/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Enterprise/DatasmithContent/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Media/MediaCompositing/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Runtime/Oculus/OculusVR/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Runtime/Steam/SteamVR/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Runtime/HoudiniEngine/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Enterprise/VariantManagerContent/Content) >> %file%
(echo Paths=../../../Engine/Plugins/Experimental/RemoteSession/Content) >> %file%
echo 恢复完成,回到选择界面
choice /t 2 /d y /n >nul
goto Start

:End
exit