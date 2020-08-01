source plugin/easyjava.vim

fun g:Teardown()
    !rm -rf spec/fixture/empty_folder/
    !mkdir spec/fixture/empty_folder
    !touch spec/fixture/empty_folder/.gitkeep
endfun

