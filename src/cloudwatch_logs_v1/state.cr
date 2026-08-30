private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum State
    Active
    Suppressed
    Baseline

    def self.to_json(e : State, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::State
      value = pull.read_string
      case value
      when "Active"     then ACWL::State::Active
      when "Suppressed" then ACWL::State::Suppressed
      when "Baseline"   then ACWL::State::Baseline
      else
        raise Exception.new("unknown enum value for 'State' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACWL::State?
      case key
      when "Active"     then ACWL::State::Active
      when "Suppressed" then ACWL::State::Suppressed
      when "Baseline"   then ACWL::State::Baseline
      else
        nil
      end
    end
  end
end
