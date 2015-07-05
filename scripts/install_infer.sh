set -ex
if [[ ! -f $INFER_HOME/infer/bin/infer ]]; then
    # git clone --depth=50 https://github.com/facebook/infer.git $INFER_HOME
    curl -L -o $HOME/infer-0.2.0.zip https://github.com/facebook/infer/archive/v0.2.0.zip
    ls -l $HOME/infer-0.2.0.zip
    unzip $HOME/infer-0.2.0.zip -d $HOME/infer-0.2.0
    ls $HOME/infer-0.2.0
    ln -s $HOME/infer-0.2.0 $HOME/infer
    ls $HOME/infer
fi
find $INFER_HOME -name infer
