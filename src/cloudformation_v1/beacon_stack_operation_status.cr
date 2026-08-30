private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum BeaconStackOperationStatus
    InProgress
    Succeeded
    Failed

    def self.to_json(e : BeaconStackOperationStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::BeaconStackOperationStatus::InProgress then "IN_PROGRESS"
              when ACF::BeaconStackOperationStatus::Succeeded  then "SUCCEEDED"
              when ACF::BeaconStackOperationStatus::Failed     then "FAILED"
              else
                raise Exception.new("unknown enum value for 'BeaconStackOperationStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::BeaconStackOperationStatus
      value = pull.read_string
      case value
      when "IN_PROGRESS" then ACF::BeaconStackOperationStatus::InProgress
      when "SUCCEEDED"   then ACF::BeaconStackOperationStatus::Succeeded
      when "FAILED"      then ACF::BeaconStackOperationStatus::Failed
      else
        raise Exception.new("unknown enum value for 'BeaconStackOperationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::BeaconStackOperationStatus::InProgress then "IN_PROGRESS"
      when ACF::BeaconStackOperationStatus::Succeeded  then "SUCCEEDED"
      when ACF::BeaconStackOperationStatus::Failed     then "FAILED"
      else
        raise Exception.new("unknown enum value for 'BeaconStackOperationStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::BeaconStackOperationStatus?
      case key
      when "IN_PROGRESS" then ACF::BeaconStackOperationStatus::InProgress
      when "SUCCEEDED"   then ACF::BeaconStackOperationStatus::Succeeded
      when "FAILED"      then ACF::BeaconStackOperationStatus::Failed
      else
        nil
      end
    end
  end
end
