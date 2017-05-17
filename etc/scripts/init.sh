#!/usr/bin/env bash

git clone https://github.com/duog/ghc devel2
pushd devel2
git submodule init && git submodule update --recursive
popd
ln -sf ../../mk/devel2.mk devel2/mk/build.mk
git clone https://github.com/duog/ghc prof
pushd prof
git submodule init  && git submodule update --recursive
popd
ln -sf ../../mk/prof.mk prof/mk/build.mk
git clone https://github.com/duog/ghc validate
pushd validate
git submodule init  && git submodule update --recursive
popd
ln -sf ../../mk/prof.mk prof/mk/build.mk
