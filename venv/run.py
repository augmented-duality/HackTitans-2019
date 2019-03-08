"""
This example script uses the library `emotion` and do the training and evaluating the models on
"""
from keras.utils import np_utils

from emotion.dnn import LSTM

from emotion.utilities import get_data, class_labels
import numpy as np
import matplotlib.pyplot as plt
import vlc
import click
import time
import pyglet as pg
from collections import Counter
import random as rnd

dataset_path = 'dataset'


def dnn_example():
    x_train, x_test, y_train, y_test = get_data(dataset_path=dataset_path, flatten=False)
    y_train = np_utils.to_categorical(y_train)
    y_test = np_utils.to_categorical(y_test)

    print('ytrain ',y_train , len(y_train))
    print('ytest ', y_test , len(y_test))


    print('Starting LSTM')
    print("Number of classes = ",len(class_labels))
    model = LSTM(input_shape=x_train[0].shape, num_classes=len(class_labels))
    model.train(x_train, y_train, x_test, y_test)
    prediction = model.evaluate(x_test, y_test)

    rand_index = rnd.randint(0,len(prediction))


    print("prediction ",rand_index,prediction[rand_index])

    p = np.argmax(prediction[rand_index])

    print("amax value " , np.amax(prediction[rand_index]),"index ",p)



    """
    
    index = np.argmax(prediction , axis=1)
    print(index)
    print(np.amax(index))
    p = np.amax(prediction)
    print(p)

    mylist = index

    one=0
    two=0
    three=0
    zero=0

    for i in mylist:
        if i==1:
            one=one+1
        elif i==2:
            two+=1
        elif i==3:
            three+=1
        elif i==0:
            zero+=1

    p = np.argmax([zero,one, two,three])
    print("maxxx = ",p)



    #pp = max(k for k,v in Counter(mylist).items() if v>1)


    """
    #plt.imshow(prediction[rand_index])
    #plt.show()

    if p==0 :
        music = pg.resource.media("music/befree.mp3", streaming=False)
    elif p==1:
        music = pg.resource.media("music/delicate.mp3", streaming=False)
    elif p==2:
        music = pg.resource.media("music/allfallsdown.mp3", streaming=False)
    else:
        music = pg.resource.media("music/howlong.mp3", streaming=False)

    #m = vlc.MediaPlayer("venv/music/befree.mp3")

    #m.play()

    #time.sleep(10)
    #music = pg.resource.media("music/befree.mp3",streaming=False)
    music.play()

    pg.app.run()

    #time.sleep(10)
    #pg.app.exit()



    plt.imshow(x_test[0])
    #lt.show()






if __name__ == "__main__":

    dnn_example()
    print("Finsished")
