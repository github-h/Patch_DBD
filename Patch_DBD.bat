@echo off&PUSHD %~DP0 &TITLE Patch_DBD

>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)

echo --------------------------------------------------------------------------
echo 本脚本由付导的录播组制作 当前版本为 V1.1 (20200311)
echo.&echo 请勿二改 大量传播
echo.&echo 本脚本可【解锁帧数】和【解决当前杀鸡画质高糊】的问题（也就是关闭默认抗锯齿的效果）
echo.&echo 该脚本失效可以在 GitHub 上提交 Issues
echo.
echo --------------------------------------------------------------------------
echo 凡是提示拒绝访问的都是没有以管理员模式开启！！！
echo 请关闭游戏后运行此脚本，此脚本【运行一次】后就不用再打开了
echo 原理是对游戏配置文件 Engine.ini 文件进行修改，也就是贴吧所流传的解锁帧数方法然后简化成脚本操作
echo 具体原理在以下网站可以找到
echo.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo https://steamcommunity.com/sharedfiles/filedetails/?id=877701418
echo https://tieba.baidu.com/p/6177302348
echo https://tieba.baidu.com/p/6276493302
echo https://forum.deadbydaylight.com/en/discussion/136099/how-can-i-disable-anti-aliasing
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.&echo 至于会不会【封号】，并【不知道】，请自行决定是否使用该脚本，本脚本只是简化操作，使用即为【同意承担风险】
echo.&echo 若担心出现不可控问题请直接【右上角关闭】脚本并且删除,脚本到此并没有进行任何操作
echo.
echo ---------------------------------------------------------------------------
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set file=%localappdata%\DeadByDaylight\Saved\Config\WindowsNoEditor\Engine.ini
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo 如果你认真阅读了以上内容，并且同意操作，请按照指示输入，输入其他的都会【导致脚本退出】
echo.&set /p option=请输入 Y 然后回车继续运行
if %option%==Y goto :Verify
if %option%==y goto :Verify
exit


:Verify
cls

echo.&echo 此为二次验证,旨在防止伸手党,喜欢UP的话记得【点个关注】并且【一键三连】啊！
echo.&echo 请在打开的网页中找到并且输入UP的【昵称】然后回车,昵称应该为大小写加下划线
choice /t 2 /d y /n >nul
explorer "https://space.bilibili.com/180659383"
echo.&set /p Nicename=
if %Nicename%==Ailiaili_ goto :Start
exit

:Start
cls

echo.&echo 为了使脚本发挥全部作用，您【可能】需要配合选项 1 和 2 一起使用
echo --------------------------------------------------------------------------
echo.&echo 请选择要操作的选项（建议用过【先前版本】的先运行 3 再运行其他的）
echo.&echo 1.解锁帧数 (也就是解锁60帧)
echo.&echo 2.解决当前杀鸡画质高糊 (去除垃圾ue4的抗锯齿，使画面锐利，恢复原来的那种画质)
echo.&echo 3.恢复原始文件
echo.&echo 0.退出
echo.&set /p choice=输入数字后回车：

if %choice%==1 goto Unlock
if %choice%==2 goto Shut
if %choice%==3 goto Restore
if %choice%==0 goto End

:Unlock
cls

(echo.) >> %file%
(echo [/script/engine.engine]) >> %file%
(echo bSmoothFrameRate=false) >> %file%
(echo MinSmoothedFrameRate=5) >> %file%
(echo MaxSmoothedFrameRate=144) >> %file%
(echo bUseVSync=false) >> %file%

echo.&echo 运行成功,已经解锁60帧了
echo.&echo 即将回到选择界面
choice /t 3 /d y /n >nul
goto Start

:Shut
cls

(echo.) >> %file%
(echo [/Script/Engine.GarbageCollectionSettings]) >> %file%
(echo r.DefaultFeature.Bloom=False) >> %file%
(echo r.DefaultFeature.AmbientOcclusion=False) >> %file%
(echo r.DefaultFeature.AmbientOcclusionStaticFraction=False) >> %file%
(echo r.DefaultFeature.MotionBlur=False) >> %file%
(echo r.DefaultFeature.LensFlare=False) >> %file%
(echo r.DefaultFeature.AntiAliasing=0) >> %file%

echo.&echo 运行成功,Up建议设置游戏为【低画质+关闭自动调整】，以得到更好体验
echo.&echo 请按任意键表明你已知晓要同时修改游戏内设置
echo.&pause
echo.&echo 正在回到选择界面
goto Start

:Restore
cls

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
echo.&echo 恢复完成,已经回退到官网初始文件，若不放心请重新验证游戏完整性
echo.&echo 正在回到选择界面
choice /t 3 /d y /n >nul
goto Start

:End
exit