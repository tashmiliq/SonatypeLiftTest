#!/usr/bin/env bash
input=""
function emit() {
    printf "# Stdout: $1\n" >> /tmp/fake-affix.sh.log
    printf "$1"
}

function tellAll() {
    emit '{ "version" : 3, "name" : "fake-affix" }'
}

function tellVersion() {
    temp=1 # $(affix -version)
    #echo "$temp"
    emit $temp
}

function run() {
    #echo "command: affix -c memoryleak -f $1"
    #echo "# Actual call: affix -c memory-leak -f $1" >> /tmp/fake-infer.sh.log
    path="outout"
    if [ ! -d "$path" ]
    then
      mkdir "$path"
    fi
    echo "#include <stdlib.h>
void foo(char *p){
    free(p);
    return 0;
}" > "$path/str.c"

echo "[{ \"type\": \"str.c\", \
          \"name\": \"str.c\", \
     	  \"message\": \"model for $1 is generated.\", \
          \"file\": \"N/A\", \
            \"line\": 0, \
            \"details_url\": \"https://help.sonatype.com/lift/extending-lift\" \
	    }]"
}

function applicable() {
    echo "true"
}

function tellName() {
        emit "Affix"
}

function main() {
    if [ "$#" -ne 3 ]; then
        echo "Usage: $0 DIRECTORY binary-file command(run, version,name)" >&2
        exit 1
    fi
    #input=$(cat <&0)
    echo "##############" >> /tmp/fake-affix.sh.log
    echo "# $(date)" >> /tmp/fake-affix.sh.log
    echo "# Args: $*" >> /tmp/fake-affix.sh.log
    echo "# $3" >> /tmp/fake-affix.sh.log

    case "$3" in
        run)
            run "$2"
            ;;
        name)
            tellName
            ;;

	applicable)
            applicable
            ;;

	version)
            tellVersion
            ;;
	esac
}

main $*
