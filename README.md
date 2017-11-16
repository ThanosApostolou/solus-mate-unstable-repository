# solus-mate-unstable-repository
Repository for solus with the latest development mate packages. For build proccedure see this github repository: https://github.com/ThanosApostolou/solus-mate-unstable-ypkg/blob/master/README.md

# Enable repository
Run:
```
sudo eopkg ar --at 0 SolusMateUnstableRepository http://raw.github.com/ThanosApostolou/solus-mate-unstable-repository/master/eopkg-index.xml.xz
```
(apparently **http://** is needed in order to work)

Make sure that the repository is the first one at the top (it matters for priority reasons) by running:
```
eopkg lr
```
It is recommended to use the Unstable repository for this. So, you should have 1st priority SolusMateUnstableRepository, 2nd SolusUnstable and 3rd Solus. To fix repository order remove the one you want and add them again, for example:
```
sudo eopkg ar --at 1 SolusUnstable https://packages.solus-project.com/unstable/eopkg-index.xml.xz
sudo eopkg rr Solus
sudo eopkg ar --at 2 Solus https://packages.solus-project.com/shannon/eopkg-index.xml.xz
