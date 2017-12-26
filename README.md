# solus-mate-unstable-repository
Repository for solus with the latest development mate packages.
# Enable repository
Run:
```
sudo eopkg ar --at 0 SolusMateUnstableRepository http://raw.github.com/ThanosApostolou/solus-mate-unstable-repository/stable/eopkg-index.xml.xz
```
(apparently **http://** is needed in order to work)

Make sure that the repository is the first one at the top (it matters for priority reasons) by running:
```
eopkg lr
```
You can use this repository with either Solus Stable (Shannon) or Solus Unstable repositories. In order to use it with Solus unstable, for example, do this (after you add SolusMateUnstableRepository):
```
sudo eopkg ar --at 1 SolusUnstable https://packages.solus-project.com/unstable/eopkg-index.xml.xz
sudo eopkg dr Solus
```
Then run `eopkg lr` in order to verify that repositories have the correct order and that the Solus (stable) one is disabled. 

# Revert Changes
In order to revert the changes you need to remove my repository and then reinstall each package from the official repositories. You can use the script **help-revert.sh** in order to do that automatically.

# Build Instructions:
1. git clone https://github.com/ThanosApostolou/solus-mate-unstable-repository.git
2. git clone https://dev.solus-project.com/source/common.git
3. cd solus-mate-unstable-repository
4. Copy packages from each folder to **/var/lib/solbuild/local** (use help-copy.sh)
5. Build accordingly to help-mate-build-order.txt with command `make local`
6. Copy every new package to **/var/lib/solbuild/local** before you build the next one
7. After you build last package, then open terminal to git repository's folder and then `eopkg index --skip-signing` (use help-index.sh)
8. push changes to github
