Disclaimer:

This script works only for specific folder configurations (For now). Any deviation from the configurations is not supported by the script. There are plans for the future, though. It involves using the yad or other similar dialogue management software to expand the scope of this project.
These defined folder configurations will be written in a separate file (which can be edited to suit one's needs), which the script reads off of, before executing and replacing the documents. 


Purpose:

This script is to automate a few tasks that I'd like to run everytime I reinstall Linux. These are pretty straight froward tasks, but they take a hella long time to be executed. Hence this.

This script is, for now, basically a copy pasting machine. Once run, It copies all predefined files/folders to their assigned locations using simple bash and possibly python commands.

Since I have already set up a Git repository that contains all these configs, I can easily edit them, track them and revert them if necessary. But, it is of no use if I do not replace the original files on my SSD with the edited ones, so my OS can read the configs.

So, this script is meant to help me replace all the defined files at the proper destinations every time I commit in git. Or every time I change Branches, I can just run this script to test the configs real time. Gives a whole new meaning to git "CHECKOUT" <Branch> !!
If I want to revert to a previous configuration, I can just use git to revert back the files & changes, and run this script again. I dont have to bloody backup my fuckin configs everytime I change them! 

The Problem is, while I can have all these config files in one git folder/repo, they must be mapped to various locations. While their destinations are well defined for almost any linux distro (as of now), Doing so manually is such a tedious task. Besides, If this project is successful, I can, theoretically deploy all my customizations on virtually any Linux device I need, even remotely.

I just need to push all my git config files to my github, then download/clone it on the device in question, and just run a bloody bash script, and reboot. 

Easy peasy, Linux's easy. 

Bob's your uncle.

And that's basically it. I know I have to/ I will have to change OSes/distros at some point. So, this just lets me enjoy the experience.

Also, this is my first coding project. Ever. This may work, Maynot...

As to the future plans, I can think of a yad-application that will provide a GUI method to achive this purpose....

Although, I dont see the point in it when it can be achived just by running a terminal command...

But, Say I have some new config file to add to the git repo. A new config file I want to track. While it's not that hard to do it in CLI, It may help to have a GUI to add the said file to the git repo, auto commit it, and map it to a specific location.... 

But this is all just day dreaming... I havent even started to write the code yet. I will do that tomorrow, probably.


When I get down to tacks of brass, I may come to realise that this whole project is not feasible (or) It's superfluous (or) Someone else has already done it... (or) I may lose interest in this...

Only time can tell.








##############Comments



		# Future Plans

			## Add support for copying folders -- cp -r ???

			#echo -e "${src} --> ${des}"

			#echo "There are ${#strarr[*]} words in the text."


## Bash Script for Importing and Exporting My configs to and from the SSD to HDD
## Configs located at ~/Programming/Configs
## git repo shortcut defined in .zshrc - cdgitconfigs

