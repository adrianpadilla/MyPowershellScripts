
#This script was tested in a Windows 8.1 installation hosted on VmWare Player. Your mileage may vary.

#Install Chocolately http://chocolatey.org to enable installations
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

#Software
cinst GoogleChrome
cinst adobereader
cinst spotify

#Visual Studio. replace product key.
<#available featuresj
Blend
LightSwitch
VC_MFC_Libraries
OfficeDeveloperTools
SQL
WebTools
Win8SDK
SilverLight_Developer_Kit
WindowsPhone80
#>
#cinst VisualStudio2013Ultimate -InstallArguments "/Features:'WebTools Win8SDK' /ProductKey:XXXXX-XXXXX-XXXXX-XXXXX-XXXXX"

#TODO: Resharper

#Installing dev tools
cinst notepadplusplus
cinst vim
cinst linqpad4
cinst winmerge
cinst terminals
cinst python
cinst XmlNotepad
cinst GitHub
cinst Atom
cinst wireshark
cinst sysinternals
cinst fiddler
cinst perfview #PerfView is a performance analysis tool focusing on ETW information
cinst windows-8-1-sdk


#installing misc tools
cinst 7zip.install
cinst winrar
cinst vmwareplayer
cinst keepass
cinst windirstat
cinst agentransack #Agent Ransack is a free 'lite' version of FileLocator Pro.

#TODO: find out how to install chrome tools such as POSTMAN