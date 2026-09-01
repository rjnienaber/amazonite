private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  enum SuppressionState
    Suppressed
    Unsuppressed

    def self.to_json(e : SuppressionState, json : JSON::Builder) : Nil
      value = case e
              when ACWL::SuppressionState::Suppressed   then "SUPPRESSED"
              when ACWL::SuppressionState::Unsuppressed then "UNSUPPRESSED"
              else
                raise Exception.new("unknown enum value for 'SuppressionState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::SuppressionState
      value = pull.read_string
      case value
      when "SUPPRESSED"   then ACWL::SuppressionState::Suppressed
      when "UNSUPPRESSED" then ACWL::SuppressionState::Unsuppressed
      else
        raise Exception.new("unknown enum value for 'SuppressionState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::SuppressionState::Suppressed   then "SUPPRESSED"
      when ACWL::SuppressionState::Unsuppressed then "UNSUPPRESSED"
      else
        raise Exception.new("unknown enum value for 'SuppressionState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::SuppressionState?
      case key
      when "SUPPRESSED"   then ACWL::SuppressionState::Suppressed
      when "UNSUPPRESSED" then ACWL::SuppressionState::Unsuppressed
      else
        nil
      end
    end
  end
end
