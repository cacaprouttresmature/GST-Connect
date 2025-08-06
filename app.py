import sys
from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout
from PyQt5.QtWebEngineWidgets import QWebEngineView
from PyQt5.QtCore import QUrl
from PyQt5.QtGui import QIcon
import os # <-- N'oubliez pas d'importer le module 'os' !

class WebShortcutsApp(QWidget):
    def __init__(self):
        super().__init__()

        # --- Définir self.script_dir ici, dans la méthode __init__ ---
        # Cela rend self.script_dir accessible partout dans l'instance de la classe.
        self.script_dir = os.path.dirname(os.path.abspath(__file__))

        self.setWindowTitle("GST Connect")
        self.setGeometry(100, 100, 800, 600) # x, y, largeur, hauteur
        self.init_ui()

    def init_ui(self):
        main_layout = QVBoxLayout()
        self.setLayout(main_layout)

        self.browser = QWebEngineView()

        #Logo De fenetre

        icon_file_name = "logo.svg" # <--- NOM DE VOTRE FICHIER ICÔNE ICI (ex: "mon_icone.png" ou "app.ico")
        icon_path = os.path.join(self.script_dir, "images", icon_file_name )

        if os.path.exists(icon_path):
            self.setWindowIcon(QIcon(icon_path))
        else:
            print(f"ATTENTION : Le fichier icône n'a pas été trouvé à l'emplacement : {icon_path}")

        # Maintenant, accédez à script_dir en utilisant 'self.script_dir'
        # D'après votre capture d'écran VS Code, `index.html` est probablement dans le dossier `assets`.
        html_file_path = os.path.join(self.script_dir, "index.html")

        # Facultatif : Ajouter des instructions print pour le débogage et vérifier l'existence du fichier
        if not os.path.exists(html_file_path):
            print(f"ERREUR : Le fichier HTML n'a pas été trouvé à l'emplacement : {html_file_path}")
            # Afficher une page HTML de secours dans le navigateur si le fichier n'est pas trouvé
            self.browser.setHtml(f"<h1>Erreur de chargement !</h1><p>Le fichier index.html n'a pas été trouvé.</p><p>Vérifiez le chemin : {html_file_path}</p>")
        else:
            print(f"Chargement du fichier HTML depuis : {html_file_path}")
            self.browser.setUrl(QUrl.fromLocalFile(html_file_path))

        main_layout.addWidget(self.browser)

if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = WebShortcutsApp()
    window.show()
    sys.exit(app.exec_())