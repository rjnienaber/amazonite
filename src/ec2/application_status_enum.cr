private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ApplicationStatusEnum
    Ok
    Impaired
    Initializing
    InsufficientData
    NotApplicable
    Suppressed

    def self.to_json(e : ApplicationStatusEnum, json : JSON::Builder) : Nil
      value = case e
              when AEC::ApplicationStatusEnum::Ok               then "ok"
              when AEC::ApplicationStatusEnum::Impaired         then "impaired"
              when AEC::ApplicationStatusEnum::Initializing     then "initializing"
              when AEC::ApplicationStatusEnum::InsufficientData then "insufficient-data"
              when AEC::ApplicationStatusEnum::NotApplicable    then "not-applicable"
              when AEC::ApplicationStatusEnum::Suppressed       then "suppressed"
              else
                raise Exception.new("unknown enum value for 'ApplicationStatusEnum' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ApplicationStatusEnum
      value = pull.read_string
      case value
      when "ok"                then AEC::ApplicationStatusEnum::Ok
      when "impaired"          then AEC::ApplicationStatusEnum::Impaired
      when "initializing"      then AEC::ApplicationStatusEnum::Initializing
      when "insufficient-data" then AEC::ApplicationStatusEnum::InsufficientData
      when "not-applicable"    then AEC::ApplicationStatusEnum::NotApplicable
      when "suppressed"        then AEC::ApplicationStatusEnum::Suppressed
      else
        raise Exception.new("unknown enum value for 'ApplicationStatusEnum' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ApplicationStatusEnum::Ok               then "ok"
      when AEC::ApplicationStatusEnum::Impaired         then "impaired"
      when AEC::ApplicationStatusEnum::Initializing     then "initializing"
      when AEC::ApplicationStatusEnum::InsufficientData then "insufficient-data"
      when AEC::ApplicationStatusEnum::NotApplicable    then "not-applicable"
      when AEC::ApplicationStatusEnum::Suppressed       then "suppressed"
      else
        raise Exception.new("unknown enum value for 'ApplicationStatusEnum' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ApplicationStatusEnum?
      case key
      when "ok"                then AEC::ApplicationStatusEnum::Ok
      when "impaired"          then AEC::ApplicationStatusEnum::Impaired
      when "initializing"      then AEC::ApplicationStatusEnum::Initializing
      when "insufficient-data" then AEC::ApplicationStatusEnum::InsufficientData
      when "not-applicable"    then AEC::ApplicationStatusEnum::NotApplicable
      when "suppressed"        then AEC::ApplicationStatusEnum::Suppressed
      else
        nil
      end
    end
  end
end
