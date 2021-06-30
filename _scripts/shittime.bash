function shittime-open () {
	local file=$1
	if [ -z $file ]; then
		file='.m.shishatskiy.shittime'
	fi
	v $file
}

function shittime-get () {
	local username=$1
	if [ -z "$username" ]; then
		username='m.shishatskiy'
	fi
	local file=$2
	if [ -z "$file" ]; then
		file=".$username.shittime"
	fi
	if [ -e $file ]; then
		echo "Found existing timesheet in $file, saving it to $file.bckp."
		cp $file "$file.bckp"
		if [ $? != 0 ]; then
			echo "Backup failed. Terminating.";
			return 1;
		fi
		echo "Backup is done"
	fi
	echo -n "JIRA password: " && \
		local password    && \
		read -s password  && \
		echo "Done."
	if [ $? != 0  ] || [ -z "$password" ]; then
		echo "No password. Terminating."
		return 1;
	fi
	curl -s 'https://jira.iponweb.net/rest/timesheet/1.0/api' \
		-X GET                                            \
		-u $username:$password                            \
		-H "accept: text/plain"                           \
	> $file
	if [ $? != 0 ]; then
		echo "Failed to fetch timesheet for $username. Terminating."
		return 1;
	fi
	echo "Successfully fetched timesheet for $username to $file."
	return 0;
}

function shittime-post () {
	local username=$1
	if [ -z "$username" ]; then
		username='m.shishatskiy'
	fi
	local file=$2
	if [ -z "$file" ]; then
		file=".$username.shittime"
	fi
	if [ ! -e $file ] || [ ! -r $file ] || [ -z $file ]; then
		echo "Invalid path to timesheet ($file). Terminating."
		return 1;
	fi
	tmpshit=$(mktemp "${TMPDIR:-/tmp/}$username.shittime.XXXXXXXXXXXX")
	grep -vP '^(?:$|#)' $file | perl -pe 's/^((?:[^,]++,){4})"([^"]++)"$/$1$2/' > $tmpshit
	echo -n "JIRA password: " && \
		local password    && \
		read -s password  && \
		echo "Done."
	if [ $? != 0  ] || [ -z "$password" ]; then
		echo "No password. Terminating."
		return 1;
	fi
	curl -s 'https://jira.iponweb.net/rest/timesheet/1.0/api' \
		-X POST                                           \
		-u $username:$password                            \
		-H "accept: text/plain"                           \
		-F file=@$tmpshit                                 \
		-D -                                              \
		| grep -oP '^HTTP/1.1 (\d{3})'                    \
		| grep -vF 'HTTP/1.1 100'                         \
		| grep -F  'HTTP/1.1 200'                         \
		&> /dev/null
	if [ $? != 0 ]; then
		echo "Failed to push timesheet for $username ($tmpshit). Terminating."
		return 1;
	fi
	echo "Successfully pushed timesheet for $username from $file ($tmpshit)."
	return 0;
}

function shittime-wsr () {
	local startdate=$(date -d "$1" +%s)
	local enddate=$(date -d "$2 + 1 day" +%s)

	local file=$3
	if [ -z $file ]; then
		file='.m.shishatskiy.shittime'
	fi

	tmpwsr=$(mktemp "${TMPDIR:-/tmp/}m.shishatskiy.shitwsr.XXXXXXXXXXXX")

	for (( date=$startdate; date < $enddate; date=$date + 86400 )); do
		local pattern="$(date --date=@$date +%Y-%m-%d)"
		# grep lines for the current date except some internal tasks
		grep -F "$pattern" $file | grep -vP '^(#|$)|gh-core' >> $tmpwsr
	done

	echo -e "m.shishatskiy status report $1 -- $2"
	echo -e "==========================================="

	echo -e "Hello,\n\nMy proceedings for the previous week:"

	perl -lnaF',' < $tmpwsr -e '
		m{,gh-\d+,} or $;{ $F[3] } = 0, 1 and next;
		m{Review$} ? $,{ $F[3] } : $:{ $F[3] } = 0;
		m{Issue finalization$} and $:{ $F[3] }++;
	}{
		printf "%s\n", join "\n", map {
			"* $_:" . (" Completed." x $:{ $_ })
		} sort keys %: if %:;
		printf "* Reviews: %s.\n", join ", ", sort keys %, if %,;
		printf "\nMisc:\n%s\n", join "\n", map {
			"* $_:"
		} sort keys %; if %
	'

	rm -f $tmpwsr
}

function shittime-stats () {
	local startdate=$(date -d "$1" +%s)
	local enddate=$(date -d "$2 + 1 day" +%s)

	local file=$3
	if [ -z $file ]; then
		file='.m.shishatskiy.shittime'
	fi

	tmpwsr=$(mktemp "${TMPDIR:-/tmp/}m.shishatskiy.shitstats.XXXXXXXXXXXX")

	for (( date=$startdate; date < $enddate; date=$date + 86400 )); do
		local pattern="$(date --date=@$date +%Y-%m-%d)"
		# grep lines for the current date except some internal tasks
		grep -F "$pattern" $file | grep -vP '^(#|$)|gh-core' >> $tmpwsr
	done

	perl -MData::Dumper -MTime::Piece -lnaF',' < $tmpwsr -E '
		$_ ? $a = 0 : next;
		$a += (-1) ** $_ * Time::Piece->strptime(
			"$F[0]T$F[$_]", "%Y-%m-%dT%H:%M"
		)->epoch for (1, 2);
		$b{$F[0]}{$F[3]} += $a / 3600;
	}{
		say Dumper \%b
	'
}
