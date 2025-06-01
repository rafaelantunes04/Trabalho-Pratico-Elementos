@echo off
setlocal EnableExtensions EnableDelayedExpansion

if not exist ".venv" (
    python --version
    if !ERRORLEVEL! equ 0 (
        echo.
        set /P "answer=Nao tens virtual environment, queres criar um novo com as bibliotecas? (y/n): "
        echo.

        if /I "!answer!"=="y" (
            echo A criar virtual environment...
            python -m venv .venv

            call ".venv\Scripts\activate.bat"
            
            echo.
            echo Ambiente virtual criado com sucesso, instalando bibliotecas.
            echo.

            python -m pip install --upgrade pip
            pip install scikit-learn pandas requests matplotlib seaborn beautifulsoup4

            echo.
            echo Pacotes instalados com sucesso.
            echo.

            set /P "dummy=Pressione ENTER para sair..."
            exit /B
        ) else (
            echo Operacao cancelada pelo usuario.
            echo.
            set /P "dummy=Pressione ENTER para sair..."
            exit /B
        )
    ) else (
        echo Nao tens Python instalado. Por favor instala o Python primeiro.
        echo.
        set /P "dummy=Pressione ENTER para sair..."
        exit /B
    )
) else (
    echo Ja tens o virtual environment criado em ".venv".
    echo.
    set /P "dummy=Pressione ENTER para sair..."
    exit /B
)
