#!/bin/bash
fetchupd="php ./sta/fetchupd.php"
packsgen="php ./sta/packsgen.php"

pushd ./uup && rm -r uuptmp 2>/dev/null

$packsgen
echo ""

update_packs_and_fileinfo() {
[ -d ./packs/.git ]    && echo remove from git downloaded packs    && rm -rf packs/*
[ -d ./fileinfo/.git ] && echo remove from git downloaded fileinfo && rm -rf fileinfo/*

# SKU Description from List at: https://betawiki.net/wiki/List_of_Windows_product_types

# Client builds
$fetchupd all Retail Mainline 26100 1                     # Windows 11 24H2
$fetchupd all Retail Mainline 26100 1 210                 # Windows 11 24H2 (WNC)
$fetchupd all Retail Mainline 22631 1                     # Windows 11 23H2
$fetchupd all Retail Mainline 22621 1                     # Windows 11 22H2
$fetchupd all Retail Mainline 22000 1 4                   # Windows 11 21H2 (ENTERPRISE)
$fetchupd all Retail Mainline 19045 1806                  # Windows 10 22H2
$fetchupd all Retail Mainline 19044 1202 125              # Windows 10 21H2 (ENTERPRISE_S)
$fetchupd amd64 Retail Mainline 19042 572 119             # Windows 10 20H2 (PPI_PRO)
$fetchupd all Retail Mainline 17763 529 19                # Windows 10 1809 (HOME_SERVER)

$fetchupd all ReleasePreview Mainline 26100 1             # Windows 11 24H2
$fetchupd all ReleasePreview Mainline 26100 1 210         # Windows 11 24H2 (WNC)
$fetchupd all ReleasePreview Mainline 22631 1             # Windows 11 23H2
$fetchupd all ReleasePreview Mainline 22621 1             # Windows 11 22H2
$fetchupd all ReleasePreview Mainline 22000 1 4           # Windows 11 21H2 (ENTERPRISE)
$fetchupd all ReleasePreview Mainline 19045 1806          # Windows 10 22H2
$fetchupd all ReleasePreview Mainline 19044 1202 125      # Windows 10 21H2 (ENTERPRISE_S)

$fetchupd all Beta Mainline 26100 1                       # Windows 11 24H2 Beta
$fetchupd all Beta Mainline 22631 1                       # Windows 11 23H2 Beta
$fetchupd all Beta Mainline 22621 1                       # Windows 11 22H2 Beta
$fetchupd all Beta Mainline 22000 1 4                     # Windows 11 21H2 Beta (ENTERPRISE)

$fetchupd all Dev Mainline 26100 1                        # Windows 11 24H2 Dev
$fetchupd all Dev Mainline 22631 1                        # Windows 11 23H2 Dev
$fetchupd all Dev Mainline 22621 1                        # Windows 11 22H2 Dev
$fetchupd amd64 Dev Mainline 19100 1019 119               # Windows 10 20H2 Dev (PPI_PRO)
$fetchupd amd64 Dev Mainline 19042 985 119                # Windows 10 20H2 Dev (PPI_PRO)

$fetchupd all Canary Mainline Latest                      # Windows 11 Canary

# Server builds
$fetchupd all Retail Mainline 26100 1 406                 # Windows Server 2025 24H2 (AZURESTACKHCI)
$fetchupd all Retail Mainline 26100 1 8                   # Windows Server 2025 24H2 (DATACENTER)
$fetchupd amd64 Retail Mainline 25398 1 406               # Windows Server vNext 23H2 (AZURESTACKHCI)
$fetchupd amd64 Retail Mainline 25398 1 8                 # Windows Server vNext 23H2 (DATACENTER)
$fetchupd amd64 Retail Mainline 20349 859 406             # Windows Server 2022 22H2 (AZURESTACKHCI)
$fetchupd amd64 Retail Mainline 20348 1 406               # Windows Server 2022 21H2 (AZURESTACKHCI)
$fetchupd amd64 Retail Mainline 20348 1 8                 # Windows Server 2022 21H2 (DATACENTER)
$fetchupd amd64 Retail Mainline 17763 529 8               # Windows Server 2019 (DATACENTER)

$fetchupd all ReleasePreview Mainline 26100 1 406         # Windows Server 2025 24H2 Release Preview (AZURESTACKHCI)
$fetchupd all ReleasePreview Mainline 26100 1 408         # Windows Server 2025 24H2 Release Preview (DATACENTER_CORE_AZURE)
$fetchupd all ReleasePreview Mainline 26100 1 8           # Windows Server 2025 24H2 Release Preview (DATACENTER)
$fetchupd amd64 ReleasePreview Mainline 25398 287 406     # Windows Server vNext 23H2 Release Preview (AZURESTACKHCI)
$fetchupd amd64 ReleasePreview Mainline 25398 287 408     # Windows Server vNext 23H2 Release Preview (DATACENTER_CORE_AZURE)
$fetchupd amd64 ReleasePreview Mainline 25398 287 8       # Windows Server vNext 23H2 Release Preview (DATACENTER)
$fetchupd amd64 ReleasePreview Mainline 20349 859 406     # Windows Server 2022 22H2 Release Preview (AZURESTACKHCI)
$fetchupd amd64 ReleasePreview Mainline 20349 825 408     # Windows Server 2022 22H2 Release Preview (DATACENTER_CORE_AZURE)
$fetchupd amd64 ReleasePreview Mainline 20348 11 406      # Windows Server 2022 21H2 Release Preview (AZURESTACKHCI)
$fetchupd amd64 ReleasePreview Mainline 20348 1 8         # Windows Server 2022 21H2 Release Preview (DATACENTER)
$fetchupd amd64 ReleasePreview Mainline 17763 529 8       # Windows Server 2019 Release Preview (DATACENTER)

$fetchupd all Beta Mainline 26100 1 406                   # Windows Server 2025 24H2 Beta (AZURESTACKHCI)
$fetchupd all Beta Mainline 26100 1 408                   # Windows Server 2025 24H2 Beta (DATACENTER_CORE_AZURE)
$fetchupd all Beta Mainline 26100 1 8                     # Windows Server 2025 24H2 Beta (DATACENTER)
$fetchupd amd64 Beta Mainline 25398 287 406               # Windows Server vNext 23H2 Beta (AZURESTACKHCI)
$fetchupd amd64 Beta Mainline 25398 287 408               # Windows Server vNext 23H2 Beta (DATACENTER_CORE_AZURE)
$fetchupd amd64 Beta Mainline 25398 287 8                 # Windows Server vNext 23H2 Beta (DATACENTER)

$fetchupd all Dev Mainline 26100 1 406                    # Windows Server 2025 24H2 Dev (AZURESTACKHCI)
$fetchupd all Dev Mainline 26100 1 408                    # Windows Server 2025 24H2 Dev (DATACENTER_CORE_AZURE)
$fetchupd all Dev Mainline 26100 1 8                      # Windows Server 2025 24H2 Dev (DATACENTER)
$fetchupd amd64 Dev Mainline 25398 287 406                # Windows Server vNext 23H2 Dev (AZURESTACKHCI)
$fetchupd amd64 Dev Mainline 25398 287 408                # Windows Server vNext 23H2 Dev (DATACENTER_CORE_AZURE)
$fetchupd amd64 Dev Mainline 25398 287 8                  # Windows Server vNext 23H2 Dev (DATACENTER)

$fetchupd all Canary Mainline 26100 1 406                 # Windows Server 2025 24H2 Canary (AZURESTACKHCI)
$fetchupd all Canary Mainline 26100 1 408                 # Windows Server 2025 24H2 Canary (DATACENTER_CORE_AZURE)
$fetchupd all Canary Mainline 26100 1 8                   # Windows Server 2025 24H2 Canary (DATACENTER)
$fetchupd amd64 Canary Mainline 25398 287 406             # Windows Server vNext 23H2 Canary (AZURESTACKHCI)
$fetchupd amd64 Canary Mainline 25398 287 408             # Windows Server vNext 23H2 Canary (DATACENTER_CORE_AZURE)
$fetchupd amd64 Canary Mainline 25398 287 8               # Windows Server vNext 23H2 Canary (DATACENTER)
}

update_packs_and_fileinfo_over_git() {
	local fileinfoandpacksrepo=$fileinfo_and_packs_repo
	local packs="packs.git"
	local fileinfo="fileinfo.git"
	[ -d ./packs/.git ]      && cd packs          && git pull origin --rebase && cd ..
	[ ! -d ./packs/.git ]    && rm -rf packs/*    && git clone $fileinfoandpacksrepo/$packs packs --single-branch --depth 1
	[ -d ./fileinfo/.git ]   && cd fileinfo       && git pull origin --rebase && cd .. 
	[ ! -d ./fileinfo/.git ] && rm -rf fileinfo/* && git clone $fileinfoandpacksrepo/$fileinfo fileinfo --single-branch --depth 1
}


if [ "$get_packs_and_fileinfo_over_git" -eq 1 ]; then
    update_packs_and_fileinfo_over_git
else
    update_packs_and_fileinfo
fi


echo ""

rm -r uuptmp 2>/dev/null
$packsgen

echo ""
echo Done.
echo ""
