set -ex

INFER_HOME="${INFER_HOME-$HOME/infer}"

mkdir -p $INFER_HOME/infer

if [[ ! -f $INFER_HOME/infer/bin/infer ]]; then
    git clone --depth=50 git@github.com:facebook/infer.git $INFER_HOME/infer
    ls -al $INFER_HOME/infer
    $INFER_HOME/infer/update-fcp.sh
fi

find -name infer
