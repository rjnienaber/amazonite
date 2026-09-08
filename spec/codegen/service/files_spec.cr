require "../../spec_helper"

describe Amazonite::Codegen::Service::Files do
  describe ".models_dir" do
    it "defaults to the api-models-aws submodule" do
      Amazonite::Codegen::Service::Files.models_dir.should eq("api-models-aws")
    end

    it "is used to locate the Smithy model and can be pointed at another checkout" do
      original = Amazonite::Codegen::Service::Files.models_dir
      begin
        Amazonite::Codegen::Service::Files.models_dir = "does-not-exist"

        expect_raises(Exception, /couldn't find Smithy model/) do
          Amazonite::Codegen::Service::Files.translator("ssm")
        end
      ensure
        Amazonite::Codegen::Service::Files.models_dir = original
      end
    end
  end

  describe ".model_version" do
    it "reads the service's version from gradle.properties" do
      Amazonite::Codegen::Service::Files.model_version("sqs").should match(/^\d+\.\d+\.\d+$/)
    end

    it "accepts an old-format filename" do
      from_slug = Amazonite::Codegen::Service::Files.model_version("dynamodb")
      Amazonite::Codegen::Service::Files
        .model_version("dynamodb-2012-08-10.normal.json").should eq(from_slug)
    end

    it "maps slugs whose api-models-aws directory differs" do
      Amazonite::Codegen::Service::Files.model_version("kinesisanalyticsv2").should_not be_empty
    end

    it "raises for a service with no version entry" do
      expect_raises(Exception, /no model\.not-a-service\.version/) do
        Amazonite::Codegen::Service::Files.model_version("not-a-service")
      end
    end

    it "raises when the properties file is missing" do
      original = Amazonite::Codegen::Service::Files.models_dir
      begin
        Amazonite::Codegen::Service::Files.models_dir = "does-not-exist"

        expect_raises(Exception, /couldn't find does-not-exist\/gradle.properties/) do
          Amazonite::Codegen::Service::Files.model_version("sqs")
        end
      ensure
        Amazonite::Codegen::Service::Files.models_dir = original
      end
    end
  end
end
