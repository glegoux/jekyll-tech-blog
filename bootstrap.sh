# usage: source boostrap.sh

exec bash --login --init-file <(echo 'rvm use "$(cat .ruby-version)"')