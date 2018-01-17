#!/bin/bash

# Created by argbash-init v2.5.1
# ARG_OPTIONAL_SINGLE([credentials],[s],[path to credentials json file],[$PWD/org.dcs.iot.kaa.client/src/test/resources/kaaCredentials.yaml])
# ARG_OPTIONAL_SINGLE([config],[o],[path to config directory],[$PWD/org.dcs.iot.kaa.client/src/test/resources/kaa-config])
# ARG_POSITIONAL_SINGLE([application],[kaaiot application to simulate client. Possible values are, \n hbt (Heartbeat Monitor Client) \n temp (Temperature Monitor Client)])
# ARG_HELP([Script to simulate a KaaIoT Client. \n This script requires that you download the target java sdk jar to the org.dcs.kaa.client/lib directory. \n Refer to the README.md for more details])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.5.1 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info

die()
{
	local _ret=$2
	test -n "$_ret" || _ret=1
	test "$_PRINT_HELP" = yes && print_help >&2
	echo "$1" >&2
	exit ${_ret}
}

begins_with_short_option()
{
	local first_option all_short_options
	all_short_options='soh'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}



# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_credentials="$PWD/org.dcs.iot.kaa.client/src/test/resources/kaaCredentials.yaml"
_arg_config="$PWD/org.dcs.iot.kaa.client/src/test/resources/kaa-config"

print_help ()
{
	printf "%s\n" "Script to simulate a KaaIoT Client.
		 This script requires that you download the target java sdk jar to the org.dcs.kaa.client/lib directory.
		 Refer to the README.md for more details"
	printf 'Usage: %s [-s|--credentials <arg>] [-o|--config <arg>] [-h|--help] <application>\n' "$0"
	printf "\t%s\n" "<application>: kaaiot application to simulate client. Possible values are,
		 hbt (Heartbeat Monitor Client)
		 temp (Temperature Monitor Client)"
	printf "\t%s\n" "-s,--credentials: path to credentials json file (default: '"$PWD/org.dcs.iot.kaa.client/src/test/resources/kaaCredentials.yaml"')"
	printf "\t%s\n" "-o,--config: path to config directory (default: '"$PWD/org.dcs.iot.kaa.client/src/test/resources/kaa-config"')"
	printf "\t%s\n" "-h,--help: Prints help"
}

parse_commandline ()
{
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-s|--credentials)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_credentials="$2"
				shift
				;;
			--credentials=*)
				_arg_credentials="${_key##--credentials=}"
				;;
			-s*)
				_arg_credentials="${_key##-s}"
				;;
			-o|--config)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_config="$2"
				shift
				;;
			--config=*)
				_arg_config="${_key##--config=}"
				;;
			-o*)
				_arg_config="${_key##-o}"
				;;
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_positionals+=("$1")
				;;
		esac
		shift
	done
}


handle_passed_args_count ()
{
	_required_args_string="'application'"
	test ${#_positionals[@]} -ge 1 || _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require exactly 1 (namely: $_required_args_string), but got only ${#_positionals[@]}." 1
	test ${#_positionals[@]} -le 1 || _PRINT_HELP=yes die "FATAL ERROR: There were spurious positional arguments --- we expect exactly 1 (namely: $_required_args_string), but got ${#_positionals[@]} (the last one was: '${_positionals[*]: -1}')." 1
}

assign_positional_args ()
{
	_positional_names=('_arg_application' )

	for (( ii = 0; ii < ${#_positionals[@]}; ii++))
	do
		eval "${_positional_names[ii]}=\${_positionals[ii]}" || die "Error during argument parsing, possibly an Argbash bug." 1
	done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash

APP_CLIENT=

case $_arg_application in
    hbt )
        APP_CLIENT="HeartbeatMonitorClient"
        echo "Launching heartbeat monitor client ..."
        echo ""
        ;;
    temp )
        APP_CLIENT="DataCollectionClient"
        echo "Launching temperature monitor client ..."
        echo ""
        ;;
    *)
        echo "ERROR: Invalid application $_arg_application specified"
        echo ""
        print_help
        exit 1
        ;;
esac

echo "Copying org.dcs.iot.kaa.client/clients/${APP_CLIENT}.scala to org.dcs.iot.kaa.client/src/main/scala/org/dcs/iot/kaa/client"
echo ""

cp org.dcs.iot.kaa.client/clients/${APP_CLIENT}.scala org.dcs.iot.kaa.client/src/main/scala/org/dcs/iot/kaa/client

sbt "kaaiot-client/runMain org.dcs.iot.kaa.client.${APP_CLIENT}"
# ] <-- needed because of Argbash
