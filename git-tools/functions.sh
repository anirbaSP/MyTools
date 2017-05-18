function clean_history() {

	[[ $# -ne 1 ]] && echo "Usage: 1) branch name" && exit

	git checkout $1
	git checkout --orphan tmp_$1
	git add -A
	git commit -m "history cleanup"
	git branch -D $1
	git branch -m tmp_$1 $1
}