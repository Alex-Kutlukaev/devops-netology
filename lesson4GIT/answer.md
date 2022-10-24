1)выполним команду git show aefea
в выводе получим:
полный хэш коммита - aefead2207ef7e2aa5dc81a34aedf0cad4c32545 
а коментарий коммита - Update CHANGELOG.md

2) Выполним команду git show 85024d3
в выводе видно что v0.12.23 тэг данного коммита


3) выполним git show b8d720
получим два хеша 56cd7859e0 9ea88f22fc

4) выполним git log v0.12.23..v0.12.24
Получим:
33ff1c03bb (tag: v0.12.24) v0.12.24
b14b74c493 [Website] vmc provider links
3f235065b9 Update CHANGELOG.md
6ae64e247b registry: Fix panic when server is unreachable
5c619ca1ba website: Remove links to the getting started guide's old location
06275647e2 Update CHANGELOG.md
d5f9411f51 command: Fix bug when using terraform login on Windows
4b6d06cc5d Update CHANGELOG.md
dd01a35078 Update CHANGELOG.md
225466bc3e Cleanup after v0.12.23 release

5)выполним поиск по событиям git log -S 'func providerSource' --oneline 
получим:
5af1e6234a main: Honor explicit provider_installation CLI config when present
8c928e8358 main: Consult local directories as potential mirrors of providers

6) не смог решить 


7) git log -S 'func synchronizedWriters' --pretty=format:%H%an%ae
bdfea50cc85161dea41be0fe3381fd98731ff786--James Bardin--j.bardin@gmail.com
5ac311e2a91e381e2f52234668b49ba670aa0fe5--Martin Atkins--mart@degeneration.co.uk
