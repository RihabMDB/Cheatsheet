##############################################################################
# BASH BASICS
##############################################################################
name="John"
echo "${name}"
echo "${name/J/j}"    #=> "john" (substitution)
echo "${name:0:2}"    #=> "Jo" (slicing)
echo "${name::2}"     #=> "Jo" (slicing)
echo "${name::-1}"    #=> "Joh" (slicing)
echo "${name:(-1)}"   #=> "n" (slicing from right)
echo "${name:(-2):1}" #=> "h" (slicing from right)
echo "${food:-Cake}"  #=> $food or "Cake"

exit      # logs out of current session

$#	      # Used to expands the number of arguments passed to the script.
$1, $2	  # Used as an input param­eter that you can add when running script.
$_	      # Last argument of the previous command
$	        # Used for parameters and variables.
$?	      # Exit status of last task
$!	      # PID of last background task
$$	      # PID of shell
$0	      # Filename of the shell script
${PIPESTATUS[n]}	return value of piped commands (array)

()	      # Used for running commands in a subshell.
$()	      # Used to save the output of commands.
(())	    # Used for arithmetic.
$(())	    # Used to retrieve the output of arithmetic expressions.
[]	      # Used in filename expansion and string manipulation.
<( )	    # It is very similar to a pipe and used for process substitution.
{ }	      # Used to expand sequences.
${ }	    # Used for string manipulation and variable interpolation.
|	        # Used to run multiple commands together.|
>	        # Used to send output to a file.
>>	      # Used to append output to a file.
;	        # Used to separate multiple commands.
<	        # Used to get input from a file.
/etc/profile	#Executed automatically at login.


##############################################################################
# Exit code 
##############################################################################

exit 0   # Exit the script successfully
exit 1   # Exit the script unsuccessfully
echo $?  # Print the last exit code


##############################################################################
# Comparison Operators
##############################################################################

-eq	      # is equal to
-ne	      # is not equal to
-gt	      # is greater than
-ge	      # is greater than or equal to
-lt	      # is less than
-le	      # is less than or equal to
-z	      # string is null
-n	      # string is not null

##############################################################################
# Regular Expressions
##############################################################################

ls > output.txt            # stdout to (file)
ls >> output.txt           # stdout to (file), append
ls 2> error.log            # stderr to (file)
ls 2>&1                    # stderr to stdout
ls 2>/dev/null             # stderr to (null)
ls >output.txt 2>&1        # stdout and stderr to (file), equivalent to &>
ls &>/dev/null             # stdout and stderr to (null)
echo "$0: warning: too many users" >&2  # print diagnostic message to stderr


##############################################################################
# Regular Expressions
##############################################################################

.	      # Matches any single character.
?	      # The preceding item is optional and will be matched, at most, once.
*	      # The preceding item will be matched zero or more times.
+	      # The preceding item will be matched one or more times.
{N}	    # The preceding item is matched exactly N times.
{N,}	  # The preceding item is matched N or more times.
^		    # Matches the empty string at the beginning of a line.
$		    # Matches the empty string at the end of a line.
[a-d]	  # Matches any one character in the range a-d.



##############################################################################
# Loops and Conditions
##############################################################################

# Inline If Statements
[[ $USER = 'rehan' ]] && echo 'yes' || echo 'no' 

# If Statements
if [[$foo = 'bar']]; then
  echo 'one'
elif [[$foo = 'baz']]; then
  echo 'two'
else
  echo 'three'
fi

# Iterate over a list of values.
for do done	

while do done	
until do done	
sleep time
break	# exit from the while or for loop but continue the rest of the script.
continue




##############################################################################
# Network
##############################################################################
netstat -ant	To check all network connections.
netstat -ent	To check established network connections.
ifconfig	To check all network interfaces, IPs, and Mac addresses.
ping	Used to check host reachability.
nslookup	Used for DNS query.



top	# Display all running processes, memory usage, cpu usage in real-time
exec	# Replace the shell process with the specified command.

read	# Read one line from STDIN and assigns it to a variable.
popd	# Removes entries from the directory stack.
pushd	# Add a directory to the directory stack.
wait	# Make the shell wait for a job to finish.





##############################################################################
# File
##############################################################################

### Researching Files
locate <text>       # search the content of all the files
locate <fileName>   # search for a file
sudo updatedb       # update database of files
find -name “<fileName>”
find -name “text”   # search for files who start with the word text
find -name “*text”  # “ “ “ “ end “ “ “ “
find ~ -size +10M # search files bigger than.. (M,K,G)
find -name “<filetype>” -atime -5 # Search from last access
('-' = less than, '+' = more than and nothing = exactly)
find -type d --> ex: find /var/log -name "syslog" -type d # Search only directory’s
find -type f = files # Search only files

### File conditions
[[ -e FILE ]]	# Exists
[[ -r FILE ]]	# Readable
[[ -h FILE ]]	# Symlink
[[ -d FILE ]]	# Directory
[[ -w FILE ]]	# Writable
[[ -s FILE ]]	# Size is > 0 bytes
[[ -f FILE ]]	# File
[[ -x FILE ]]	# Executable
[[ FILE1 -nt FILE2 ]]	# 1 is more recent than 2
[[ FILE1 -ot FILE2 ]]	# 2 is more recent than 1
[[ FILE1 -ef FILE2 ]]	# Same files

### Extract, sort and filter data
grep <someText> <fileName>   # search for text in file
-i # Doesn't consider uppercase words
-I # exclude binary files
grep -r <text> <folderName>/ # search for file names
with occurrence of the text
With regular expressions:
grep -E ^<text> <fileName>  # search start of lines
# with the word text
grep -E <0-4> <fileName>    # shows lines containing numbers 0-4
grep -E <a-zA-Z> <fileName> # retrieve all lines
sort # sort the content of files
sort <fileName>             # sort the content of files alphabetically
sort -o <file> <outputFile> # write result to a file
sort -r <fileName>          # sort in reverse
sort -R <fileName>          # sort randomly
sort -n <fileName>          # sort numbers
wc                          # word count
wc <fileName>               # nbr of line, nbr of words, byte size
-l (lines), -w (words), -c (byte size), -m
(number of characters)
cut                         # cut a part of a file
-c --> ex: cut -c 2-5 names.txt
(cut the characters 2 to 5 of each line)
-d (delimiter) (-d & -f good for .csv files)
-f (# of field to cut)

### Replacing
sed 's/fox/bear/g' foo.txt               # Replace fox with bear in foo.txt and output to console
sed 's/fox/bear/gi' foo.txt              # Replace fox (case insensitive) with bear in foo.txt and output to console
sed 's/red fox/blue bear/g' foo.txt      # Replace red with blue and fox with bear in foo.txt and output to console
sed 's/fox/bear/g' foo.txt > bar.txt     # Replace fox with bear in foo.txt and save in bar.txt
sed 's/fox/bear/g' foo.txt -i|--in-place # Replace fox with bear and overwrite foo.txt




Disk Usage
df                     # List disks, size, used and available space
df -h|--human-readable # List disks, size, used and available space in a human readable format

du                     # List current directory, subdirectories and file sizes
du /foo/bar            # List specified directory, subdirectories and file sizes
du -h|--human-readable # List current directory, subdirectories and file sizes in a human readable format
du -d|--max-depth      # List current directory, subdirectories and file sizes within the max depth
du -d 0                # List current directory size

Memory Usage
free                   # Show memory usage
free -h|--human        # Show human readable memory usage
free -h|--human --si   # Show human readable memory usage in power of 1000 instead of 1024
free -s|--seconds 5    # Show memory usage and update continuously every five seconds
