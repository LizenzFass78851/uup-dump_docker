
Tested on Linux Mint 21

1. Make a Bash Scripts Executable:
chmod u+x linux-uupdump-get-fileinfo+packs.sh
chmod u+x linux-uupdump-get-packs.sh
chmod u+x linux-uupdump-run-website.sh

2. Install PHP and 7zip:
sudo apt install php php-curl php-xml php-zip p7zip-full -y

3. Run local server:
./linux-uupdump-run-website.sh

It should open new tab in your web browser as well. Address of local UUP dump instance: http://127.0.0.1:44400

4. Fetch some latest builds for your DB:
./linux-uupdump-get-fileinfo+packs.sh

Or just use "New build" feature on the website. You can edit that bash script if you want to save some time or to add something else.

5. Use this script for manually added builds using "New build" feature on the UUP dump website:
./linux-uupdump-get-packs.sh

It will generate metadata (packs) for your DB. "Generate metadata" feature on the website should work too for each build, but first please increase execution time to 60+ seconds in your PHP config file just in case.
