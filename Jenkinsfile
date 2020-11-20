node('k3s') {
    container('ruby') {
        sh 'echo Building ${CHANGE_BRANCH}...'
        git branch: env.CHANGE_BRANCH, credentialsId: 'jenkins-tacsiazuma-admin-user', url: 'https://github.com/Tacsiazuma/easyjava.vim'
        sh '''gem install vim-flavor
        curl https://raw.githubusercontent.com/kana/vim-version-manager/master/bin/vvm | python - setup; true
        . ~/.vvm/etc/login
        vvm update_itself
        vvm use vimorg--v8.2.0803 --install --with-features=huge
        vim-flavor install
        vim-flavor test spec/'''
    }   
}
