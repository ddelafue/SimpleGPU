import numpy
from scipy import misc

def make_it(filepath):
    list_1d_array = []
    the_four = []
    fo = open(filepath,"r")
    lines = fo.readlines()
    for line in lines:
        the_four = []
        stringy = line.strip()
        the_four.append(int(stringy[0:7],2))
        the_four.append(int(stringy[8:15],2))
        the_four.append(int(stringy[16:23],2))
        list_1d_array.append(numpy.array(the_four))
    x = numpy.array(list_1d_array)
    print(x)
    print(x.size)
    x = x.reshape((480,640,3))
    x.astype(numpy.uint8)
    misc.imsave("Weird_image.png", x)


def make_the_weird_file():
    fo = open("dumbfile","w")
    for i in range(480):
        for j in range(640):
            fo.write("111111111111111111111111\n")


if __name__ == "__main__":
    make_the_weird_file()
    make_it("dumbfile")