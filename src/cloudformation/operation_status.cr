private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum OperationStatus
    Pending
    InProgress
    Success
    Failed

    def self.to_json(e : OperationStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::OperationStatus::Pending    then "PENDING"
              when ACF::OperationStatus::InProgress then "IN_PROGRESS"
              when ACF::OperationStatus::Success    then "SUCCESS"
              when ACF::OperationStatus::Failed     then "FAILED"
              else
                raise Exception.new("unknown enum value for 'OperationStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::OperationStatus
      value = pull.read_string
      case value
      when "PENDING"     then ACF::OperationStatus::Pending
      when "IN_PROGRESS" then ACF::OperationStatus::InProgress
      when "SUCCESS"     then ACF::OperationStatus::Success
      when "FAILED"      then ACF::OperationStatus::Failed
      else
        raise Exception.new("unknown enum value for 'OperationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::OperationStatus::Pending    then "PENDING"
      when ACF::OperationStatus::InProgress then "IN_PROGRESS"
      when ACF::OperationStatus::Success    then "SUCCESS"
      when ACF::OperationStatus::Failed     then "FAILED"
      else
        raise Exception.new("unknown enum value for 'OperationStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::OperationStatus?
      case key
      when "PENDING"     then ACF::OperationStatus::Pending
      when "IN_PROGRESS" then ACF::OperationStatus::InProgress
      when "SUCCESS"     then ACF::OperationStatus::Success
      when "FAILED"      then ACF::OperationStatus::Failed
      else
        nil
      end
    end
  end
end
