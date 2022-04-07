#!/bin/bash
olddir=$PWD;
declare -i dirdepth=0;
function listfiles() {
        cd "$1";
        for file in *
        do
                for ((i=0; $i < $dirdepth; i++))
                do
                        ##Tab between each level
                        printf "\t";
                done
                 ## find text files
                if [[ $file == *.txt ]];
                then
                        cat "$file"
                fi
                ## Print directories with brackets ([directory])
                if [ -d "$file" ]
                then
                        printf "\1👣[$file]\n";
                else
                        printf "💭$file\e[0m\n";
                fi
                ##Work our way thru the system recursively
                # if [ -d "$file" ]
                # then
                #         #dirdepth=$dirdepth+1;
                #         listfiles "$file";
                #         #cd ..;
                # fi
        done
        ##Done with this directory - moving on to next file
        let dirdepth=$dirdepth-1;
}
listfiles "$1";
##Go back to where we started
# cd $olddir;
# unset i dirdepth;
export -f listfiles