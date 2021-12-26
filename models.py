import seaborn as sns
import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import matplotlib.pyplot as plt
from sklearn import metrics
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score

from sklearn.ensemble import RandomForestRegressor
from sklearn.neighbors import KNeighborsClassifier
from sklearn.naive_bayes import BernoulliNB
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import confusion_matrix
import warnings
import plotly.express as px

from mlxtend.plotting import plot_confusion_matrix
import csv
from sklearn.tree import DecisionTreeClassifier

warnings.filterwarnings("ignore", category=DeprecationWarning)

heart=pd.read_csv('heart.csv')
heartprint = heart.head()


class Models:

    def __init__(self):
        self.x = heart.iloc[:, 1:-1].values
        self.y = heart.iloc[:, -1].values


        self.x_train, self.x_test, self.y_train, self.y_test = train_test_split(self.x, self.y, test_size= 0.2, random_state= 0)

        self.scaler = StandardScaler()
        self.x_train = self.scaler.fit_transform(self.x_train)
        self.x_test = self.scaler.transform(self.x_test)

    def decision_three(self,age, sex, exang, ca, cp, trtbps, chol, fbs, rest_ecg, thalach, oldpeak, slp):                                       ##DECİSİON THREE
        model_decisionThree=DecisionTreeClassifier()

        model_decisionThree.fit(self.x_train,self.y_train)
        dt=model_decisionThree.predict(self.x_test)
        metrics.accuracy_score(self.y_test,dt)


        cm2=confusion_matrix(self.y_test,dt)
        # # plot_confusion_matrix(cm2,figsize=(12,8),hide_ticks=True,cmap=plt.cm.Blues)

        # plt.title("Decision Three Model - Confusion Matrix")
        # plt.xticks(range(2), ["Heart Not Failed","Heart Fail"], fontsize=16)
        # plt.yticks(range(2), ["Heart Not Failed","Heart Fail"], fontsize=16)
        # plt.savefig('Decision_Three_Model_Confusion_Matrix.png')

        header = ['age','sex','cp','trtbps','chol','fbs','restecg','thalachh','exng','oldpeak','slp','caa']
        data = [age,sex,cp,trtbps,chol,fbs,rest_ecg,thalach,exang,oldpeak,slp,ca, '88']

        with open('heart_test_yeni.csv', 'w', newline='') as f:
            writer = csv.writer(f)

            writer.writerow(header)
            writer.writerow(data)

        print(heart.head)

        test=pd.read_csv('heart_test_yeni.csv')
        result = model_decisionThree.predict(test)

        print('dt',result[0])
        return result[0]

    def svm(self,age, sex, exang, ca, cp, trtbps, chol, fbs, rest_ecg, thalach, oldpeak, slp):
        model_svc = SVC()
        model_svc.C =9

        model_svc.fit(self.x_train, self.y_train)

        predicted = model_svc.predict(self.x_test)
        print("The accuracy of SVM is : ", accuracy_score(self.y_test, predicted) * 100, "%")
        header = ['age','sex','cp','trtbps','chol','fbs','restecg','thalachh','exng','oldpeak','slp','caa']
        data = [age,sex,cp,trtbps,chol,fbs,rest_ecg,thalach,exang,oldpeak,slp,ca]

        with open('heart_test_svc.csv', 'w', newline='') as f:
            writer = csv.writer(f)

            writer.writerow(header)
            writer.writerow(data)

        print(heart.head)

        test_svc=pd.read_csv('heart_test_svc.csv')
        result_svc = model_svc.predict(test_svc)

        print('deneme svc 1 çıkacak ',result_svc)
        return result_svc[0]

    def knn(self,age, sex, exang, ca, cp, trtbps, chol, fbs, rest_ecg, thalach, oldpeak, slp, thall, k):
        print("k value: ", k)
        k=int(k)
        data=heart
        data.iloc[:,-1:]
        asd = [data['age'],data['trtbps'],data['chol'],data['thalachh'],data['oldpeak'],data['thall']]
        asd = data.iloc[:,:-1].values
        data.iloc[:,0]
        data.iloc[:,2:]
        data.iloc[:,-1].values
        heart_attack = data.iloc[:,-1:].values

        # Veri kümemizi test ve train şekinde bölüyoruz

        x_train, x_test, y_train, y_test = train_test_split(asd,heart_attack,test_size=0.1,random_state=2)


        # KNeighborsClassifier sınıfını import ettik


        # KNeighborsClassifier sınıfından bir nesne ürettik
        # n_neighbors : K değeridir. Bakılacak eleman sayısıdır. Default değeri 5'tir.
        # metric : Değerler arasında uzaklık hesaplama formülüdür.
        # p : Alternatif olarak p parametreside verilir. p değerini 2 vererek uzaklık hesaplama formülünü
        # minkowski yerine öklid olarak değiştirebilirsiniz.
        knn = KNeighborsClassifier(n_neighbors=k,metric='hamming')

        # Makineyi eğitiyoruz
        knn.fit(x_train,y_train.ravel())

        # Test veri kümemizi verdik ve iris türü tahmin etmesini sağladık
        result = knn.predict(x_test)

        # Karmaşıklık matrisi
        from sklearn.metrics import confusion_matrix
        cm = confusion_matrix(y_test,result)
        print(cm)

        # Başarı Oranı
        from sklearn.metrics import accuracy_score
        accuracy = accuracy_score(y_test, result)
        # Sonuç : 0.98
        print(accuracy)

        header = ['age','sex','cp','trtbps','chol','fbs','restecg','thalachh','exng','oldpeak','slp','caa','thall']
        data = [age,sex,cp,trtbps,chol,fbs,rest_ecg,thalach,exang,oldpeak,slp,ca, thall]

        with open('heart_test_yeni.csv', 'w', newline='') as f:
            writer = csv.writer(f)

            writer.writerow(header)
            writer.writerow(data)

        print(heart.head)

        test=pd.read_csv('heart_test_yeni.csv')
        result = knn.predict(test)
        print("knn",result[0])
        return [result[0], accuracy]

    def random_forest(self, age, sex, exang, ca, cp, trtbps, chol, fbs, rest_ecg, thalach, oldpeak, slp, thall):
        
        data=heart
        data.iloc[:,-1:]
        asd = [data['age'],data['trtbps'],data['chol'],data['thalachh'],data['oldpeak'],data['thall']]
        asd = data.iloc[:,:-1].values
        data.iloc[:,0]
        data.iloc[:,2:]
        data.iloc[:,-1].values
        heart_attack = data.iloc[:,-1:].values

        # Veri kümemizi test ve train şekinde bölüyoruz

        x_train, x_test, y_train, y_test = train_test_split(asd,heart_attack,test_size=0.3,random_state=2)

        from sklearn.ensemble import RandomForestClassifier
        rnd_clf = RandomForestClassifier(n_estimators=200, max_leaf_nodes=16, n_jobs=-1)
        rnd_clf.fit(x_train, y_train)
        y_pred_rf = rnd_clf.predict(x_test)
        from sklearn.metrics import accuracy_score
        accuracya = accuracy_score(y_test, y_pred_rf)
        # Sonuç : 0.98
        print(accuracya)

        header = ['age','sex','cp','trtbps','chol','fbs','restecg','thalachh','exng','oldpeak','slp','caa','thall']
        data = [age,sex,cp,trtbps,chol,fbs,rest_ecg,thalach,exang,oldpeak,slp,ca, thall]

        with open('heart_test_yeni.csv', 'w', newline='') as f:
            writer = csv.writer(f)

            writer.writerow(header)
            writer.writerow(data)

        print(heart.head)

        test=pd.read_csv('heart_test_yeni.csv')
        result = rnd_clf.predict(test)
        print("random forest", result)
        return [result[0], accuracya]



# t=Models()
# t.random_forest('63','1','1','0','3','150','241','1','0','180','3.6','0','2')
#knn(self,age, sex, exang, ca, cp, trtbps, chol, fbs, rest_ecg, thalach, oldpeak, slp, thall):
#t.knn('63','1','1','0','3','150','241','1','0','180','3.6','0','2')            11111
#t.knn('30','0','1','2','0','130','170','0','1','121','2.7','0','3')            00000