import os
import glob

wiki_list = glob.glob("*.txt")
map(lambda x: os.system("""vim -c ":so twikifilter.vim" {}""".format(x)),wiki_list)
