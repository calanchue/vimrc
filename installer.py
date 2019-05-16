#!/usr/bin/python
import os
import argparse
import inspect
import sys

path = os.path.abspath(__file__)
curr_path = os.path.dirname(path)

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

def pc(line, color=bcolors.OKBLUE):
    print(color + line + bcolors.ENDC)

class Task():
    def install(self):
        pass
    def clean(self):
        pass

class Tmux(Task):
    def install(self):
        pc("install tmux")
        os.system(
            r"""
            ln -sf {curr_path}/proto.tmux.conf ~/.tmux.conf             
            git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
            tmux source ~/.tmux.conf
            ~/.tmux/plugins/tpm/scripts/install_plugins.sh
            """.format(curr_path=curr_path))

    def copy_conf(self):        
        #os.system("set -o xtrace;cp {curr_path}/proto.tmux.conf ~/.tmux.conf".format(curr_path=curr_path))
        os.system("set -o xtrace;cp ln -s {curr_path}/proto.tmux.conf ~/.tmux.conf".format(curr_path=curr_path))

    def clean(self):
        pc("clean tmux")
        os.system(
            r"""
            rm ~/.tmux.conf
            rm -rf ~/.tmux/
            """
        )

class Vim(Task):
    def install(self):
        pc("install vim")
        os.system("git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim")
        os.system("ln -sf {curr_path}/proto.vimrc ~/.vimrc".format(curr_path=curr_path))

    def clean(self):
        pc("clean vim")

class All(Task):
    def install(self):
        pc("install all")
        Tmux().install()

    def clean(self):
        pc("clean all")
        Tmux().clean()

if __name__ == "__main__":
    clsmembers = [ 
        item for item in inspect.getmembers(sys.modules[__name__], inspect.isclass) 
        if issubclass(item[1], Task) and item[1] is not Task
        ]     
    cls_dic = {}
    cls_name_list = []
    for item in clsmembers:
        task_name = item[0].lower()
        cls_dic[task_name] = item[1]
        cls_name_list.append(task_name)    

    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('task', type=str, nargs='?', default="all",  help='Task : ' + ", ".join(cls_name_list))
    parser.add_argument('work', type=str, nargs='?', default="install",  help='Work : install|clean')
    
    args = parser.parse_args()
    task = cls_dic[args.task]() 
    getattr(task, args.work)() #run task.work()    
