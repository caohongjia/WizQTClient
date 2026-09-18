; WizNote Windows x64 安装脚本 (Inno Setup)
; 生成支持选择安装目录的标准 Windows 安装程序

#define MyAppName "WizNote"
#define MyAppVersion "0.9.1"
#define MyAppPublisher "Wiz"
#define MyAppExeName "WizNote.exe"

[Setup]
AppId={{8A1B4B2C-6F63-4F0C-9E5A-0BD8E4F1B6A3}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir={#SourcePath}..\output
OutputBaseFilename=WizNote-Setup-x64-{#MyAppVersion}
Compression=lzma2
SolidCompression=yes
; 安装时显示"选择安装目录"页面
Uninstallable=yes
ArchitecturesInstallIn64BitMode=x64

[Languages]
; 简体中文使用默认语言文件；英文内建，无需重复声明
Name: "chinesesimplified"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; 从构建目录(EXE_DIR)整体拷贝程序文件，保持 share/ 与 exe 同级
Source: "{#MyBuildDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; 日志/数据库运行目录权限
Source: "{#MyBuildDir}\share\*"; DestDir: "{app}\share"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent