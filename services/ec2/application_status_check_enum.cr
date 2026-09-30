private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ApplicationStatusCheckEnum
    Passed
    Failed
    Initializing
    InsufficientData
    NotApplicable

    def self.to_json(e : ApplicationStatusCheckEnum, json : JSON::Builder) : Nil
      value = case e
              when AEC::ApplicationStatusCheckEnum::Passed           then "passed"
              when AEC::ApplicationStatusCheckEnum::Failed           then "failed"
              when AEC::ApplicationStatusCheckEnum::Initializing     then "initializing"
              when AEC::ApplicationStatusCheckEnum::InsufficientData then "insufficient-data"
              when AEC::ApplicationStatusCheckEnum::NotApplicable    then "not-applicable"
              else
                raise Exception.new("unknown enum value for 'ApplicationStatusCheckEnum' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ApplicationStatusCheckEnum
      value = pull.read_string
      case value
      when "passed"            then AEC::ApplicationStatusCheckEnum::Passed
      when "failed"            then AEC::ApplicationStatusCheckEnum::Failed
      when "initializing"      then AEC::ApplicationStatusCheckEnum::Initializing
      when "insufficient-data" then AEC::ApplicationStatusCheckEnum::InsufficientData
      when "not-applicable"    then AEC::ApplicationStatusCheckEnum::NotApplicable
      else
        raise Exception.new("unknown enum value for 'ApplicationStatusCheckEnum' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ApplicationStatusCheckEnum::Passed           then "passed"
      when AEC::ApplicationStatusCheckEnum::Failed           then "failed"
      when AEC::ApplicationStatusCheckEnum::Initializing     then "initializing"
      when AEC::ApplicationStatusCheckEnum::InsufficientData then "insufficient-data"
      when AEC::ApplicationStatusCheckEnum::NotApplicable    then "not-applicable"
      else
        raise Exception.new("unknown enum value for 'ApplicationStatusCheckEnum' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ApplicationStatusCheckEnum?
      case key
      when "passed"            then AEC::ApplicationStatusCheckEnum::Passed
      when "failed"            then AEC::ApplicationStatusCheckEnum::Failed
      when "initializing"      then AEC::ApplicationStatusCheckEnum::Initializing
      when "insufficient-data" then AEC::ApplicationStatusCheckEnum::InsufficientData
      when "not-applicable"    then AEC::ApplicationStatusCheckEnum::NotApplicable
      else
        nil
      end
    end
  end
end
