@ECHO OFF

ECHO --------------------------------------------------------------------------
ECHO - CALL backup-db-and-app.bat
ECHO --------------------------------------------------------------------------
CALL trackit-backup.bat
ECHO -

ECHO --------------------------------------------------------------------------
ECHO - CALL trackit-deploy.bat
ECHO --------------------------------------------------------------------------
CALL trackit-deploy.bat
ECHO -