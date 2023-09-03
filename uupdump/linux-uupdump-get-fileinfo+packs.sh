#!/bin/bash
fetchdetect="php ./sta/fetchdetect.php"
pushd ./uup && rm -r uuptmp 2>/dev/null

echo Client
$fetchdetect All Retail Mainline 17763 1 125
$fetchdetect All Retail Mainline 19044 1 125
$fetchdetect All Retail Mainline 19045 1
$fetchdetect All Retail Mainline 22000 1
$fetchdetect All Retail Mainline 22621 1

$fetchdetect All ReleasePreview Mainline 19045 1
$fetchdetect All ReleasePreview Mainline 22000 1
$fetchdetect All ReleasePreview Mainline 22621 1

$fetchdetect All Beta Mainline 22000 1
$fetchdetect All Beta Mainline 22621 1
$fetchdetect All Beta Mainline 22631 1

$fetchdetect All Dev Mainline 22621 1
$fetchdetect All Canary Mainline Latest
echo ""

echo Server
$fetchdetect All Retail Mainline 20348 1 8
$fetchdetect All Retail Mainline 20348 1 406
$fetchdetect All Retail Mainline 20349 1 406
$fetchdetect All Retail Mainline 25398 1 8
$fetchdetect All Retail Mainline 25398 1 406
echo ""
