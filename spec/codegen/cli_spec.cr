require "../spec_helper"

describe Amazonite::Codegen::Cli do
  describe "#parse" do
    it "defaults models_dir, output_dir and log_level when no flags are given" do
      cli = Amazonite::Codegen::Cli.new.parse([] of String)

      cli.models_dir.should eq("api-models-aws")
      cli.output_dir.should eq("tmp")
      cli.log_level.should eq(Log::Severity::Info)
      cli.services.should eq([] of String)
      cli.protocols.should eq([] of String)
    end

    it "parses --models-dir and --output-dir" do
      cli = Amazonite::Codegen::Cli.new.parse(["--models-dir=/tmp/models", "--output-dir=/tmp/out"])

      cli.models_dir.should eq("/tmp/models")
      cli.output_dir.should eq("/tmp/out")
    end

    it "supports the short flag forms" do
      cli = Amazonite::Codegen::Cli.new.parse(["-m", "/tmp/models", "-o", "/tmp/out"])

      cli.models_dir.should eq("/tmp/models")
      cli.output_dir.should eq("/tmp/out")
    end

    it "collects repeated --service flags" do
      cli = Amazonite::Codegen::Cli.new.parse(["--service=dynamodb", "--service=ssm"])

      cli.services.should eq(["dynamodb", "ssm"])
    end

    it "collects repeated --protocol flags" do
      cli = Amazonite::Codegen::Cli.new.parse(["--protocol=json", "-p", "rest-json"])

      cli.protocols.should eq(["json", "rest-json"])
    end

    it "parses a valid --log-level" do
      cli = Amazonite::Codegen::Cli.new.parse(["--log-level=debug"])

      cli.log_level.should eq(Log::Severity::Debug)
    end

    it "raises on an unknown --log-level value" do
      expect_raises(Exception, /unknown log level 'bogus'/) do
        Amazonite::Codegen::Cli.new.parse(["--log-level=bogus"])
      end
    end

    it "raises on an unrecognised flag" do
      expect_raises(Exception, /not a valid option/) do
        Amazonite::Codegen::Cli.new.parse(["--not-a-real-flag"])
      end
    end
  end
end
