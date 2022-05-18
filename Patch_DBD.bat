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
echo ���ű��ɸ�����¼�������� ��ǰ�汾Ϊ V1.5 (20220518)
echo.&echo ������� ���������ԭ����
echo.&echo ���ű��ɡ������ٷ�֡�����ơ������Զ�����֡���͡������ǰɱ�����ʸߺ���
echo.&echo �ýű�ʧЧ������ GitHub ���ύ Issues
echo.
echo --------------------------------------------------------------------------
echo ������ʾ�ܾ����ʵĶ���û���Թ���Աģʽ����������
echo �롾�ر���Ϸ�������д˽ű����˽ű�������һ�Ρ���Ͳ����ٴ���
echo ԭ���Ƕ���Ϸ�����ļ� Engine.ini / GameUserSettings.ini �ļ������޸ģ�Ҳ���������������Ľ���֡������Ȼ��򻯳ɽű�����
echo.
echo ����ԭ����������վ�����ҵ�
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo https://steamcommunity.com/sharedfiles/filedetails/?id=877701418
echo https://tieba.baidu.com/p/6177302348
echo https://tieba.baidu.com/p/6276493302
echo https://forum.deadbydaylight.com/en/discussion/136099/how-can-i-disable-anti-aliasing
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.&echo ���ڻ᲻�᡾��š���������֪�����������о����Ƿ�ʹ�øýű������ű�ֻ�Ǽ򻯲�����ʹ�ü�Ϊ��ͬ��е����ա�
echo.&echo �����ĳ��ֲ��ɿ�������ֱ�ӡ����Ͻǹرա��ű�����ɾ��,�ű����˲�û�н����κβ���
echo.
echo ---------------------------------------------------------------------------
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set engine=%localappdata%\DeadByDaylight\Saved\Config\WindowsNoEditor\Engine.ini
set gameuserset=%localappdata%\DeadByDaylight\Saved\Config\WindowsNoEditor\GameUserSettings.ini
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo ����������Ķ����������ݣ�����ͬ��������밴��ָʾ���룬���������Ķ��᡾���½ű��˳���
echo.&set /p option=������ Y Ȼ��س���������
if %option%==Y goto :Verify
if %option%==y goto :Verify
exit


:Verify
cls

echo.&echo ��Ϊ������֤,ּ�ڷ�ֹ���ֵ�,ϲ��UP�Ļ��ǵá������ע�����ҡ�һ������������
echo.&echo ���ڴ򿪵���ҳ���ҵ���������UP�ġ��ǳơ�Ȼ��س�,�ǳ�Ӧ��Ϊ��Сд���»���
choice /t 2 /d y /n >nul
explorer "https://space.bilibili.com/180659383"
echo.&set /p Nicename=
if %Nicename%==Ailiaili_ goto :Meun
exit

:Meun
cls

echo.&echo ���������������Ϸʹ�ýű��������ʲô���⣬��ʹ�� 4 ���������в������ָ��ٷ�ԭʼ�ļ�
echo.&echo Ϊ��ʹ�ű�����ȫ�����ã��������ܡ���Ҫ���ѡ�� 1 �� 3 һ��ʹ��
echo --------------------------------------------------------------------------
echo.&echo ��ѡ��Ҫ������ѡ��ù�����ǰ�汾������������ 4 �����������ģ�
echo.&echo 1.�������ٷ�����֡ (ȥ���ٷ���60֡����)
echo.&echo 2.���Զ��塿��֡ (�ֶ�����֡�����޷�ֹ��Ϸ���֡�俨�������롿ʹ�� 1 ������ò�����Ч������������Ϊ����֡)
echo.&echo 3.�����ǰɱ�����ʸߺ� (ȥ������ue4�Ŀ���ݣ�ʹ����������ǿ���Ƽ���)
echo.&echo 4.�ָ�ԭʼ�ļ�
echo.&echo 0.�˳�
echo.&set /p choice=�������ֺ�س���

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

echo.&echo ���гɹ�,�Ѿ�ȥ���ٷ���60֡������
echo.&echo �������ʹ���Զ��塾��֡�����ﵽ�ȶ���Ϸ����
echo.&echo �����ص�ѡ�����
choice /t 5 /d y /n >nul
goto Meun

:Confirm
cls

echo.&echo ���ٴ�ȷ�����Ƿ��Ѿ��������ٷ�����֡�������������ý�������Ч
echo.&echo �����ÿ��ܿ�����Ч���������Ϊ��֡�����޵��¡�֡�ʲ��ȡ������ֵġ���Ϸ���١�����
echo.&echo �ڽ������ٷ�����֡�����Ժ����ֱ�ӽ��뱾ѡ�ֱ���޸�֡������
echo.&echo �������֡������Ϊ�������֡���0-120 ���������ֶ��ɣ���Ϊ 0 ��Ϊ����֡������120��������120
echo.&echo ��Ҫ����֡����������ʹ�ýű������������ʹ������N������ȥ����
echo.&echo                      ��������ֵѡ��
echo.&echo �����ԡ��Ȳ����Զ�����֡��������Ϸ��鿴��Ϸ��ƽ��֡������Ȼ��ر���Ϸ
echo.&echo �����ȶ���ƽ��֡�����Ը�ֵ����Ϊ���Զ���ֵ��(������ֵ��С��60��С��60�Ż���û����)
echo.&echo �������κ��������Ϊ�������Ƴ������⣬��ص����˵�ʹ�� 4 ���������в������ָ��ٷ�ԭʼ�ļ�
echo -------------------------------------------------------------------------------------------------
echo.&echo N.�ص����˵�
echo.&echo Y.ȷ���Ѿ��������ٷ�����֡����������һ�����Զ��塿��֡
echo.&set /p choice=���� Y ���� N ��س���

if %choice%==n goto Meun
if %choice%==N goto Meun
if %choice%==y goto Lock
if %choice%==Y goto Lock
exit

:Lock

echo.&echo ����������������֡�������س�ȷ�ϡ������롿Ϊ�����֣����� 60 80 �ȣ����� 0 ��Ϊ����֡������120��������120
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

echo.&echo ����ǰ��Ϸ֡���Ѿ�����Ϊ %new% fps
choice /t 5 /d y /n >nul
goto Meun

:Shut
cls

(echo.) >> %engine%
(echo [/Script/Engine.RendererOverrideSettings]) >> %engine%
(echo r.DefaultFeature.Bloom=False) >> %engine%
(echo r.DefaultFeature.AmbientOcclusion=False) >> %engine%
(echo r.DefaultFeature.AmbientOcclusionStaticFraction=False) >> %engine%
(echo r.DefaultFeature.MotionBlur=False) >> %engine%
(echo r.DefaultFeature.LensFlare=False) >> %engine%
(echo r.DefaultFeature.AntiAliasing=0) >> %engine%

choice /t 2 /d y /n >nul
echo.&echo ���гɹ�,Up����������ϷΪ���ͻ���+�ر��Զ����������Եõ���������
echo.&echo �밴�������������֪��Ҫͬʱ�޸���Ϸ������
echo.&pause
echo.&echo ���ڻص�ѡ�����
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

echo.&echo �ָ����,�Ѿ����˵��ٷ���ʼ�ļ�������������������֤��Ϸ������
echo.&echo ���ڻص�ѡ�����
choice /t 3 /d y /n >nul
goto Meun

:End
exit

:Debug
Start %engine%
Start %gameuserset%