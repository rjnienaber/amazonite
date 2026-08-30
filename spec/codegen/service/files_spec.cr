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
end
