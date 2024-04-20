#!/usr/bin/bash

# Create an empty list for mean_epis Test
mean_epis=()
# Find all files ending with "boldref.nii.gz" in "./sub-001/func/" and store them in the mean_epis list
for file in ./sub-001/func/*Test*T1w_boldref.nii.gz; do
    mean_epis+=("$file")
    echo "Found file: $file"
done


# Iterate over the mean_epis list and run the specified commands
i=1
for file in "${mean_epis[@]}"; do
    echo "Processing file: $file"

    # bbregister command
    # bbregister_cmd="bbregister --s sub-001 --mov $file --reg ../processed/register/epi-to-t1-test-$i.dat --dti"
    # echo "Running command: $bbregister_cmd"
    # $bbregister_cmd

    # mri_vol2vol command
    vol2vol_cmd="mri_vol2vol --mov $file --targ aparc.a2009s.nii.gz --o ../processed/sub-001/parcellations/aparc.a2009s.epi-test-$i.nii.gz --reg ../processed/sub-001/register/epi-to-t1-test-$i.dat --inv --nearest"
    echo "Running command: $vol2vol_cmd"
    $vol2vol_cmd

    ((i++))
done


# Create an empty list for mean_epis Traininf
mean_epis=()
# Find all files ending with "boldref.nii.gz" in "./sub-001/func/" and store them in the mean_epis list
for file in ./sub-001/func/*Training*T1w_boldref.nii.gz; do
    mean_epis+=("$file")
    echo "Found file: $file"
done


# Iterate over the mean_epis list and run the specified commands
i=1
for file in "${mean_epis[@]}"; do
    echo "Processing file: $file"

    # bbregister command
    # bbregister_cmd="bbregister --s sub-001 --mov $file --reg ../processed/register/epi-to-t1-training-$i.dat --dti"
    # echo "Running command: $bbregister_cmd"
    # $bbregister_cmd

    # mri_vol2vol command
    vol2vol_cmd="mri_vol2vol --mov $file --targ aparc.a2009s.nii.gz --o ../processed/sub-001/parcellations/aparc.a2009s.epi-training-$i.nii.gz --reg ../processed/sub-001/register/epi-to-t1-train-$i.dat --inv --nearest"
    echo "Running command: $vol2vol_cmd"
    $vol2vol_cmd

    ((i++))
done