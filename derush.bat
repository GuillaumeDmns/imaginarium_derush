REM Script permettant la copie et le renommage des fichiers facilement.
REM Nécessite le logiciel "advanced renamer"

REM #####################################
REM LIGNE CI DESSOUS A NE SURTOUT PAS MODIFIER
SET jour=Samedi




REM #############################################################################################
REM #############################################################################################
REM #############################################################################################




SET heure=1858
SET nom=GD



REM INDICATION POUR CHOISIR L'HEURE (NE PAS MODIFIER LA LIGNE CI-DESSOUS)
REM heure=HHMM
REM exemple : heure=0312 pour 3h12 et heure=1858 pour 18h58, HEURE DU DERUSH (IMPORTANT)

REM INDICATION POUR ATTRIBUER LE NOM : (NE PAS MODIFIER LES LIGNES CI-DESSOUS !!)
REM Guillaume DAMIENS :    GD
REM Clément SATIN :        CS
REM Clément GIUMMARA :     CG
REM Lucie RADENNE :        LR
REM Pierre FAGOT :         PF
REM Victor GALAS :         VG
REM Charles ROLLAND :      CR
REM Omar PEREZ :           OP
REM Anthony FEYNIE :       AFE
REM Antoine FRAUCIEL :     AFR









REM #############################################################################################
REM #############################################################################################
REM #############################################################################################



REM Localisation des disques

SET disk_derush=F:\
SET disk_backup=F:\backup


REM #####################################
REM #####################################
REM test pour être sur que l'on a incrémenté, sinon bye

IF EXIST %disk_derush%\%jour%\%nom%\%heure% GOTO :oef


REM création des dossiers nécessaires correspondants au numéro du dessus

mkdir %disk_derush%\%jour%\%nom%\%heure%
SET destination=%disk_derush%\%jour%\%nom%\%heure%
mkdir %destination%\old


REM copie dans un dossier temporaire

robocopy %CD% %destination%\old * /s


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
for /R %destination% %%f in (*.mxf) do move %%f %destination%

ECHO %destination%
REM on supprime tout le reste

rmdir /S /Q %destination%\old


REM Copie de sauvegarde avec les noms originaux

robocopy %destination% %disk_backup%\%jour%\%nom%\%heure% * /S


REM Renommage des fichiers selon le nom du dossier parent
REM Utilisation du logiciel Advanced Renamer

SET PATH=%PATH%;C:\Program Files (x86)\Advanced Renamer
arenc -e "C:\Program Files (x86)\Advanced Renamer\BatchMethods\if_rename.aren" -p %destination%

REM mkdir %disk_derush%\%jour%\%nom%\%heure%\rushs_selectionnes
REM mkdir %disk_derush%\%jour%\%nom%\%heure%\rushs_poubelle


REM fin !

pause
