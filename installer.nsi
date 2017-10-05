#------------------------------------------------------#
#Plugins

	#Inclui o MUI2.nsh, responsável pela interface
	!include MUI2.nsh
	!include InstallOptions.nsh
	!include FileFunc.nsh
	
	Var errorsrc	
	Var StartMenuFolder

#------------------------------------------------------#
#Configurações

	#Define o nome do instalador
	Name "Order By"

	#Nomeia o arquivo do instalador
	OutFile "order_by.exe"
	
	InstallDir "$PROGRAMFILES\Order By"
	
	BrandingText "Sistema de Gerenciamento Escolar - Order By"	
	
	RequestExecutionLevel admin
	
	; MUI Settings / Icons
	!define MUI_ICON "logo.ico"
	!define MUI_UNICON "logo.ico"
	 
	; MUI Settings / Header
	!define MUI_HEADERIMAGE
	!define MUI_HEADERIMAGE_RIGHT
	!define MUI_HEADERIMAGE_BITMAP "header.bmp"
	!define MUI_HEADERIMAGE_UNBITMAP "header.bmp"
	 
	; MUI Settings / Wizard
	!define MUI_WELCOMEFINISHPAGE_BITMAP "wizard.bmp"
	!define MUI_UNWELCOMEFINISHPAGE_BITMAP "wizard.bmp"

	!define MUI_ABORTWARNING

;--------------------------------
;Pages
	

	!insertmacro MUI_PAGE_WELCOME
	
	!define MUI_LICENSEPAGE_CHECKBOX
	!define MUI_LICENSEPAGE_CHECKBOX_TEXT "Eu aceito os termos do contrato de licença."
	!insertmacro MUI_PAGE_LICENSE "contrato.txt"
	
	!insertmacro MUI_PAGE_COMPONENTS
	!insertmacro MUI_PAGE_DIRECTORY
	
	;Start Menu Folder Page Configuration
	!define MUI_STARTMENUPAGE_NODISABLE
	!define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU" 
	!define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\Order By" 
	!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Start Menu Folder"

	!insertmacro MUI_PAGE_STARTMENU Application $StartMenuFolder
	
	
	
	#Page custom fnc_mysqlconf_Show
	
	!define MUI_FINISHPAGE_NOAUTOCLOSE
	!insertmacro MUI_PAGE_INSTFILES
	
	Page Custom MyCustomPage MyCustomLeave
	
	!insertmacro MUI_PAGE_FINISH

	!insertmacro MUI_UNPAGE_WELCOME
	!insertmacro MUI_UNPAGE_CONFIRM
	
	!define MUI_UNFINISHPAGE_NOAUTOCLOSE
	!insertmacro MUI_UNPAGE_INSTFILES
	!insertmacro MUI_UNPAGE_FINISH
  
	!insertmacro MUI_LANGUAGE "PortugueseBR"
	
	Section "Software gerenciador" Software
		SectionIn RO
		SetOutPath "$INSTDIR"
		
		File "logo.ico"
		File "bd.sql"
		File "programa.jar"
		File "programa_semsenha.jar"
		
		WriteUninstaller "$INSTDIR\desinstalador.exe"		
		WriteRegStr HKCU "Software\Order By" "" $INSTDIR
		
		${GetSize} "$INSTDIR" "/S=0K" $0 $1 $2
		IntFmt $0 "0x%08X" $0
		
		WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Order By" \
                 "DisplayName" "Order By"
		WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Order By" \
                 "DisplayIcon" "$\"$INSTDIR\logo.ico$\""
		WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Order By" \
                 "UninstallString" "$\"$INSTDIR\desinstalador.exe$\""
		WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Order By" \
                 "Publisher" "Etec $\"Lauro Gomes$\""
		WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Order By" \ 
				 "EstimatedSize" "$0"
		WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Order By" \
                 "DisplayVersion " "1.0"
		WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Order By" \
                 "Comments " "Sistema de Gerenciamento Escolar - Order By"					 			 

		CreateShortCut "$DESKTOP\Order By.lnk" "$INSTDIR\programa.jar" "" "$INSTDIR\logo.ico" 0
				 
		!insertmacro MUI_STARTMENU_WRITE_BEGIN Application
			CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
			CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Software Gerenciador - Order By.lnk" "$INSTDIR\programa.jar" "" "$INSTDIR\logo.ico" 0
			CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Software Gerenciador - Order By (Sem senha).lnk" "$INSTDIR\programa_semsenha.jar" "" "$INSTDIR\logo.ico" 0
			CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Desinstalar.lnk" "$INSTDIR\desinstalador.exe"
		!insertmacro MUI_STARTMENU_WRITE_END

	SectionEnd
	
	Section "Banco de Dados" Database
				
	SectionEnd
	
	Section "Vertrigo 2.3" Vertrigo
		SetOutPath "$TEMP"
		DetailPrint "Iniciando a instalação do Vertrigo"
		File "Vertrigo_230.exe";
		ExecWait "$TEMP\Vertrigo_230.exe";
		Delete "$TEMP\Vertrigo_230.exe";
	SectionEnd
	
	Function MyCustomPage
	  # If you need to skip the page depending on a condition, call Abort.
	  SectionGetFlags ${Database} $R0 
	  IntOp $R0 $R0 & ${SF_SELECTED} 
	  IntCmp $R0 ${SF_SELECTED} show 
	 
	  Abort 
	 
	  show:
	  ReserveFile "form_mysql.ini"
	  !insertmacro MUI_HEADER_TEXT "Configurações do MySQL" "Programa de Instalação do TCC" 
	  !insertmacro INSTALLOPTIONS_EXTRACT "form_mysql.ini"
	  !insertmacro INSTALLOPTIONS_DISPLAY "form_mysql.ini"
	FunctionEnd
	 
	Function MyCustomLeave
		!insertmacro INSTALLOPTIONS_READ $R1 "form_mysql.ini" "Field 4" "State"
		!insertmacro INSTALLOPTIONS_READ $R2 "form_mysql.ini" "Field 5" "State"
		!insertmacro INSTALLOPTIONS_READ $R3 "form_mysql.ini" "Field 7" "State"
		#DetailPrint "User:$R1"
		#DetailPrint "Senha:$R2"
		#DetailPrint "Caminho:$R3"
		SetOutPath "$TEMP"
		File "bd.sql"
		ExecWait "$R3 --user='$R1' --password='$R2' --execute=$\"source '$TEMP\bd.sql';$\" escola" $1
		StrCmp $2 1 0 endinst
		StrCpy $errorsrc "File import error"
		Goto abortinst 
		
		abortinst:
		MessageBox MB_OK "$\nUm erro ocorreu!$\n$errorsrc"

		endinst:
	FunctionEnd
	
	#!include "mysqlconf.nsdinc";

;Language strings
  LangString DESC_Software ${LANG_PORTUGUESEBR} "Software gerenciador"
  LangString DESC_Database ${LANG_PORTUGUESEBR} "Importa o banco de dados para o MySql"
  LangString DESC_Vertrigo ${LANG_PORTUGUESEBR} "Vertrigo 2.35$\n - MySQL$\n - Apache$\n - Phpmyadmin"
  
  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${Software} $(DESC_Software)
	!insertmacro MUI_DESCRIPTION_TEXT ${Database} $(DESC_Database)
    !insertmacro MUI_DESCRIPTION_TEXT ${Vertrigo} $(DESC_Vertrigo)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

  
	Section "Uninstall"
		SetShellVarContext current
	
	
		Delete "$INSTDIR\logo.ico"
		Delete "$INSTDIR\programa.jar"
		Delete "$INSTDIR\programa_semsenha.jar"
		Delete "$INSTDIR\bd.sql"
		Delete /REBOOTOK "$INSTDIR\Uninstall.exe"

		RMDir /R /REBOOTOK "$INSTDIR"

		!insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuFolder

		Delete "$SMPROGRAMS\$StartMenuFolder\Software Gerenciador - Order By (Sem senha).lnk"
		Delete "$SMPROGRAMS\$StartMenuFolder\Software Gerenciador - Order By.lnk"
		Delete "$SMPROGRAMS\$StartMenuFolder\Desinstalar.lnk"
		RMDir "$SMPROGRAMS\$StartMenuFolder"
		
		Delete "$DESKTOP\Order By.lnk"

		DeleteRegKey HKCU "Software\Order By"
		DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Order By"

	SectionEnd