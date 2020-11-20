node('k3s') {
    container('ruby') {
        sh 'echo Building ${CHANGE_BRANCH}...'
        git branch: env.CHANGE_BRANCH, credentialsId: 'jenkins-tacsiazuma-admin-user', url: 'https://github.com/Tacsiazuma/easyjava.vim'
        sh '''gem install vim-flavor
        vim-flavor test spec/'''
    }   
}
