set -ex

INFER_HOME="${INFER_HOME-$HOME/infer}"
INFER_VERSION=0.1.1

mkdir -p $INFER_HOME

if [[ ! -f $INFER_HOME/infer-${INFER_VERSION}/infer/bin/infer ]]; then
    cd $INFER_HOME
    curl -L -o infer-0.1.1.tar.gz https://github.com/facebook/infer/archive/v0.1.1.tar.gz
    tar xzf infer-0.1.1.tar.gz
    ls -al
    mv infer-0.1.1 infer
    cd infer
    ls -al
    ls -al infer/bin/
    ./update-fcp.sh
    ls -al $INFER_HOME
fi

# find $INFER_HOME/infer-${INFER_VERSION} -name infer
infer --version
