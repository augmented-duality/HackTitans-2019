"""
This example script uses the library `speechemotionrecognition` and do the training and evaluating the models on
"""
from keras.utils import np_utils

from emotion.dnn import LSTM

from emotion.utilities import get_data, class_labels
import numpy as np
import matplotlib.pyplot as plt

dataset_path = 'dataset'


def dnn_example():
    x_train, x_test, y_train, y_test = get_data(dataset_path=dataset_path, flatten=False)
    y_train = np_utils.to_categorical(y_train)
    y_test = np_utils.to_categorical(y_test)

    print('ytrain ',y_train , len(y_train))
    print('ytest ', y_test , len(y_test))


    print('Starting LSTM')
    model = LSTM(input_shape=x_train[0].shape, num_classes=len(class_labels))
    model.train(x_train, y_train, x_test, y_test)
    prediction = model.evaluate(x_test, y_test)


    print(np.amax(prediction))
    plt.imshow(prediction )
    plt.show()
    plt.imshow(x_test[0])
    plt.show()






if __name__ == "__main__":

    dnn_example()
    print("Finsished")
