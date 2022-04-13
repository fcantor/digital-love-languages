#!/bin/bash
### clean - function that reverts back the folder-poetry project to its initial state
### before adding or changing any files that the listfiles and look functions do
### RUN THIS WHILE INSIDE 'the living room' directory

olddir=$PWD;
declare -i dirdepth=0;
function clean() {
        cd "$1";
        for file in *
        do
                ## create an empty bag.txt inside 'the living room'
                cp "../empty-bag.txt" "bag.txt" 2> /dev/null

                ### Remove files generated for each step to revert to original tree
                ### These files will be generated again later
                find . -name "okay, now to find*" -exec rm -f {} \;
                find . -name "AHHH*" -exec rm -f {} \;
                find . -name "okay, last but not least*" -exec rm -f {} \;
                find . -name "wait, i*" -exec rm -f {} \;
                find . -name "omg my KEYS*" -exec rm -f {} \;
                find . -name "wait.. where're*" -exec rm -f {} \;
                find . -name "...they're not in the bed" -exec rm -f {} \;

                # if inside the bedroom, create the following files if it doesn't exist
                if [[ "$PWD" == "/Users/cheska/Repos/sfpc/spring-2022/digital-love-languages/homework/folder-poetry/the living room/the bedroom" ]]
                then
                    touch "oh, since i'm in here, i'll change real quick" 2> /dev/null
                    touch "shoot, i need to make my bed" 2> /dev/null
                    touch "should i dress like a cozy troll or a hot villain?" 2> /dev/null
                    touch "tada! i am dressed as a cute gremlin" 2> /dev/null
                    touch "that's a compromise, right?" 2> /dev/null
                    touch "how did my keys get in there?" 2> /dev/null
                fi
                #Work our way thru the system recursively
                if [ -d "$file" ]
                then
                        dirdepth=$dirdepth+1;
                        clean "$file";
                        cd ..;
                fi
        done
        ##Done with this directory - moving on to next file
        let dirdepth=$dirdepth-1;
}
clean "$1";
##Go back to where we started
cd $olddir 2> /dev/null
unset i dirdepth;
## Test
echo "Folder Poetry project has been reverted."

## Export function
export -f clean
