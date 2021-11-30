#!/usr/bin/perl
#using Text::Levenshtein module of CPAN library in perl
use Text::Levenshtein qw(distance);
#creating a hash table consisting of linux commands as keys and value of all of them is 0
%data=('what',0,'relation',0,'input',0);
$data{'chdir'}=0;
$data{'man'}=0;
$data{'which'}=0;
$data{'chsh'}=0;
$data{'whereis'}=0;
$data{'passwd'}=0;
$data{'date'}=0;
$data{'cal'}=0;
$data{'clear'}=0;
$data{'sleep'}=0;
$data{'alias'}=0;
$data{'unalias'}=0;
$data{'history'}=0;
$data{'apropos'}=0;
$data{'exit'}=0;
$data{'logout'}=0;
$data{'shutdown'}=0;
$data{'ls'}=0;
$data{'cat'}=0;
$data{'more'}=0;
$data{'less'}=0;
$data{'touch'}=0;
$data{'cp'}=0;
$data{'mv'}=0;
$data{'rm'}=0;
$data{'script'}=0;
$data{'find'}=0;
$data{'mkdir'}=0;
$data{'cd'}=0;
$data{'pwd'}=0;
$data{'rmdir'}=0;
$data{'chmod'}=0;
$data{'grep'}=0;
$data{'printenv'}=0;
$data{'echo'}=0;
$data{'touch'}=0;
$data{'env'}=0;
$data{'tar'}=0;
$data{'make'}=0;
$data{'USER'}=0;
$data{'HOME'}=0;
$data{'SHELL'}=0;
$data{'TERM'}=0;
$data{'PATH'}=0;
$data{'help'}=0;
$data{'set'}=0;
$data{'export'}=0;
$data{'unset'}=0;
# '$#array_name' gives the highest index in that array
# the array 'keys' contain all the keys of the hash table i.e. the set of linux commnads
@keys=keys %data;
#reading an input command
while(<>){
	# 'n' keeps a track at which character we are , it contains the index of the character at which we are
	# helps in putting '^' under typo
	# '$_' consist of the input command
	$n=0;
	# chomp removes the newline character from the end of the input command
	chomp($_);
	# the array 'words' consist of all the words of the input command
	@words=split;
	# the array 'characters' consist of all the characters in the input command
	@characters=split//;
	#traversing through all the words in the input command , one by one
	for($i=0;$i<($#words + 1);$i++){
		#checking for presence of whitespaces before the word under consideration
		while(${characters[$n]} eq " " || ${characters[$n]} eq "\t"){
			$n++;
		}
		# value of 'match' becomes 1 if the word under consideration is a correct linux command given in the hash table
		$match=0;
		# 'word' consist of the word under consideration
		$word=${words[$i]};
		# the array 'charsofword' consist of all the characters of the word under consideration
		@charsofword=split//,$word;
		# the array 'distances' contain the edit distance of the word under consideration from all the linux commands
		# given in the hash table
		@distances=distance($word,@keys);
		#traversing through the array 'distances' to check if the word matches a command or not
		#i.e. edit distance is 0 or not.
		for($j=0;$j<($#distances + 1);$j++){
			if(${distances[$j]}==0){
				$match=1;
				#updating value of 'n' if word under consideration is a correct linux command
				$n++;
				$n=$n + $#charsofword;
				# 'last' terminates the for loop on line 85 , acts like break statement
				last;
			}
		}
		# if word under consideration is not a correct linux command	
		if($match==0){
			# printing spaces and tabs as required to get the cursor under typo to print '^'
			for($l=0;$l<$n;$l++){
				if(${characters[$l]} eq "\t"){
					print"\t";
				}
				else{
					print " ";
				}
			}
			# traversing 'distances' to find the min. edit distance
			$min=${distances[$0]};
			$min_index=0;
			for($p=1;$p<($#distances + 1);$p++){
				if(${distances[$p]}<$min){
					$min=${distances[$p]};
					$min_index=$p;
				}
			}
			# printing '^' under the typo
			for($j=$n;$j<($n + $#charsofword + 1);$j++){
				if($j==$n){
					print "^";
				}
			}
			print "\n";
			#'count' stores the value that how many linux commands are at min. edit distance from the word under consideration
			$count=0;
			# printing all the commands at min. edit distance as suggested corrections and counting no. of such commands
			#printing the index of those commands in 'keys' array as well
			printf "suggested word(s) : ";
			for($m=0;$m<($#distances + 1);$m++){
				if(${distances[$m]}==$min){
					printf "%s(%d) ",${keys[$m]},$m;
					$count++;
				}
			}
			print"\n";
			#asking user to enter 'y' to correct the typo  and any other key to leave it as it is	
			print "Want to correct the typo ( press y to correct and any other key to leave it as it is ) : ";
			#taking input
			$input=<STDIN>;
			#removing newline character from the end of 'input'
			chomp($input);
			$yes="y";
			#'compare' value is 1 when input given by user is 'y' , else its value is 0
			$compare=$input eq $yes;
			# when input given is 'y' and there are more than 1 linux commands at min. edit distance from the considered word
			if($compare==1 and $count>1){
				print "Enter the index value of the new command : ";
				#asking the user to input the index of the linux command which he considers is the correct one
				$index=<STDIN>;
				# removing newline character after the index
				chomp($index);
				# making correction
				substr($_,$n,$#charsofword+1)=${keys[$index]};
				#printing input command after correction
				printf "$_\n";
				# storing the corrected command in 'new_word'
				$new_word=${keys[$index]};
				# storing the characters of the corrected command in the array 'charsofnewword'
				@charsofnewword=split//,$new_word;
				#updating value of 'n'
				$n=$n + $#charsofnewword;
				$n++;
			}
			elsif($compare==1 and $count==1){
				#when only one command at min. edit distance and input is 'y'
				# no need to give index here as only one suggestion
				# making correction
				substr($_,$n,$#charsofword+1)=${keys[$min_index]};
				#printing input command after correction
				printf "$_\n";
				# storing the corrected command in 'new_word'
				$new_word=${keys[$min_index]};
				# storing the characters of the corrected command in the array 'charsofnewword'
				@charsofnewword=split//,$new_word;
				#updating value of 'n'
				$n=$n + $#charsofnewword;
				$n++;
			}
			else{
				# when user does not want to change the word under consideration
				# printing the input command
				printf "$_\n";
				#updating value of 'n'
				$n=$n + $#charsofword;
				$n++;
			}
			# 'words' is the array of words in the input command after correction(if user asks to correct,else the same)
			@words=split;
			# 'characters' is array of characters in the input command after correction(if user asks to correct,else the same)
			@characters=split//;
		}
	}
	# printing the final command after all the corrections ( if any )
	print "\n";
	print "The command is modified.\n";
	print "The final modified command is :\n$_\n\n";
	print "Enter new command:\n";
}
