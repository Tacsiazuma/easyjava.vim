source support/test.vim

describe "After creating a .java file inside a multi module maven project"

    before 
        cd spec/fixture/multi_module_maven_project
    end

    after
        cd -
        call Teardown()
    end

    it "should fill the package name when inside the main path"
        !touch sample_module/src/main/java/hu/letscode/FileName.java
        view! sample_module/src/main/java/hu/letscode/FileName.java
        call SetupJavaClass()
        Expect getline(1) == "package hu.letscode;"
    end

    it "should fill the package name when inside the test path"
        !touch sample_module/src/test/java/hu/letscode/FileNameTest.java
        view! sample_module/src/test/java/hu/letscode/FileNameTest.java
        call SetupJavaClass()
        Expect getline(1) == "package hu.letscode;"
    end

    it "should fill the package name when module name contains hyphen"
        !touch sample-module/src/test/java/hu/letscode/FileNameTest.java
        view! sample-module/src/test/java/hu/letscode/FileNameTest.java
        call SetupJavaClass()
        Expect getline(1) == "package hu.letscode;"
    end

    it "should not repeate content in the file"
        !touch sample_module/src/main/java/hu/letscode/FileName.java
        view! sample_module/src/main/java/hu/letscode/FileName.java
        call SetupJavaClass()
        Expect getline(6) == ""
    end

    it "should fill the class name and brackets when inside the main path"
        !touch sample_module/src/main/java/hu/letscode/FileName.java
        view! sample_module/src/main/java/hu/letscode/FileName.java
        call SetupJavaClass()
        Expect getline(3) == "public class FileName {"
        Expect getline(5) == "}"
    end

    it "should fill the class name and brackets when inside the test path"
        !touch sample_module/src/test/java/hu/letscode/FileNameTest.java
        view! sample_module/src/test/java/hu/letscode/FileNameTest.java
        call SetupJavaClass()
        Expect getline(3) == "public class FileNameTest {"
        Expect getline(5) == "}"
    end
end
describe "After creating a .java file inside a single module maven project"

    before 
        cd spec/fixture/single_module_maven_project
    end

    after
        cd -
        call Teardown()
    end

    it "should fill the package name when inside the main path"
        !touch src/main/java/hu/letscode/FileName.java
        view! src/main/java/hu/letscode/FileName.java
        call SetupJavaClass()
        Expect getline(1) == "package hu.letscode;"
    end

    it "should fill the package name when inside the test path"
        !touch src/test/java/hu/letscode/FileNameTest.java
        view! src/test/java/hu/letscode/FileNameTest.java
        call SetupJavaClass()
        Expect getline(1) == "package hu.letscode;"
    end

    it "should fill the class name and brackets when inside the main path"
        !touch src/main/java/hu/letscode/FileName.java
        view! src/main/java/hu/letscode/FileName.java
        call SetupJavaClass()
        Expect getline(3) == "public class FileName {"
        Expect getline(5) == "}"
    end

    it "should fill the class name and brackets when inside the test path"
        !touch src/test/java/hu/letscode/FileNameTest.java
        view! src/test/java/hu/letscode/FileNameTest.java
        call SetupJavaClass()
        Expect getline(3) == "public class FileNameTest {"
        Expect getline(5) == "}"
    end
end
