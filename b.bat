@echo off
title "GANTI PASSWORD RDP" > NUL

color e

echo *Password minimal 10 karakter
echo *Password tidak boleh pakai spasi
echo *Password harus kombinasi huruf kecil, huruf besar, angka dan karakter
echo *Dimohon catat password dalam catatan pribadi, sebelum mengganti password
echo:

set /p PWD=Masukkan Password Baru : 
set /p PWD2=Masukkan Ulang Password : 

call :strLen PWD strlen

echo:

if %strlen% LSS 10 echo (!) Password minimal 10 karakter
if NOT %PWD% == %PWD2% echo (!) Kedua password tidak sama
if %strlen% GEQ 10 (if %PWD% == %PWD2% net user Administrator %PWD% & echo PASSWORD BERHASIL DIGANTI)

timeout /t 5 /nobreak
exit

:strLen
setlocal enabledelayedexpansion

:strLen_Loop
   if not "!%1:~%len%!"=="" set /A len+=1 & goto :strLen_Loop
(endlocal & set %2=%len%)
