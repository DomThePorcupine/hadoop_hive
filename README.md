## What is this?
  
This is a Dockerfile + docker-compose.yml designed to get you up and running
for Pitt CS1699 and hadoop

## How to use:

1. Clone the repo: `git clone https://github.com/domtheporcupine/hadoop.git`

2. Cd into the cloned directory `cd hadoop`

3. Build container: `docker-compose build` (this might take some time)

4. Run the container and attach to the shell: `docker-compose run hadoop_main /bin/bash`

Now if you run `ls` you will see a directory called hdfs which contains
your input directory. That is where you will put hamlet (it is already there
if you cloned this repo). If not simply `cd hdfs/input` and then run:
`wget https://raw.githubusercontent.com/DomThePorcupine/hadoop/master/src/hdfs/input/hamlet.txt`

Next you will want to compile the WordCount.java program found [here](https://hadoop.apache.org/docs/r2.7.2/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html#Example:_WordCount_v1.0)
  
This repo already contains the WordCount.java file from the above link, so
all you have to do is compile and run it!

1. Compile: `hadoop com.sun.tools.javac.Main WordCount.java`

2. Create a jar file: `jar cf wc.jar WordCount*.class`

3. Run it! `hadoop jar wc.jar WordCount /hadoop/projects/hdfs/input /hadoop/projects/hdfs/output`

Congrats! You just performed wordcount on hamlet!

You can look at the output by running `cat hdfs/output/part-r-00000`

**NOTE!** If you try to run the count again it will throw an exception because it can't handle
the output directory already existing. Simply run `rm -rf hdfs/output` and then you can run
wordcount again.
