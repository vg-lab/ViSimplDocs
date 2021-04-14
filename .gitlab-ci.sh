set -e
if [ ! -z "${GITHUB_MIRROR_URL}" ]; then
    rm -rf ___GITLAB_REPO___
    git clone git@`git remote -v | grep origin | cut -d "@" -f2 | sed -e "s/\//:/" | cut -d" " -f1 | head -n1` ___GITLAB_REPO___
    cd ___GITLAB_REPO___
    git remote add github ${GITHUB_MIRROR_URL}
    git push github master
fi

