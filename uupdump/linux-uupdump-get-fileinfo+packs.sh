#!/bin/bash
fetchupd="php ./sta/fetchupd.php"
packsgen="php ./sta/packsgen.php"

# ----------------------------------------------------------------------------------------------------

random_sleep() {
	local min_sleep=1
	local max_sleep=5
	local sleep_time=$((RANDOM % (max_sleep - min_sleep + 1) + min_sleep))
	echo "Sleeping $sleep_time seconds ..."
	sleep $sleep_time
}

fetchupd_watchdog() {
		local args=( "$@" )

		local retry_count=0
		local max_retries=1
		local timeout_seconds=300
		
		while true; do
			timeout $timeout_seconds $fetchupd "${args[@]}" &
			PID=$!
			wait $PID
			local exit_code=$?
			
			if [ $exit_code -eq 0 ]; then
				break
			elif [ $exit_code -eq 124 ]; then
				echo "fetchupd timeout (exceeded ${timeout_seconds}s), attempt $((retry_count + 1))/$max_retries"
				retry_count=$((retry_count + 1))
				if [ $retry_count -ge $max_retries ]; then
					echo "Max retries reached. Giving up."
					break
				fi
			else
				echo "fetchupd failed with exit code $exit_code, attempt $((retry_count + 1))/$max_retries"
				retry_count=$((retry_count + 1))
				if [ $retry_count -ge $max_retries ]; then
					echo "Max retries reached. Giving up."
					break
				fi
			fi
		done
}

fetchupd() {
		local args=( "$@" )
		local p1="${args[0]}" #Arch
		local p2="${args[1]}" #Channel
		local p3="${args[2]}" #e.g. Mainline
		local p4="${args[3]}" #Build Nr.
		local p5="${args[4]}" #Rev
		local p6="${args[5]}" #SKU

		if [ "$p1" = "msit"  ]; then
			fetchupd_watchdog amd64 "${p2}" "${p3}" "${p4}+corpnet" "${p5}" "${p6}"
		fi
		if [ "$p1" = "dAll"  ]; then
			fetchupd_watchdog x86   "${p2}" "${p3}" "${p4}" "${p5}" "${p6}"
			fetchupd_watchdog amd64 "${p2}" "${p3}" "${p4}" "${p5}" "${p6}"
			fetchupd_watchdog arm64 "${p2}" "${p3}" "${p4}" "${p5}" "${p6}"
		fi
		if [ "$p1" = "d64b"  ]; then
			fetchupd_watchdog amd64 "${p2}" "${p3}" "${p4}" "${p5}" "${p6}"
			fetchupd_watchdog arm64 "${p2}" "${p3}" "${p4}" "${p5}" "${p6}"
		fi
		if [ "$p1" = "d64x"  ]; then
			fetchupd_watchdog amd64 "${p2}" "${p3}" "${p4}" "${p5}" "${p6}"
		fi
		if [ "$p1" = "d64a"  ]; then
			fetchupd_watchdog arm64 "${p2}" "${p3}" "${p4}" "${p5}" "${p6}"
		fi
		random_sleep
}

# ----------------------------------------------------------------------------------------------------

pushd ./uup && rm -r uuptmp 2>/dev/null

$packsgen
echo ""

update_packs_and_fileinfo() {
if [ "$delete_previous_packs_and_fileinfo_over_git" -eq 1 ]; then
	if [ -d ./packs/.git ]; then
		echo "Removing previous packs..."
		rm -rf packs/*
	fi
	if [ -d ./fileinfo/.git ]; then
		echo "Removing previous fileinfo..."
		rm -rf fileinfo/*
	fi
fi

# ----------------------------------------------------------------------------------------------------

# SKU Description from List at: https://betawiki.net/wiki/List_of_Windows_product_types

# ----------------------------------------------------------------------------------------------------

# Client builds
### Retail
fetchupd d64a Retail Mainline 28000 1                     # Windows 11 26H1
fetchupd d64b Retail Mainline 26200 1                     # Windows 11 25H2
fetchupd d64b Retail Mainline 26200 1 210                 # Windows 11 25H2 (WNC)
fetchupd d64b Retail Mainline 26100 1                     # Windows 11 24H2
fetchupd d64b Retail Mainline 26100 1 210                 # Windows 11 24H2 (WNC)
fetchupd d64b Retail Mainline 22631 1                     # Windows 11 23H2
fetchupd d64b Retail Mainline 22621 1                     # Windows 11 22H2
fetchupd d64b Retail Mainline 22000 1 4                   # Windows 11 21H2 (ENTERPRISE)
fetchupd dAll Retail Mainline 19045 1806                  # Windows 10 22H2
fetchupd dAll Retail Mainline 19044 1202 125              # Windows 10 21H2 (ENTERPRISE_S)
fetchupd d64x Retail Mainline 19042 572 119               # Windows 10 20H2 (PPI_PRO)
fetchupd dAll Retail Mainline 17763 529 19                # Windows 10 1809 (HOME_SERVER)

### RP
fetchupd d64a ReleasePreview Mainline 28000 1             # Windows 11 26H1
fetchupd d64b ReleasePreview Mainline 26200 1             # Windows 11 25H2
fetchupd d64b ReleasePreview Mainline 26200 1 210         # Windows 11 25H2 (WNC)
fetchupd d64b ReleasePreview Mainline 26100 1             # Windows 11 24H2
fetchupd d64b ReleasePreview Mainline 26100 1 210         # Windows 11 24H2 (WNC)
fetchupd d64b ReleasePreview Mainline 22631 1             # Windows 11 23H2
fetchupd d64b ReleasePreview Mainline 22621 1             # Windows 11 22H2
fetchupd d64b ReleasePreview Mainline 22000 1 4           # Windows 11 21H2 (ENTERPRISE)
fetchupd dAll ReleasePreview Mainline 19045 1806          # Windows 10 22H2
fetchupd dAll ReleasePreview Mainline 19044 1202 125      # Windows 10 21H2 (ENTERPRISE_S)

### Beta
fetchupd d64b Beta Mainline 28000 1                       # Windows 11 26H1 Beta
fetchupd d64b Beta Mainline 26200 1                       # Windows 11 25H2 Beta
fetchupd d64b Beta Mainline 26100 1                       # Windows 11 24H2 Beta
fetchupd d64b Beta Mainline 22631 1                       # Windows 11 23H2 Beta
fetchupd d64b Beta Mainline 22621 1                       # Windows 11 22H2 Beta
fetchupd d64b Beta Mainline 22000 1 4                     # Windows 11 21H2 Beta (ENTERPRISE)

### Dev
fetchupd d64b Dev Mainline 28000 1                        # Windows 11 26H1 Dev
fetchupd d64b Dev Mainline 26200 1                        # Windows 11 25H2 Dev
fetchupd d64b Dev Mainline 26100 1                        # Windows 11 24H2 Dev
fetchupd d64b Dev Mainline 22631 1                        # Windows 11 23H2 Dev
fetchupd d64b Dev Mainline 22621 1                        # Windows 11 22H2 Dev
fetchupd d64x Dev Mainline 19100 1019 119                 # Windows 10 20H2 Dev (PPI_PRO)
fetchupd d64x Dev Mainline 19042 985 119                  # Windows 10 20H2 Dev (PPI_PRO)

### Canary
fetchupd d64b Canary Mainline Latest                      # Windows 11 Canary

# ----------------------------------------------------------------------------------------------------

# Server builds
### Retail
fetchupd d64b Retail Mainline 26100 1 406                 # Windows Server 2025 24H2 (AZURESTACKHCI)
fetchupd d64b Retail Mainline 26100 1 408                 # Windows Server 2025 24H2 (DATACENTER_CORE_AZURE)
fetchupd d64b Retail Mainline 26100 1 8                   # Windows Server 2025 24H2 (DATACENTER)
fetchupd d64x Retail Mainline 25398 1 406                 # Windows Server vNext 23H2 (AZURESTACKHCI)
fetchupd d64x Retail Mainline 25398 1 8                   # Windows Server vNext 23H2 (DATACENTER)
fetchupd d64x Retail Mainline 20349 859 406               # Windows Server 2022 22H2 (AZURESTACKHCI)
fetchupd d64x Retail Mainline 20348 1 406                 # Windows Server 2022 21H2 (AZURESTACKHCI)
fetchupd d64x Retail Mainline 20348 1 8                   # Windows Server 2022 21H2 (DATACENTER)
fetchupd d64x Retail Mainline 17763 529 8                 # Windows Server 2019 (DATACENTER)

### RP
fetchupd d64b ReleasePreview Mainline 26100 1 406         # Windows Server 2025 24H2 Release Preview (AZURESTACKHCI)
fetchupd d64b ReleasePreview Mainline 26100 1 408         # Windows Server 2025 24H2 Release Preview (DATACENTER_CORE_AZURE)
fetchupd d64b ReleasePreview Mainline 26100 1 8           # Windows Server 2025 24H2 Release Preview (DATACENTER)
fetchupd d64x ReleasePreview Mainline 25398 287 406       # Windows Server vNext 23H2 Release Preview (AZURESTACKHCI)
fetchupd d64x ReleasePreview Mainline 25398 287 408       # Windows Server vNext 23H2 Release Preview (DATACENTER_CORE_AZURE)
fetchupd d64x ReleasePreview Mainline 25398 287 8         # Windows Server vNext 23H2 Release Preview (DATACENTER)
fetchupd d64x ReleasePreview Mainline 20349 859 406       # Windows Server 2022 22H2 Release Preview (AZURESTACKHCI)
fetchupd d64x ReleasePreview Mainline 20349 825 408       # Windows Server 2022 22H2 Release Preview (DATACENTER_CORE_AZURE)
fetchupd d64x ReleasePreview Mainline 20348 11 406        # Windows Server 2022 21H2 Release Preview (AZURESTACKHCI)
fetchupd d64x ReleasePreview Mainline 20348 1 8           # Windows Server 2022 21H2 Release Preview (DATACENTER)
fetchupd d64x ReleasePreview Mainline 17763 529 8         # Windows Server 2019 Release Preview (DATACENTER)

### Beta
fetchupd d64b Beta Mainline 26100 1 406                   # Windows Server 2025 24H2 Beta (AZURESTACKHCI)
fetchupd d64b Beta Mainline 26100 1 408                   # Windows Server 2025 24H2 Beta (DATACENTER_CORE_AZURE)
fetchupd d64b Beta Mainline 26100 1 8                     # Windows Server 2025 24H2 Beta (DATACENTER)
fetchupd d64x Beta Mainline 25398 287 406                 # Windows Server vNext 23H2 Beta (AZURESTACKHCI)
fetchupd d64x Beta Mainline 25398 287 408                 # Windows Server vNext 23H2 Beta (DATACENTER_CORE_AZURE)
fetchupd d64x Beta Mainline 25398 287 8                   # Windows Server vNext 23H2 Beta (DATACENTER)

### Dev
fetchupd d64b Dev Mainline 26100 1 406                    # Windows Server 2025 24H2 Dev (AZURESTACKHCI)
fetchupd d64b Dev Mainline 26100 1 408                    # Windows Server 2025 24H2 Dev (DATACENTER_CORE_AZURE)
fetchupd d64b Dev Mainline 26100 1 8                      # Windows Server 2025 24H2 Dev (DATACENTER)
fetchupd d64x Dev Mainline 25398 287 406                  # Windows Server vNext 23H2 Dev (AZURESTACKHCI)
fetchupd d64x Dev Mainline 25398 287 408                  # Windows Server vNext 23H2 Dev (DATACENTER_CORE_AZURE)
fetchupd d64x Dev Mainline 25398 287 8                    # Windows Server vNext 23H2 Dev (DATACENTER)

### Canary
fetchupd d64b Canary Mainline 26100 1 406                 # Windows Server 2025 24H2 Canary (AZURESTACKHCI)
fetchupd d64b Canary Mainline 26100 1 408                 # Windows Server 2025 24H2 Canary (DATACENTER_CORE_AZURE)
fetchupd d64b Canary Mainline 26100 1 8                   # Windows Server 2025 24H2 Canary (DATACENTER)
fetchupd d64x Canary Mainline 25398 287 406               # Windows Server vNext 23H2 Canary (AZURESTACKHCI)
fetchupd d64x Canary Mainline 25398 287 408               # Windows Server vNext 23H2 Canary (DATACENTER_CORE_AZURE)
fetchupd d64x Canary Mainline 25398 287 8                 # Windows Server vNext 23H2 Canary (DATACENTER)
}

# ----------------------------------------------------------------------------------------------------

# MSIT builds
if [ '$search_msit' = 'yes' ]; then
	fetchupd msit MSIT Mainline 20348 1 8
	fetchupd msit MSIT Mainline 20348 1 406
	fetchupd msit MSIT Mainline 20349 1 406
	fetchupd msit MSIT Mainline 20349 1 408
	fetchupd msit MSIT Mainline 25398 1 8
	fetchupd msit MSIT Mainline 25398 1 406
	fetchupd msit MSIT Mainline 25398 1 408
	fetchupd msit MSIT Mainline 26100 1 8
	fetchupd msit MSIT Mainline 26100 1 406
	fetchupd msit MSIT Mainline 26100 1 408
fi

# ----------------------------------------------------------------------------------------------------

update_packs_and_fileinfo_over_git() {
	local fileinfoandpacksrepo=$fileinfo_and_packs_repo
	local packs=$git_reponame_packs
	local fileinfo=$git_reponame_fileinfo
	[ -d ./packs/.git ]      && cd packs          && git pull origin --rebase && cd ..
	[ ! -d ./packs/.git ]    && rm -rf packs/*    && git clone $fileinfoandpacksrepo/$packs packs --single-branch --depth 1
	[ -d ./fileinfo/.git ]   && cd fileinfo       && git pull origin --rebase && cd .. 
	[ ! -d ./fileinfo/.git ] && rm -rf fileinfo/* && git clone $fileinfoandpacksrepo/$fileinfo fileinfo --single-branch --depth 1
}

# ----------------------------------------------------------------------------------------------------

if [ "$get_packs_and_fileinfo_over_git" -eq 1 ]; then
    update_packs_and_fileinfo_over_git
else
    update_packs_and_fileinfo
fi

# ----------------------------------------------------------------------------------------------------

echo ""

rm -r uuptmp 2>/dev/null
$packsgen

echo ""
echo Done.
echo ""
