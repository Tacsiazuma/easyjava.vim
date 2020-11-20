node('k3s') {
     container('ruby') {
        sh 'echo Building ${BRANCH_NAME}...'
        git branch: env.BRANCH_NAME, credentialsId: 'jenkins-tacsiazuma-admin-user', url: 'https://github.com/Tacsiazuma/easyjava.vim'
        sh '''gem install vim-flavor
        vim-flavor test spec/'''
    }   
}
