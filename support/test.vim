let g:easyjava_no_autocmd = 1
source plugin/easyjava.vim

fun g:Teardown()
    !rm -rf spec/fixture/empty_folder/
    !mkdir spec/fixture/empty_folder
    !touch spec/fixture/empty_folder/.gitkeep
    !rm spec/fixture/single_module_maven_project/src/main/java/hu/letscode/FileName.java
    !rm spec/fixture/single_module_maven_project/src/test/java/hu/letscode/FileNameTest.java
    !rm spec/fixture/multi_module_maven_project/sample_module/src/main/java/hu/letscode/FileName.java
    !rm spec/fixture/multi_module_maven_project/sample_module/src/test/java/hu/letscode/FileNameTest.java
endfun

