private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum DeploymentMode
    RevertDrift

    def self.to_json(e : DeploymentMode, json : JSON::Builder) : Nil
      value = case e
              when ACF::DeploymentMode::RevertDrift then "REVERT_DRIFT"
              else
                raise Exception.new("unknown enum value for 'DeploymentMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::DeploymentMode
      value = pull.read_string
      case value
      when "REVERT_DRIFT" then ACF::DeploymentMode::RevertDrift
      else
        raise Exception.new("unknown enum value for 'DeploymentMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::DeploymentMode::RevertDrift then "REVERT_DRIFT"
      else
        raise Exception.new("unknown enum value for 'DeploymentMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::DeploymentMode?
      case key
      when "REVERT_DRIFT" then ACF::DeploymentMode::RevertDrift
      else
        nil
      end
    end
  end
end
