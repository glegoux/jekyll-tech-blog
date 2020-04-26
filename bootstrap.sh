# bash script
# usage: source boostrap.sh

ruby_project_version="$(cat .ruby-version | tr -d '\n')"
ruby_local_version="$(which ruby &> /dev/null && ruby --version | cut -f2 -d' ' | cut -f1 -d'p')"

if [[ "${ruby_local_version}" != "${ruby_project_version}" ]]; then
  source ~/.profile
  rvm use "${ruby_project_version}" \
    || >&2 echo "ERROR: Please install rvm, see https://rvm.io/, then ruby ${ruby_project_version} with that"
else
  >&2 echo "WARNING: You use already ruby ${ruby_project_version}"
fi