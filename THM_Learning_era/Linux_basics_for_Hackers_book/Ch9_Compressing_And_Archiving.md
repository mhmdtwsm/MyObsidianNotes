---
tags:
  - tar
---

## Compressing

The Compression is a way to make the files be smaller. There are 2 types of compression:
- ***Loosy***
- ***Loosless***

The ***Loosy*** compression is suitable for media files like `mp3`, `jpg`, `mp4`, These kind of files can be compressed while loosing some the data on it might not be noticeable. The ***Loosy*** compression is a type of compression while it is okay to reduce the size of the file by loosing some of the data in it.

The ***Loosless*** compression is a type of compression where every bit of the data is crucial so there is no tolerance with loosing data, so the ***Loosless*** compression is a type of compression where there are algorithms to rewrite the file with a way that reduces the size of it and keeps the data of the file without loss.  
## Archiving

Archiving is saving lots of file in one in one file.

The `tar` is a program made to archive files. The name of the program `tar` stands for `tape archiv` and it came from the old days of the computers when data was stored in tapes.

Let's assume that we have three files called `file1`, `file2`, `file3`, to but them in an archive we will use the `tar` command this way:
```bash
tar -cvf files.tar file1 file2 file3
```

- `tar`: The tar command
- `-cvf`: The flags to do certain things with the program
	1. `c`: means create
	2. `v`: means Verbose, which tells that you are dealing with list of a files
	3. `f`: tells the program to write the archive in a specific file with the name you will give it
- The first input to the program is name of the archive
- The rest of the inputs are the list of the files will be put in the archive

#### Note that 
the size of the three files will increased while put in the `tarball`(the archive)