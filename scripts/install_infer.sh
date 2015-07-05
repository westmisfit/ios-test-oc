set -ex

INFER_HOME="${INFER_HOME-$HOME/infer}"
INFER_VERSION=0.2.0

mkdir -p $INFER_HOME/infer-${INFER_VERSION}

if [[ ! -f $INFER_HOME/infer-${INFER_VERSION}/infer/bin/infer ]]; then
    git clone --depth=50 https://github.com/facebook/infer.git $INFER_HOME/infer-${INFER_VERSION}
    cd $INFER_HOME/infer-${INFER_VERSION}
    git checkout v${INFER_VERSION}
    git branch
    ls -al
    ls -al infer/bin/
    ./update-fcp.sh
    ls -al $INFER_HOME
fi

# find $INFER_HOME/infer-${INFER_VERSION} -name infer
echo $PATH
which infer
