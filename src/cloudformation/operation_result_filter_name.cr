private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum OperationResultFilterName
    OperationResultStatus

    def self.to_json(e : OperationResultFilterName, json : JSON::Builder) : Nil
      value = case e
              when ACF::OperationResultFilterName::OperationResultStatus then "OPERATION_RESULT_STATUS"
              else
                raise Exception.new("unknown enum value for 'OperationResultFilterName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::OperationResultFilterName
      value = pull.read_string
      case value
      when "OPERATION_RESULT_STATUS" then ACF::OperationResultFilterName::OperationResultStatus
      else
        raise Exception.new("unknown enum value for 'OperationResultFilterName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::OperationResultFilterName::OperationResultStatus then "OPERATION_RESULT_STATUS"
      else
        raise Exception.new("unknown enum value for 'OperationResultFilterName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::OperationResultFilterName?
      case key
      when "OPERATION_RESULT_STATUS" then ACF::OperationResultFilterName::OperationResultStatus
      else
        nil
      end
    end
  end
end
