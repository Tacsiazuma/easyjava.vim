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
