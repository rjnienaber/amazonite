private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum ConcurrencyMode
    StrictFailureTolerance
    SoftFailureTolerance

    def self.to_json(e : ConcurrencyMode, json : JSON::Builder) : Nil
      value = case e
              when ACF::ConcurrencyMode::StrictFailureTolerance then "STRICT_FAILURE_TOLERANCE"
              when ACF::ConcurrencyMode::SoftFailureTolerance   then "SOFT_FAILURE_TOLERANCE"
              else
                raise Exception.new("unknown enum value for 'ConcurrencyMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::ConcurrencyMode
      value = pull.read_string
      case value
      when "STRICT_FAILURE_TOLERANCE" then ACF::ConcurrencyMode::StrictFailureTolerance
      when "SOFT_FAILURE_TOLERANCE"   then ACF::ConcurrencyMode::SoftFailureTolerance
      else
        raise Exception.new("unknown enum value for 'ConcurrencyMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::ConcurrencyMode::StrictFailureTolerance then "STRICT_FAILURE_TOLERANCE"
      when ACF::ConcurrencyMode::SoftFailureTolerance   then "SOFT_FAILURE_TOLERANCE"
      else
        raise Exception.new("unknown enum value for 'ConcurrencyMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::ConcurrencyMode?
      case key
      when "STRICT_FAILURE_TOLERANCE" then ACF::ConcurrencyMode::StrictFailureTolerance
      when "SOFT_FAILURE_TOLERANCE"   then ACF::ConcurrencyMode::SoftFailureTolerance
      else
        nil
      end
    end
  end
end
