require "../spec_helper"

describe Amazonite::Core::StringUtils do
  described_class = Amazonite::Core::StringUtils

  describe "#to_bool" do
    it "handles nil" do
      described_class.to_bool(nil).should be_false
    end

    it "handles 'false'" do
      described_class.to_bool("false").should be_false
    end

    it "handles 'true'" do
      described_class.to_bool("true").should be_true
    end

    it "handles inconsistent case 'tRuE'" do
      described_class.to_bool("true").should be_true
    end

    it "handles extra spacing " do
      described_class.to_bool(" true  ").should be_true
    end

    it "return false for unknown values" do
      described_class.to_bool("truthy").should be_false
    end
  end

  describe "#to_time" do
    it "converts time to Time in UTC" do
      described_class.to_time("2021-12-05 09:28:02.946636").should eq(Time.utc(2021, 12, 5, 9, 28, 2, nanosecond: 946636*1000))
    end
  end
end
