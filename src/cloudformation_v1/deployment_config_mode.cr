private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum DeploymentConfigMode
    Standard
    Express

    def self.to_json(e : DeploymentConfigMode, json : JSON::Builder) : Nil
      value = case e
              when ACF::DeploymentConfigMode::Standard then "STANDARD"
              when ACF::DeploymentConfigMode::Express  then "EXPRESS"
              else
                raise Exception.new("unknown enum value for 'DeploymentConfigMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::DeploymentConfigMode
      value = pull.read_string
      case value
      when "STANDARD" then ACF::DeploymentConfigMode::Standard
      when "EXPRESS"  then ACF::DeploymentConfigMode::Express
      else
        raise Exception.new("unknown enum value for 'DeploymentConfigMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::DeploymentConfigMode::Standard then "STANDARD"
      when ACF::DeploymentConfigMode::Express  then "EXPRESS"
      else
        raise Exception.new("unknown enum value for 'DeploymentConfigMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::DeploymentConfigMode?
      case key
      when "STANDARD" then ACF::DeploymentConfigMode::Standard
      when "EXPRESS"  then ACF::DeploymentConfigMode::Express
      else
        nil
      end
    end
  end
end
