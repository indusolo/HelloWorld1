import numpy as np
import cv2
from matplotlib import pyplot as plt
import cmath


img1 = np.ones((512,512))
print(img1)
row,col = img1.shape
i=0


for u in range(-2,3,1):
    for v in range(-2,3,1):
        for x in range(row):
            for y in range(col):
                img1[x,y] = np.cos(2*3.14*(u*x/512+v*y/512))

        #print(u,v)
        plt.subplot(5,5,i+1),plt.imshow(img1,cmap='gray')
        plt.title("u=" + str(u) + ",v=" + str(v),fontsize=10)
        plt.xticks([]), plt.yticks([])

        i=i+1

plt.show()