@echo off
:: ===========================================================
:: Auto-Generated File
:: ===========================================================
:: This file has been automatically generated by a tool
:: called 'clickgen'. For more information,
:: visit: https://www.github.com/ful1e5/clickgen
::
:: Credit: https://github.com/smit-sms
::         https://github.com/ful1e5/apple_cursor/issues/79
:: ===========================================================

REG DELETE "HKCU\Control Panel\Cursors\Schemes" /v "Bibata-Modern-Ice-Extra-Large Cursors" /f

:: ===============================================================================
:: This enables a popup message box to indicate a user for the operation complete.
:: ===============================================================================
echo x=msgbox("Successfully deleted the cursor!", 0+64, "Cursor") > %tmp%	mp.vbs
wscript %tmp%	mp.vbs
del %tmp%	mp.vbs
