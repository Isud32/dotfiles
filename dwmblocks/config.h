//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	/* {"",	"sb-music",	0,	11}, */
	/*{"",	"sb-pacpackages",	0,	8},*/
	/*{"",	"sb-news",		0,	6},*/
	/* {"",	"sb-memory",	10,	14}, */
	/* {"",	"sb-cpu",		10,	18}, */
{"", "clock-2", 60, 1},
  {"",	"clock",	60,	1},
  {"",	"volume",	0,	2},
	{"",	"internet",	5,	4},
  /*{"", "archlogo", 5, 5},*/
  /*{"", "dwmlogo", 5, 5}*/
  {"", "logopersec", 5, 5}
};

//Sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char *delim = "｜ ";

// Have dwmblocks automatically recompile and run when you edit this file in
// vim with the following line in your vimrc/init.vim:

// autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }
