// DEPENDENCE: a.txt
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*

main() {
    var a = GlobalParam()
    a.setNoisy(false)
    var path2: String = getcwd()
    BZUtils.compress("${path2}/a.txt")
    return 0
}
