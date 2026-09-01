private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum ResourceSignalStatus
    Success
    Failure

    def self.to_json(e : ResourceSignalStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::ResourceSignalStatus::Success then "SUCCESS"
              when ACF::ResourceSignalStatus::Failure then "FAILURE"
              else
                raise Exception.new("unknown enum value for 'ResourceSignalStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::ResourceSignalStatus
      value = pull.read_string
      case value
      when "SUCCESS" then ACF::ResourceSignalStatus::Success
      when "FAILURE" then ACF::ResourceSignalStatus::Failure
      else
        raise Exception.new("unknown enum value for 'ResourceSignalStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::ResourceSignalStatus::Success then "SUCCESS"
      when ACF::ResourceSignalStatus::Failure then "FAILURE"
      else
        raise Exception.new("unknown enum value for 'ResourceSignalStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::ResourceSignalStatus?
      case key
      when "SUCCESS" then ACF::ResourceSignalStatus::Success
      when "FAILURE" then ACF::ResourceSignalStatus::Failure
      else
        nil
      end
    end
  end
end
