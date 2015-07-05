set -ex

function install_macos
{
    # because fbinfer removed the osx download link from https://github.com/facebook/infer/releases
    # so, I have uploaded a copy of infer-osx-v0.1.0.tar.xz to dropbox,
    # then, download it from dropbox
    curl -L -o $HOME/infer-osx-v0.1.0.tar.xz https://www.dropbox.com/s/aw52i89zsa8218c/infer-osx-v0.1.0.tar.xz?dl=1
    tar -xJf $HOME/infer-osx-v0.1.0.tar.xz $HOME
    ln -s $HOME/infer-osx-v0.1.0 $HOME/infer
}

function install_linux
{
    # INFER_VERSION=0.1.1

    # mkdir -p $HOME/infer
    # cd $HOME/infer
    # curl -L -o infer-${INFER_VERSION}.tar.gz https://github.com/facebook/infer/archive/v${INFER_VERSION}.tar.gz
    # tar xzf infer-${INFER_VERSION}.tar.gz
    # ls -al
    # mv infer-${INFER_VERSION} infer
    # cd infer
    # ls -al
    # ls -al infer/bin/
    # ./update-fcp.sh
    # ls -al $HOME/infer
}

if [[ ! -f $HOME/infer/infer/infer/bin/infer ]]; then
    install_macos
fi

# find $INFER_HOME/infer-${INFER_VERSION} -name infer
infer --version
