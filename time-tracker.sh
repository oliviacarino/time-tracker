#!/bin/bash -e

# A simple script that tracks your time spent on a task and
# saves it to a txt file

# May create more features in the future where you can save
# a day's work to individual files in some /tasks directory.


# specify title of task
# echo current time and save to variable
# echo end time and save to variable
# save end - start as value

# START TASK
start() {
    echo -n "Enter a title for your next task: ";
    read taskTitle
    startTime=$( date '+%m-%d-%y --- %r' )
    echo $taskTitle >> tasks.txt
    echo $startTime >> tasks.txt
    # instead of using echo, pass output to file
}

# END TASK
end() {
    endTime=$( date '+%m-%d-%y --- %r' )
    echo $endTime >> tasks.txt
    echo " "  >> tasks.txt
    # instead of using echo, pass output to file
}

# Convert timestamps for startTime and endTime to epoch
#timestamp() {
#    date '+%s%N' --date="$1"
#}

# CALCULATE TIME SPENT ON TASK
#timeSpent() {
#    echo $(( $(timestamp "$endTime") - $(timestamp "$startTime") ))
#}

# Read in option to log the task start and end times
while [ ! $# -eq 0 ]
do
    case "$1" in
        --start | -s)
            start
            exit
            ;;
        --end | -e)
            end
#            timeSpent
            exit
            ;;
    esac
    shift
done
