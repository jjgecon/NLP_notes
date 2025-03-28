#!/bin/bash

# Prompt for input values
read -p "Enter the number of CPUs (-N): " cpu_count
read -p "Enter the number of GPUs (-G): " gpu_count
read -p "Enter the memory size in GB (--mem=): " memory
read -p "Enter the time in HH:MM:SS format (--time): " time

# Generate the srun command
command="srun -A YOUR_ALLOCATION -N${cpu_count} -G${gpu_count} --mem=${memory}gb --time=${time} --pty \$SHELL"

# Display the command
echo -e "\nGenerated srun command:"
echo "$command"

# Optionally, run the command
read -p "Do you want to execute this command? (y/n): " execute
if [[ "$execute" == "y" ]]; then
    eval "$command"
else
    echo "Command not executed."
fi