private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum StackInstanceFilterName
    DetailedStatus
    LastOperationId
    DriftStatus

    def self.to_json(e : StackInstanceFilterName, json : JSON::Builder) : Nil
      value = case e
              when ACF::StackInstanceFilterName::DetailedStatus  then "DETAILED_STATUS"
              when ACF::StackInstanceFilterName::LastOperationId then "LAST_OPERATION_ID"
              when ACF::StackInstanceFilterName::DriftStatus     then "DRIFT_STATUS"
              else
                raise Exception.new("unknown enum value for 'StackInstanceFilterName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StackInstanceFilterName
      value = pull.read_string
      case value
      when "DETAILED_STATUS"   then ACF::StackInstanceFilterName::DetailedStatus
      when "LAST_OPERATION_ID" then ACF::StackInstanceFilterName::LastOperationId
      when "DRIFT_STATUS"      then ACF::StackInstanceFilterName::DriftStatus
      else
        raise Exception.new("unknown enum value for 'StackInstanceFilterName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StackInstanceFilterName::DetailedStatus  then "DETAILED_STATUS"
      when ACF::StackInstanceFilterName::LastOperationId then "LAST_OPERATION_ID"
      when ACF::StackInstanceFilterName::DriftStatus     then "DRIFT_STATUS"
      else
        raise Exception.new("unknown enum value for 'StackInstanceFilterName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StackInstanceFilterName?
      case key
      when "DETAILED_STATUS"   then ACF::StackInstanceFilterName::DetailedStatus
      when "LAST_OPERATION_ID" then ACF::StackInstanceFilterName::LastOperationId
      when "DRIFT_STATUS"      then ACF::StackInstanceFilterName::DriftStatus
      else
        nil
      end
    end
  end
end
