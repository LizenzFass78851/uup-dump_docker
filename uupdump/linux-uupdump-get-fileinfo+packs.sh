#!/bin/bash
fetchupd="php ./sta/fetchupd.php"
packsgen="php ./sta/packsgen.php"

pushd ./uup && rm -r uuptmp 2>/dev/null

$packsgen
echo ""

# Client builds
$fetchupd all Retail Mainline 22631 1
$fetchupd all Retail Mainline 22621 1
$fetchupd all Retail Mainline 22000 1
$fetchupd all Retail Mainline 19045 1806
$fetchupd all Retail Mainline 19044 1202 125
$fetchupd amd64 Retail Mainline 19042 572 119
$fetchupd all Retail Mainline 17763 529 19

$fetchupd all ReleasePreview Mainline 22631 1
$fetchupd all ReleasePreview Mainline 22621 1
$fetchupd all ReleasePreview Mainline 22000 1
$fetchupd all ReleasePreview Mainline 19045 1806
$fetchupd all ReleasePreview Mainline 19044 1202 125

$fetchupd all Beta Mainline 22631 1
$fetchupd all Beta Mainline 22621 1
$fetchupd all Beta Mainline 22000 1

$fetchupd all Dev Mainline 22631 1
$fetchupd all Dev Mainline 22621 1

$fetchupd amd64 Dev Mainline 19100 1019 119
$fetchupd all Dev Mainline 19042 985 119

$fetchupd all Canary Mainline Latest
  
# Server builds
$fetchupd all Retail Mainline 25398 1 406
$fetchupd all Retail Mainline 25398 1 8
$fetchupd all Retail Mainline 20349 859 406
$fetchupd all Retail Mainline 20348 1 406
$fetchupd all Retail Mainline 20348 1 8

$fetchupd all Retail Mainline 17763 529 8

$fetchupd all ReleasePreview Mainline 25398 287 406
$fetchupd all ReleasePreview Mainline 25398 287 408
$fetchupd all ReleasePreview Mainline 25398 287 8
$fetchupd all ReleasePreview Mainline 20349 859 406
$fetchupd all ReleasePreview Mainline 20349 825 408
$fetchupd all ReleasePreview Mainline 20348 11 406
$fetchupd all ReleasePreview Mainline 20348 1 8

$fetchupd all ReleasePreview Mainline 17763 529 8

$fetchupd all Beta Mainline 25398 287 406
$fetchupd all Beta Mainline 25398 287 408
$fetchupd all Beta Mainline 25398 287 8

$fetchupd all Dev Mainline 25398 287 406
$fetchupd all Dev Mainline 25398 287 408
$fetchupd all Dev Mainline 25398 287 8

$fetchupd all Canary Mainline 25398 287 406
$fetchupd all Canary Mainline 25398 287 408
$fetchupd all Canary Mainline 25398 287 8
  

#fileinfoandpacksrepo="https://github.com/uup-dump"
#packs="packs.git"
#fileinfo="fileinfo.git"
#[ -d ./packs ] && cd packs && git pull origin && cd ..
#[ ! -d ./packs ] && git clone $fileinfoandpacksrepo/$packs packs
#[ -d ./fileinfo ] && cd fileinfo && git pull origin && cd .. 
#[ ! -d ./fileinfo ] && git clone $fileinfoandpacksrepo/$fileinfo fileinfo

echo ""

rm -r uuptmp 2>/dev/null
$packsgen

echo ""
echo Done.
echo ""
