# 2nd-project
This is a perl program to rectify typos in linux commands. It suggest possible corrections and ask you if you want to make any.
Skip to content
Search or jump to…
Pull requests
Issues
Marketplace
Explore
 
@MSD7797 
MSD7797
/
2nd-project
Public
1
00
Code
Issues
Pull requests
Actions
Projects
Wiki
Security
Insights
Settings
2nd-project/200101069_Assign03_Q3.txt
@MSD7797
MSD7797 Add files via upload
Latest commit 6f991d0 20 seconds ago
 History
 1 contributor
61 lines (56 sloc)  3.86 KB
   
 The set of commands needed to execute the perl file are :
 1st command : sudo cpan Text::Levenshtein
 2nd command : perl Assign03_200101069.pl
 ------------------------------------------------------------------------------------------------------------------------------------
 Once you enter the 2nd command in terminal and press enter , the perl program will run.
 ------------------------------------------------------------------------------------------------------------------------------------
 Enter the whole command that you want to check and then press enter
 As soon as you do that , you will see '^' under the first typo
 and in the next line you will see suggested words along with their indices in the array of linux commands.
 Then , in the next line , it will ask to enter 'y' if you want to want to correct the typo or press any other key 
 if you want that word to remain as it is and then press enter.
 If you press 'y' and there are more than one suggested words , so as soon as you press enter , it will ask you to enter
 the index of the command that you want the typo to be replaced with. Along with all commands suggested in the suggested words,
 the index of the command is also given , so enter the index of the command with which you want your typo to be replaced
 and press enter , then in the next line , it will rectify that typo if y is given or it will reamain as it is
 if any other key is given and '^' will point to the next typo and will ask for 'y' or any other key
 for the pointed typo and so on.
 If the suggested words for the typo is only 1 , then as soon as you enter 'y', the typo will be corrected with the
 suggested word.
 As all typos in the current command are handles , it will print the final command and then ask for new command.
 --------------------------------------------------------------------------------------------------------------------------------------
 This will be an infinite program and you can give commands as long as you wish.
 As sir said , i can terminate my program in any way i wish.
 So, when you wish to terminate the program press 'Ctrl+C'
 --------------------------------------------------------------------------------------------------------------------------------------
 Some instructions for input:
 1)If you want to correct the typo , you have to enter 'y' and then press enter. So, don't give spaces before and after
   'y' and type 'y' in lowercase.
 2)Remember that linux shell commands are case sensitive.
 --------------------------------------------------------------------------------------------------------------------------------------
 The set of linux commands that I used here is : (list also contain some environment variables)
 passwd,date,cal,clear,sleep,alias,unalias,history,apropos,exit,logout,shutdown,ls,cat,more,less,touch,cp,mv,rm,script,find,mkdir,relation
 cd,pwd,rmdir,chmod,grep,printenv,echo,env,tar,make,USER,HOME,SHELL,TERM,PATH,help,set,export,unset,man,which,chsh,whereis,input,what,chdir
 --------------------------------------------------------------------------------------------------------------------------------------
 A demo or an illustration of my program :
 
 mukul@mukul:~/Desktop$ sudo cpan Text::Levenshtein
 mukul@mukul:~/Desktop$ perl Assign03_200101069.pl
 waht pintenv reation
 ^
 suggested word(s) : cat(5) what(22)
 Want to correct the typo ( press y to correct and any other key to leave it as it is ) : y
 Enter the index value of the new command : 5
 cat pintenv reation
     ^
 suggested word(s) : printenv(38)
 Want to correct the typo ( press y to correct and any other key to leave it as it is ) : n
 cat pintenv reation
             ^
 suggested word(s) : relation(31)
 Want to correct the typo ( press y to correct and any other key to leave it as it is ) : y
 cat pintenv relation
 
 The command is modified.
 The final command is :
 cat pintenv relation
 
 Enter new command:
 
 
 and so on.......
© 2021 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
