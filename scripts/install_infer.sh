set -ex

INFER_HOME="${INFER_HOME-$HOME/infer}"

mkdir -p $INFER_HOME/infer

if [[ ! -f $INFER_HOME/infer/bin/infer ]]; then
    git clone --depth=50 https://github.com/facebook/infer.git $INFER_HOME/infer
    cd $INFER_HOME/infer
    git checkout v0.2.0
    git branch
    cd infer
    ls -al
    ./update-fcp.sh

    ls -al $INFER_HOME
fi

# find $INFER_HOME/infer -name infer
which infer
