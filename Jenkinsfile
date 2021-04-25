node('ruby-builder') {
    container('ruby') {
        if (env.CHANGE_BRANCH) {
            env.BRANCH_TO_BUILD = env.CHANGE_BRANCH
        } else {
            env.BRANCH_TO_BUILD = env.BRANCH_NAME
        }
        sh 'echo Building ${BRANCH_TO_BUILD}...'
        git branch: env.BRANCH_TO_BUILD, credentialsId: 'jenkins-tacsiazuma-admin-user', url: 'https://github.com/Tacsiazuma/easyjava.vim'
        sh '''#!/bin/bash
        apt update && apt install vim -y
        gem install vim-flavor
        vim-flavor install
        vim-flavor test spec/'''
    }   
}
