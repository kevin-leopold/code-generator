#!/bin/bash


while getopts i:o: flag
do
    case "${flag}" in
        i) input=${OPTARG};;
        o) output=${OPTARG};;
    esac
done


echo $input
echo $output

openapi-generator-cli generate -i $input -g dart-dio-next -o $output &&
cd $output && 
dart pub get &&
dart pub run build_runner build --delete-conflicting-outputs



