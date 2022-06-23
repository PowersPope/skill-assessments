Q1: What is your home directory?

A1: /home/ubuntu

Q2: What is the output of this command?

A2: 
ubuntu@ip-172-31-84-180:~$ ls my_folder/
hello_world.txt

Q3: What is the output of each ls command?

A3:
ubuntu@ip-172-31-84-180:~$ ls my_folder
ubuntu@ip-172-31-84-180:~$ ls my_folder2/
hello_world.txt

Q4: What is the output of each?

A4: 
ubuntu@ip-172-31-84-180:~$ ls my_folder
ubuntu@ip-172-31-84-180:~$ ls my_folder2/
ubuntu@ip-172-31-84-180:~$ ls my_folder3/
hello_world.txt

Q5: What editor did you use and what was the command to save your file changes?

A5: I used Vim, and you can save the changes using :wq

Q6: What is the error?

A6: sudouser@ec2-3-89-108-167.compute-1.amazonaws.com: Permission denied (publickey).

Q7: What was the solution?

A7: You have to generate the public key again from your private key and add it to the 
`.ssh/authorized_keys` folder (which you have to create) in your new user's home directory.
This is because your new user doesn't have any ssh connections set up. You can only connect to the
server if you have the appropriate pair of public and private keys. The new user `sudouser` did not
have the correct ssh public key associated with it.

FYI: I use the terminal ssh to connect to the server.

Q8: What does the `sudo docker run` part of the command do? and what does the `salmon swim` part of the
command do?

A8: The sudo docker run runs the particular commands inside of a docker image. It starts and then
runs the docker image and command.
The `salmon swim` sends the commands salmon swim to the image that sudo docker run started. salmon is
the tool we are using, a transcript quantification from RNA-seq data tool, and swim is the command we
are sending to salmon. Which from the documentation says `perform super-secret operation`. Which is that
nice Salmon logo. 

Q9: What is the output of this command?

A9:
serveruser@ip-172-31-84-180:~$ sudo ls /root
[sudo] password for serveruser:
Sorry, try again.
[sudo] password for serveruser:
serveruser is not in the sudoers file.  This incident will be reported.

Q10: What is the output of `flask --version`?

A10: 
(base) serveruser@ip-172-31-84-180:~$ flask --version
Python 3.9.12
Flask 2.0.3
Werkzeug 2.0.3

Q11: What is the output of `mamba -V`?

A11: 
(base) serveruser@ip-172-31-84-180:~$ mamba -V
conda 4.13.0

Q12: What is the output of `which python`?

A12: 
(py27) serveruser@ip-172-31-84-180:~$ which python
/home/serveruser/miniconda3/envs/py27/bin/python

Q13: What is the output of `which python` now?

A13: 
(base) serveruser@ip-172-31-84-180:~$ which python
/home/serveruser/miniconda3/bin/python

Q14: What is the output of `salmon -h`?

A14: 
(salmonEnv) serveruser@ip-172-31-84-180:~$ salmon -h
salmon v1.4.0

Usage:  salmon -h|--help or
        salmon -v|--version or
        salmon -c|--cite or
        salmon [--no-version-check] <COMMAND> [-h | options]

Commands:
     index      : create a salmon index
     quant      : quantify a sample
     alevin     : single cell analysis
     swim       : perform super-secret operation
     quantmerge : merge multiple quantifications into a single file


Q15: What does the `-o athal.fa.gz` part of the command do?

A15: It names the file that we are downloading using curl to athal.fa.gz 

Q16: What is a `.gz` file?

A16: It is a compressed file on linux. Stands for GNU zipped.

Q17. What does the zcat command do?

A17: It prints out the contents of a compressed/zipped file.

Q18. what does the head command do?

A18: It shows a preview of the top/beginning of the file. Usually 5 lines.

Q19. what does the number 100 signify in the command?

A19: The 100 specifies the number of lines for head to show.

Q20. What is | doing? -- Hint using | in Linux is called "piping"

A20: This is the pipe command, it sends the stdout from the last command before the pipe to the next 
command after the pipe.

Q21. What is a .fa file? What is this file format used for?

A21: An .fa file is a fasta file. This is used to show reads and the headers above the sequence designate 
where they came from.

Q22: What format are the downloaded sequencing reads in?

A22: They are in .sra which seems to be a binary file type that needs to be unpacked by using fastq-dump
I believe they are binary versions of fastq files.

Q23: What is the total size of the disk?

A23: 7.6G

Q24: How much space is remaining on the disk?

A24: 2.7G

Q25: What went wrong? 

A25: There was an error that said the storage was exhausted. We didn't have enough space in our 
home directory to generate a fastq. We need to gzip the file.

Q26: What was your solution?

A26: I added the --gzip flag to the command.


