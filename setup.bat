@echo off
REM Ce script tente d'installer PyQt5 et PyQt5-WebEngineWidgets.
REM Il essaie d'abord avec 'python -m pip' (méthode recommandée),
REM et si cela échoue, il tente avec 'pip3'.
REM Assurez-vous que Python 3 est déjà installé sur votre système.

set "PACKAGES=PyQt5 PyQt5-WebEngineWidgets"

echo Tentative de mise à jour de pip via 'python -m pip'...
python -m pip install --upgrade pip
if %errorlevel% equ 0 (
    echo pip mis à jour avec succès via 'python -m pip'.
    goto :install_modules_python_m_pip
) else (
    echo Échec de la mise à jour de pip via 'python -m pip'. Tentative avec 'pip3'.
    pip3 install --upgrade pip
    if %errorlevel% equ 0 (
        echo pip mis à jour avec succès via 'pip3'.
        goto :install_modules_pip3
    ) else (
        echo Échec de la mise à jour de pip via 'pip3'.
        echo Veuillez vérifier votre installation de Python et l'accès à pip/pip3.
        pause
        exit /b %errorlevel%
    )
)

:install_modules_python_m_pip
echo Tentative d'installation de %PACKAGES% via 'python -m pip'...
python -m pip install %PACKAGES%
if %errorlevel% equ 0 (
    echo Installation de %PACKAGES% terminée avec succès via 'python -m pip' !
    goto :end
) else (
    echo Échec de l'installation de %PACKAGES% via 'python -m pip'. Tentative avec 'pip3'.
    goto :install_modules_pip3
)

:install_modules_pip3
echo Tentative d'installation de %PACKAGES% via 'pip3'...
pip3 install %PACKAGES%
if %errorlevel% equ 0 (
    echo Installation de %PACKAGES% terminée avec succès via 'pip3' !
    goto :end
) else (
    echo Échec critique de l'installation de %PACKAGES% via 'pip3'.
    echo Cela peut être dû à un problème de connexion, des permissions, ou Python/pip non trouvé.
    pause
    exit /b %errorlevel%
)

:end
echo Opération terminée.
pause