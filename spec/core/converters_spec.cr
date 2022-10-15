class TimeSerializationTest
  include JSON::Serializable

  @[JSON::Field(converter: Amazonite::Core::AWSEpochConverter)]
  property now : Time

  def initialize(@now)
  end
end

describe "Amazonite::Core::Converters" do
  describe Amazonite::Core::AWSEpochConverter do
    it "can serialize Time to 'timestamp'" do
      test = TimeSerializationTest.new(Time.unix(1665823892))
      test.to_json.should eq(%({"now":1665823892.0}))
    end

    it "can deserialize 'timestamp' to Time" do
      test = TimeSerializationTest.from_json(%({"now":1665824202.234}))
      test.now.to_rfc3339(fraction_digits: 3).should eq("2022-10-15T08:56:42.234Z")
    end
  end
end
