import numpy
from scipy import misc

def get_picture(paths):
    address = 0
    fo = open("texture","w")
    for path in paths:
        image = misc.imread(path,mode="RGBA")
        the_shape = image.shape
        new_shape = (the_shape[0],the_shape[1])
        shape_array = numpy.ones(new_shape, dtype=numpy.int)
        tri = numpy.tril(shape_array)
        for i in range(the_shape[0]):
            for j in range(the_shape[1]):
                if i == 0 and j == 0:
                    print(str(hex(address))[2:])
                if tri[i][j] == 1:
                    fo.write("@{0}\n".format(str(hex(address))[2:]))
                    address = address + 1
                    fo.write(numpy.binary_repr(image[the_shape[0] - i - 1][j][0],width=8))
                    fo.write(numpy.binary_repr(image[the_shape[0] - i - 1][j][1],width=8))
                    fo.write(numpy.binary_repr(image[the_shape[0] - i - 1][j][2],width=8))
                    fo.write("\n")
    fo.close()

if __name__ == "__main__":
    get_picture(["5_Target.png","5_Target.png"])