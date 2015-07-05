set -ex

INFER_HOME="${INFER_HOME-$HOME/infer}"

mkdir -p $INFER_HOME
cd $INFER_HOME

if [[ ! -f infer/bin/infer ]]; then
    curl -L -o infer-0.2.0.zip https://github.com/facebook/infer/archive/v0.2.0.tar.gz
    unzip -q infer-0.2.0.zip
    mv infer-0.2.0 infer
    infer/update-fcp.sh
fi

find -name infer
