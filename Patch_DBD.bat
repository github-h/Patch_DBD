@echo off&PUSHD %~DP0 &TITLE Patch_DBD
color 0A
>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)

echo --------------------------------------------------------------------------
echo 本脚本由付导的录播组制作 当前版本为 V1.4b1 (20200419)
echo.&echo 请勿二改 大量传播
echo.&echo 本脚本可【解锁官方帧数限制】、【自定义锁帧】和【解决当前杀鸡画质高糊】
echo.&echo 该脚本失效可以在 GitHub 上提交 Issues
echo.
echo --------------------------------------------------------------------------
echo 凡是提示拒绝访问的都是没有以管理员模式开启！！！
echo 请【关闭游戏】后运行此脚本，此脚本【运行一次】后就不用再打开了
echo 原理是对游戏配置文件 Engine.ini / GameUserSettings.ini 文件进行修改，也就是贴吧所流传的解锁帧数方法然后简化成脚本操作
echo.
echo 具体原理在以下网站可以找到
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
set engine=%localappdata%\DeadByDaylight\Saved\Config\WindowsNoEditor\Engine.ini
set gameuserset=%localappdata%\DeadByDaylight\Saved\Config\WindowsNoEditor\GameUserSettings.ini
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
if %Nicename%==Ailiaili_ goto :Meun
exit

:Meun
cls

echo.&echo 如果您觉得您的游戏使用脚本后出现了什么问题，请使用 4 来撤销所有操作并恢复官方原始文件
echo.&echo 为了使脚本发挥全部作用，您【可能】需要配合选项 1 和 3 一起使用
echo --------------------------------------------------------------------------
echo.&echo 请选择要操作的选项（用过【先前版本】必须先运行 4 再运行其他的）
echo.&echo 1.解锁【官方】锁帧 (去除官方锁60帧限制)
echo.&echo 2.【自定义】锁帧 (手动设置帧数上限防止游戏因掉帧变卡，【必须】使用 1 后该设置才能生效，若不设置则为不锁帧)
echo.&echo 3.解决当前杀鸡画质高糊 (去除垃圾ue4的抗锯齿，使画面锐利，强烈推荐！)
echo.&echo 4.恢复原始文件
echo.&echo 0.退出
echo.&set /p choice=输入数字后回车：

if %choice%==1 goto Unlock
if %choice%==2 goto Confirm
if %choice%==3 goto Shut
if %choice%==4 goto Restore
if %choice%==0 goto End
if %choice%==debug goto Debug
exit

:Unlock
cls

(echo.) >> %engine%
(echo [/script/engine.engine]) >> %engine%
(echo bSmoothFrameRate=False) >> %engine%
(echo MinSmoothedFrameRate=5) >> %engine%
(echo MaxSmoothedFrameRate=144) >> %engine%
(echo bUseVSync=False) >> %engine%

setlocal enabledelayedexpansion
(for /f "tokens=1* delims=:" %%i in ('findstr /n .* "%gameuserset%"') do (
set str=%%j
if !str!==bUseVSync=True (
echo;!str:True=False!
) else (
	echo;!str!
)
))>>%gameuserset%.temp
move /y %gameuserset%.temp %gameuserset%

echo.&echo 运行成功,已经去除官方锁60帧限制了
echo.&echo 建议配合使用自定义【锁帧】来达到稳定游戏体验
echo.&echo 即将回到选择界面
choice /t 5 /d y /n >nul
goto Meun

:Confirm
cls

echo.&echo 请再次确定您是否已经解锁【官方】锁帧，不解锁该设置将不会生效
echo.&echo 该设置可能可以有效【解决】因为无帧数上限导致【帧率不稳】而出现的【游戏卡顿】问题
echo.&echo 在解锁【官方】锁帧后，您以后可以直接进入本选项，直接修改帧数上限
echo.&echo 您输入的帧数必须为【纯数字】，0-120 等任意数字都可，若为 0 则为不锁帧，高于120则被限制在120
echo.&echo 需要更高帧数锁定的请使用脚本解锁，并使用最新N卡驱动去设置
echo.&echo                      【关于数值选择】
echo.&echo 您可以【先不】自定义锁帧，运行游戏后查看游戏【平均帧数】，然后关闭游戏
echo.&echo 将【稳定的平均帧数的略高值】作为【自定义值】(尽量数值别小于60，小于60优化了没意义)
echo.&echo 您若有任何误操作行为怀疑疑似出现问题，请回到主菜单使用 4 来撤销所有操作并恢复官方原始文件
echo -------------------------------------------------------------------------------------------------
echo.&echo N.回到主菜单
echo.&echo Y.确认已经解锁【官方】锁帧，并进入下一步【自定义】锁帧
echo.&set /p choice=输入 Y 或者 N 后回车：

if %choice%==n goto Meun
if %choice%==N goto Meun
if %choice%==y goto Lock
if %choice%==Y goto Lock
exit

:Lock

echo.&echo 请输入您想锁定的帧数，并回车确认。【必须】为纯数字，例如 60 80 等，输入 0 则为不锁帧，高于120则被限制在120
set /p new=

setlocal enabledelayedexpansion
(for /f "tokens=1,2,3 delims=:=" %%i in ('findstr /n .* "%gameuserset%"') do (
set str=%%j
set value=%%k

if !str!==FrameRateLimit (
    
echo;FrameRateLimit=%new%.000000

) else if !str!==SharedLoginInformation (
    echo SharedLoginInformation=^(LoginProvider="",AuthToken=""^)
) else if !str!==DeviceLoginTokenID (
    echo DeviceLoginTokenID=
) else if "!value!"=="" (
    echo;!str!
) else (
	echo;!str!=!value!
)
))>>%gameuserset%.temp
move /y %gameuserset%.temp %gameuserset%

echo.&echo 您当前游戏帧数已经锁定为 %new% fps
choice /t 5 /d y /n >nul
goto Meun

:Shut
cls

(echo.) >> %engine%
(echo [/Script/Engine.GarbageCollectionSettings]) >> %engine%
(echo r.DefaultFeature.Bloom=False) >> %engine%
(echo r.DefaultFeature.AmbientOcclusion=False) >> %engine%
(echo r.DefaultFeature.AmbientOcclusionStaticFraction=False) >> %engine%
(echo r.DefaultFeature.MotionBlur=False) >> %engine%
(echo r.DefaultFeature.LensFlare=False) >> %engine%
(echo r.DefaultFeature.AntiAliasing=0) >> %engine%

choice /t 2 /d y /n >nul
echo.&echo 运行成功,Up建议设置游戏为【低画质+关闭自动调整】，以得到更好体验
echo.&echo 请按任意键表明你已知晓要同时修改游戏内设置
echo.&pause
echo.&echo 正在回到选择界面
goto Meun

:Restore
cls

del /a /f /q %engine%
(echo [Core.System]) >> %engine%
(echo Paths=../../../Engine/Content) >> %engine%
(echo Paths=%%GAMEDIR%%Content) >> %engine%
(echo Paths=../../../Engine/Plugins/Runtime/Bhvr/MirrorsAnalytics/Content) >> %engine%
(echo Paths=../../../DeadByDaylight/Plugins/Runtime/Bhvr/OnlinePresence/Content) >> %engine%
(echo Paths=../../../DeadByDaylight/Plugins/Runtime/Bhvr/VersionNumber/Content) >> %engine%
(echo Paths=../../../Engine/Plugins/Experimental/RemoteSession/Content) >> %engine%
(echo Paths=../../../Engine/Plugins/Runtime/HoudiniEngine/Content) >> %engine%
(echo Paths=../../../DeadByDaylight/Plugins/Wwise/Content) >> %engine%
(echo Paths=../../../Engine/Plugins/2D/Paper2D/Content) >> %engine%
(echo Paths=../../../Engine/Plugins/Developer/AnimationSharing/Content) >> %engine%
(echo Paths=../../../Engine/Plugins/Editor/CryptoKeys/Content) >> %engine%
(echo Paths=../../../Engine/Plugins/Enterprise/DatasmithContent/Content) >> %engine%
(echo Paths=../../../Engine/Plugins/Media/MediaCompositing/Content) >> %engine%

setlocal enabledelayedexpansion
(for /f "tokens=1* delims=:" %%i in ('findstr /n .* "%gameuserset%"') do (
set str=%%j
if !str!==bUseVSync=False (
echo;!str:False=True!
) else (
	echo;!str!
)
))>>%gameuserset%.temp
move /y %gameuserset%.temp %gameuserset%

(for /f "tokens=1,2,3 delims=:=" %%i in ('findstr /n .* "%gameuserset%"') do (
set str=%%j
set value=%%k

if !str!==FrameRateLimit (
    
echo;FrameRateLimit=0.000000

) else if !str!==SharedLoginInformation (
    echo SharedLoginInformation=^(LoginProvider="",AuthToken=""^)
) else if !str!==DeviceLoginTokenID (
    echo DeviceLoginTokenID=
) else if "!value!"=="" (
    echo;!str!
) else (
	echo;!str!=!value!
)
))>>%gameuserset%.temp
move /y %gameuserset%.temp %gameuserset%

echo.&echo 恢复完成,已经回退到官方初始文件，若不放心请重新验证游戏完整性
echo.&echo 正在回到选择界面
choice /t 3 /d y /n >nul
goto Meun

:End
exit

:Debug
Start %engine%
Start %gameuserset%