REM Script permettant la copie et le renommage des fichiers facilement.
REM Nécessite le logiciel "advanced renamer"

REM #####################################
REM INCREMENTER CE NUMERO A CHAQUE FOIS !

SET numero=001


REM #####################################
REM #####################################
REM Localisation des disques

SET disk_derush=D:\
SET disk_backup=D:\backup


REM ##################################### 
REM #####################################
REM test pour être sur que l'on a incrémenté, sinon bye

IF EXIST %disk_derush%\%numero%
EXIT REM #####################################


REM création des dossiers nécessaires correspondants au numéro du dessus

mkdir %disk_derush%\%numero%
SET destination=%disk_derush%\%numero%
mkdir %destination%\old


REM copie dans un dossier temporaire

robocopy %CD% %destination%\old . /S


REM on remonte tous les fichiers qui nous intéressent

for /R %destination% %%f in (*.mp4) do move %%f %destination%
for /R %destination% %%f in (*.mov) do move %%f %destination%
for /R %destination% %%f in (*.mts) do move %%f %destination%
for /R %destination% %%f in (*.mp3) do move %%f %destination%
for /R %destination% %%f in (*.aac) do move %%f %destination%
for /R %destination% %%f in (*.wav) do move %%f %destination%
for /R %destination% %%f in (*.raf) do move %%f %destination%
for /R %destination% %%f in (*.jpg) do move %%f %destination%
for /R %destination% %%f in (*.rw2) do move %%f %destination%


REM on supprime tout le reste

rmdir /S /Q %destination%\old


REM Copie de sauvegarde avec les noms originaux

robocopy %destination% %disk_backup%\%numero% . /S


REM Renommage des fichiers selon le nom du dossier parent
REM Utilisation du logiciel Advanced Renamer

SET PATH=%PATH%;C:\Program Files (x86)\Advanced Renamer
arenc -e "C:\Program Files (x86)\Advanced Renamer\BatchMethods\if_rename.aren" -p %destination%

mkdir %disk_derush%\%numero%\rushs_selectionnes
mkdir %disk_derush%\%numero%\rushs_poubelle


REM fin !

pause
