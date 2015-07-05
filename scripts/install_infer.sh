set -ex

INFER_HOME="${INFER_HOME-$HOME/infer}"
INFER_VERSION=0.1.1

mkdir -p $INFER_HOME

if [[ ! -f $INFER_HOME/infer/infer/bin/infer ]]; then
    cd $INFER_HOME
    curl -L -o infer-${INFER_VERSION}.tar.gz https://github.com/facebook/infer/archive/v${INFER_VERSION}.tar.gz
    tar xzf infer-${INFER_VERSION}.tar.gz
    ls -al
    mv infer-${INFER_VERSION} infer
    cd infer
    ls -al
    ls -al infer/bin/
    ./update-fcp.sh
    ls -al $INFER_HOME
fi

# find $INFER_HOME/infer-${INFER_VERSION} -name infer
infer --version
