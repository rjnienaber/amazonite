private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum BeforeValueFrom
    PreviousDeploymentState
    ActualState

    def self.to_json(e : BeforeValueFrom, json : JSON::Builder) : Nil
      value = case e
              when ACF::BeforeValueFrom::PreviousDeploymentState then "PREVIOUS_DEPLOYMENT_STATE"
              when ACF::BeforeValueFrom::ActualState             then "ACTUAL_STATE"
              else
                raise Exception.new("unknown enum value for 'BeforeValueFrom' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::BeforeValueFrom
      value = pull.read_string
      case value
      when "PREVIOUS_DEPLOYMENT_STATE" then ACF::BeforeValueFrom::PreviousDeploymentState
      when "ACTUAL_STATE"              then ACF::BeforeValueFrom::ActualState
      else
        raise Exception.new("unknown enum value for 'BeforeValueFrom' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::BeforeValueFrom::PreviousDeploymentState then "PREVIOUS_DEPLOYMENT_STATE"
      when ACF::BeforeValueFrom::ActualState             then "ACTUAL_STATE"
      else
        raise Exception.new("unknown enum value for 'BeforeValueFrom' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::BeforeValueFrom?
      case key
      when "PREVIOUS_DEPLOYMENT_STATE" then ACF::BeforeValueFrom::PreviousDeploymentState
      when "ACTUAL_STATE"              then ACF::BeforeValueFrom::ActualState
      else
        nil
      end
    end
  end
end
