#!/bin/bash
fetchdetect="php ./sta/fetchdetect.php"
pushd ./uup && rm -r uuptmp 2>/dev/null

echo Client
$fetchdetect all Retail Mainline 17763 1 125
$fetchdetect amd64 Retail Mainline 19042 1 119
$fetchdetect all Retail Mainline 19044 1 125
$fetchdetect all Retail Mainline 19045 1
$fetchdetect all Retail Mainline 22000 1
$fetchdetect all Retail Mainline 22621 1

$fetchdetect all ReleasePreview Mainline 19045 1
$fetchdetect all ReleasePreview Mainline 22000 1
$fetchdetect all ReleasePreview Mainline 22621 1

$fetchdetect all Beta Mainline 22000 1
$fetchdetect all Beta Mainline 22621 1
$fetchdetect all Beta Mainline 22631 1

$fetchdetect amd64 Dev Mainline 19100 1 119
$fetchdetect all Dev Mainline 22621 1
$fetchdetect all Canary Mainline Latest
echo ""

echo Server
$fetchdetect amd64 Retail Mainline 20348 1 8
$fetchdetect amd64 Retail Mainline 20348 1 406
$fetchdetect amd64 Retail Mainline 20349 1 406
$fetchdetect amd64 Retail Mainline 25398 1 8
$fetchdetect amd64 Retail Mainline 25398 1 406

$fetchdetect amd64 ReleasePreview Mainline 20349 1 406
echo ""
