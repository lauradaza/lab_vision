# Warmup Questions

1.  What is the clone url of this repository?
    >   https://github.com/lauradaza/lab_vision.git

2.  What is the output of the ``cal`` command?

        A calendar. There are 6 different options to change the format of the calendar displayed. The options change 
        things like the first day of the week (monday or sunday), shows only a month, 3 months or the whole year or it
        can display dates in Julian calendar
        Febrero 2016
do lu ma mi ju vi sá
1 2 3 4 5 6
7 8 9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29

# Homework Questions

1.  What is the ``grep``command?
    >   It's a command to find a pattern in a file or a group of files. Its output is the line(s) where the pattern is present.

2.  What is a *makefile*?
    >   It's a program building tool that helps to automatically build and manage a program executables.

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >   It excludes directories from the searching when we're looking for a file.

5.  Where is the ``grub.cfg``  file
    >    /boot/grub/grub.cfg

6.  How many files with ``gnu`` in its name are in ``/usr/src``
    >   When we type find /usr/src/ -name *gnu there are no files

7.  How many files contain the word ``gpl`` inside in ``/usr/src``
    >   By typing grep -H -R "gpl" /usr/src/ | wc -l we obtain 586 files in total

8.  What does the ``cut`` command do?
    >   Removes an item from a place and saves it temporarily while we place it somewhere else.

9.  What does the ``wget`` command do?
    >   Download files from the internet.

9.  What does the ``rsync`` command do?
    >   Sinchronizes and copy files or directories that have changed remotely or localy. It's very fast because it just copies the part that have changed.

10.  What does the ``diff`` command do?
    >   Compares 2 files and look for the differences between them. It prints the lines that are not equal in both files.

10.  What does the ``tail`` command do?
    >   Prints the last part of a file. By default it prints the last 10 lines of the file.

10.  What does the ``tail -f`` command do?
    >   It keeps the file open and when the file grows it prints the new lines appended to it.

10.  What does the ``link`` command do?
    >   Creates a hard link between 2 files. Changing one of the files will affect the other. 

11.  How many users exist in the course server?
    >   There are 5 users

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >   % cat /etc/passwd | sort (it first find the users and the sort them)

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    >   % cat /etc/passwd | grep '/sbin/nologin'|wc -l

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github

16. What is the meaning of ``#! /bin/bash`` at the start of scripts?
    >   Bash is a program that interpret orders. The line #! /bin/bash defines that the program will be interpret using it.

17. How many unique images are in the ``sipi_images`` database?
    >   There are no "sipi_images" database
    
