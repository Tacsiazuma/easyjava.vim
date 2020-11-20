node('k3s') {
    container('ruby') {
        if (env.CHANGE_BRANCH) {
            env.BRANCH_TO_BUILD = env.CHANGE_BRANCH
        } else {
            env.BRANCH_TO_BUILD = env.BRANCH_NAME
        }
        sh 'echo Building ${BRANCH_TO_BUILD}...'
        git branch: env.BRANCH_TO_BUILD, credentialsId: 'jenkins-tacsiazuma-admin-user', url: 'https://github.com/Tacsiazuma/easyjava.vim'
        sh '''#!/bin/bash
        gem install vim-flavor
        curl https://raw.githubusercontent.com/kana/vim-version-manager/master/bin/vvm | python - setup; true
        source ~/.vvm/etc/login
        vvm update_itself
        vvm use vimorg--v8.2.0803 --install --with-features=huge
        vim-flavor install
        vim-flavor test spec/'''
    }   
}
