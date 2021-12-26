from PyQt5.QtCore import pyqtSlot, QObject, pyqtSignal
from models import Models
import threading



class MainFunctions(QObject):
    low = pyqtSignal(str)
    high = pyqtSignal(str)

    @pyqtSlot()
    def kmeansClicked(self):
        print("K-Means was pressed")

    @pyqtSlot()
    def randomforestClicked(self):
        print("Random Forest was pressed")


    @pyqtSlot()
    def knnClicked(self):
        print("KNN was pressed")

    @pyqtSlot(str,str,str,str,str,str,str,str,str,str,str,str,str,str, str)
    def testClicked(self, aNumber, age, sex, exang, ca, cp, trtbps, chol, fbs, rest_ecg, thalach, oldpeak, slp, thall, k):
        print(aNumber, age, sex, exang, ca, cp, trtbps, chol, fbs, rest_ecg, thalach, oldpeak, slp)  

        T= Models()

        if aNumber=="2":
            # T.decision_three(age, sex, exang, ca, cp, trtbps, chol, fbs, rest_ecg, thall, thalach, oldpeak, slp)
            result=T.random_forest(age, sex, exang, ca, cp, trtbps, chol, fbs, rest_ecg, thalach, oldpeak, slp, thall)
            print(result)
            if result[0]==0:
                print("{:.2%}".format(result[1]))
                self.low.emit(str("{:.2%}".format(result[1])))
            elif result[0]==1:
                print("{:.2%}".format(result[1]))
                self.high.emit(str("{:.2%}".format(result[1])))

        elif aNumber=="1":
            result=T.knn(age, sex, exang, ca, cp, trtbps, chol, fbs, rest_ecg, thalach, oldpeak, slp, thall, k)
            print(result)
            if result[0]==0:
                print("{:.2%}".format(result[1]))
                self.low.emit(str("{:.2%}".format(result[1])))
            elif result[0]==1:
                print("{:.2%}".format(result[1]))
                self.high.emit(str("{:.2%}".format(result[1])))
        

    