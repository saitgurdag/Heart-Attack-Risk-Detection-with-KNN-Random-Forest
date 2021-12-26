import sys
from PyQt5.QtGui import QGuiApplication, QIcon
from PyQt5.QtQml import QQmlApplicationEngine
from mainFunctions import MainFunctions


APP = QGuiApplication(sys.argv)

main_func = MainFunctions()

ENGINE = QQmlApplicationEngine()
ENGINE.rootContext().setContextProperty('mainFunc', main_func)
ENGINE.load('main.qml')
ENGINE.quit.connect(APP.quit)

sys.exit(APP.exec_())
