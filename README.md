# easyjava.vim

Vim plugin to automate simple but repetitive tasks during java development.

## Installation with Vundle

Simply include 

```vim
Plugin 'tacsiazuma/easyjava.vim'
```

inside the 

```vim
call vundle#begin()
```
and 

```vim
call vundle#end()
```
sections.

## Usage

Any time you open a buffer with java extension, the plugin will check if the file is empty and populate it with the right package and classname.
For the package name it searches for standard maven structures like pom.xml and goes from there.

If you open up an empty pom.xml then it will populate it with a template pom.xml, with a single dependency junit.
It also checks if the source folders are created (src/main, src/test) and if not then it will create them for you.
