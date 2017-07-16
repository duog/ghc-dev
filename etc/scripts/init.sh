#!/usr/bin/env bash

git clone http://git.haskell.org/ghc.git devel2
pushd devel2
git submodule init && git submodule update --recursive
git remote add -f -t duog https://github.com/duog/ghc
popd
ln -sf ../../etc/mk/devel2.mk devel2/mk/build.mk
git clone http://git.haskell.org/ghc.git validate
pushd validate
git submodule init && git submodule update --recursive
git remote add -f -t duog https://github.com/duog/ghc
popd
ln -sf ../../etc/mk/validate.mk validate/mk/build.mk
git clone http://git.haskell.org/ghc.git devel2
pushd prof
git submodule init && git submodule update --recursive
git remote add -f -t duog https://github.com/duog/ghc
popd
ln -sf ../../etc/mk/prof.mk prof/mk/build.mk
