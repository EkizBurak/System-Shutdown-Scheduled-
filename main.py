# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys

from PySide2.QtCore import Signal, Slot, QObject

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine

from os import system
from time import strftime,sleep

class MainWindow(QObject):
    hide= Signal(str)
    @Slot(str, str)
    def baslat(self, saat, dakika):

        if len(dakika)==1:
            dakika = "0" + dakika
        if len(saat)==1:
            saat = "0" + saat

        yedekDakika=int(dakika)+1

        if len(str(yedekDakika))==1:
            yedekDakika = "0" + str(yedekDakika)

        if str(yedekDakika)=="60":
            yedekDakika="00"
            saat=int(saat)+1
            if saat==24:
                saat="00"
            if len(str(saat))==1:
                saat = "0" + str(saat)


        self.hide.emit("")
        while True:
            print("calisti")
            if strftime("%H %M") == saat+ " " + dakika or strftime("%H %M") == saat+ " " + str(yedekDakika):
                system("shutdown -s")
                break
            sleep(50)

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    main=MainWindow()
    engine.rootContext().setContextProperty("backend", main)
    engine.load(os.fspath(Path(__file__).resolve().parent / "qml/main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())

