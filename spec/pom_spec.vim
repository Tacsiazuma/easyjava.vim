source support/test.vim

describe "After creating a pom.xml and navigating into it"

    before 
        cd spec/fixture/empty_folder
    end

    after
        cd -
        call Teardown()
    end

    it "should fill the pom.xml"

        !touch pom.xml
        view pom.xml
        call SetupMavenProject()
        Expect getline(1) == "<project xmlns=\"http://maven.apache.org/POM/4.0.0\""
    end

    it "should create main resources dir"

        !touch pom.xml
        view pom.xml
        call SetupMavenProject()
        Expect isdirectory("./src/main/resources") to_be_true
    end

end
