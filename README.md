# solus-mate-unstable-repository
Repository for solus with the latest development mate packages. For build proccedure see this github repository: https://github.com/ThanosApostolou/solus-mate-unstable-ypkg/blob/master/README.md

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
It is recommended to use the Unstable repository for this. So, you should have 1st priority SolusMateUnstableRepository, 2nd SolusUnstable and 3rd Solus. It is recommended that you also disable the Solus (stable) repository because it can cause problems when the SolusUnstable Repository at the same time. To fix repository order remove the one you want and add them again, for example:
```
sudo eopkg ar --at 1 SolusUnstable https://packages.solus-project.com/unstable/eopkg-index.xml.xz
sudo eopkg rr Solus
sudo eopkg ar --at 2 Solus https://packages.solus-project.com/shannon/eopkg-index.xml.xz
sudo eopkg dr Solus
```
Then run `eopkg lr` in order to verify that repositories have the correct order and that the Solus (stable) one is disabled. 

Note that SolusUnstable with Solus have only a few days difference. I build the packages against SolusUnstable Repository but with a little delay (depending on my free time). So, unless there is any huge ABI breakage and need for massive rebuild, then it should be safe to just use the Solus (stable) repository too (if you are afraid of the SolusUnstable).

# Revert Changes
In order to revert the changes you need to remove my repository and then reinstall each package from the official repositories. You can use the script **revert.sh** in order to do that automatically.
