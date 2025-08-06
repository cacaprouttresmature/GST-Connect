@echo off
REM Ce script tente d'installer PyQt5 et PyQt5-WebEngineWidgets.
REM Il essaie d'abord avec 'python -m pip' (m�thode recommand�e),
REM et si cela �choue, il tente avec 'pip3'.
REM Assurez-vous que Python 3 est d�j� install� sur votre syst�me.

set "PACKAGES=PyQt5 PyQt5-WebEngineWidgets"

echo Tentative de mise � jour de pip via 'python -m pip'...
python -m pip install --upgrade pip
if %errorlevel% equ 0 (
    echo pip mis � jour avec succ�s via 'python -m pip'.
    goto :install_modules_python_m_pip
) else (
    echo �chec de la mise � jour de pip via 'python -m pip'. Tentative avec 'pip3'.
    pip3 install --upgrade pip
    if %errorlevel% equ 0 (
        echo pip mis � jour avec succ�s via 'pip3'.
        goto :install_modules_pip3
    ) else (
        echo �chec de la mise � jour de pip via 'pip3'.
        echo Veuillez v�rifier votre installation de Python et l'acc�s � pip/pip3.
        pause
        exit /b %errorlevel%
    )
)

:install_modules_python_m_pip
echo Tentative d'installation de %PACKAGES% via 'python -m pip'...
python -m pip install %PACKAGES%
if %errorlevel% equ 0 (
    echo Installation de %PACKAGES% termin�e avec succ�s via 'python -m pip' !
    goto :end
) else (
    echo �chec de l'installation de %PACKAGES% via 'python -m pip'. Tentative avec 'pip3'.
    goto :install_modules_pip3
)

:install_modules_pip3
echo Tentative d'installation de %PACKAGES% via 'pip3'...
pip3 install %PACKAGES%
if %errorlevel% equ 0 (
    echo Installation de %PACKAGES% termin�e avec succ�s via 'pip3' !
    goto :end
) else (
    echo �chec critique de l'installation de %PACKAGES% via 'pip3'.
    echo Cela peut �tre d� � un probl�me de connexion, des permissions, ou Python/pip non trouv�.
    pause
    exit /b %errorlevel%
)

:end
echo Op�ration termin�e.
pause