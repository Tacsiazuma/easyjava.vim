" Vim plugin to automate a few java related task. 
" Prefilling files with package, classname.
" Last Change:	2020 May 5
" Maintainer:	Papp Krisztián <krisztian@letscode.hu>

if exists('g:did_easy_java_setup') 
  finish
endif

let s:plugindir = expand('<sfile>:p:h:h')

fun! SetupJavaClass()
    if getfsize(expand('%'))==0
        exe "0read". fnameescape(s:plugindir)."/skeleton.java"
        exe "%s/__CLASS_NAME__/" . expand('%:t:r')
        exe "%s/__PACKAGE__/" . s:GetPackageStatement()
    endif
endfun

function! s:GetPackageStatement()
    return "package " . s:GetCurrentPackage() . ";"
endfunction

function! s:GetCurrentPackage()
    let l:projdir = s:GetJavaProjectDirectory()

    let l:filedir = expand("%:p:h")

    " Chop off the project directory prefix of of the current working
    " directory.
    let l:fullpath = substitute(l:filedir, l:projdir, "", "")

    " Chop off the /src/main/java prefix along with submodule name
    let l:path = substitute(l:fullpath, '.*/src/\(main\|test\)/java', '', '')

    " Chop off leading /
    let l:path = substitute(l:path, '^[/]*', '', '')

    " Replace slashes with periods.
    let l:package = substitute(l:path, '/', '.', 'g')

    return l:package
endfunction

function! s:GetJavaProjectDirectory()
    let pomFile = s:GetPomFile(getcwd())
    if strlen(l:pomFile) > 0
        return fnamemodify(l:pomFile, ':h')
    else
        return 0
    endif
endfunction

function! s:GetPomFile(pwd)
    if a:pwd ==# "\/"
        return 0
    else
        let l:fn = a:pwd . "/pom.xml"

        if filereadable(expand(l:fn))
            return l:fn
        else
            let l:parent = fnamemodify(a:pwd, ':h')
            return s:GetPomFile(l:parent)
        endif
    endif
endfunction

function SetupMavenProject()
    execute "0read". fnameescape(s:plugindir)."/pom.xml"
    write!
    execute "silent! !mkdir -p ".shellescape(expand('%:p:h'),1). "/src"
    execute "silent! !mkdir -p ".shellescape(expand('%:p:h'),1). "/src/main"
    execute "silent! !mkdir -p ".shellescape(expand('%:p:h'),1). "/src/test"
    execute "silent! !mkdir -p ".shellescape(expand('%:p:h'),1). "/src/main/java"
    execute "silent! !mkdir -p ".shellescape(expand('%:p:h'),1). "/src/main/resources"
    execute "silent! !mkdir -p ".shellescape(expand('%:p:h'),1). "/src/test/java"
    execute "silent! !mkdir -p ".shellescape(expand('%:p:h'),1). "/src/test/resources"
endfunction

if !exists('g:easyjava_no_autocmd') 
    autocmd BufRead *.java call SetupJavaClass()
    autocmd BufRead pom.xml if getfsize(expand('%'))==0|call SetupMavenProject()|endif
endif

let g:did_easy_java_setup=1
