set -ex

INFER_HOME="${INFER_HOME-$HOME/infer}"

mkdir -p $INFER_HOME

if [[ ! -f $INFER_HOME/infer/bin/infer ]]; then
    curl -L -o $INFER_HOME/infer-0.2.0.zip https://github.com/facebook/infer/archive/v0.2.0.tar.gz
    ls -al $INFER_HOME
    unzip -q $INFER_HOME/infer-0.2.0.zip -d $INFER_HOME
    ls -al $INFER_HOME
    mv $INFER_HOME/infer-0.2.0 $INFER_HOME/infer
    ls -al $INFER_HOME/infer
    $INFER_HOME/infer/update-fcp.sh
fi

find -name infer
