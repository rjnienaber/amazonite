private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum StageStatus
    Pending
    NotApplicable
    NotStarted
    InProgress
    Succeeded
    PartialSuccess
    Failed

    def self.to_json(e : StageStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::StageStatus::Pending        then "PENDING"
              when ACF::StageStatus::NotApplicable  then "NOT_APPLICABLE"
              when ACF::StageStatus::NotStarted     then "NOT_STARTED"
              when ACF::StageStatus::InProgress     then "IN_PROGRESS"
              when ACF::StageStatus::Succeeded      then "SUCCEEDED"
              when ACF::StageStatus::PartialSuccess then "PARTIAL_SUCCESS"
              when ACF::StageStatus::Failed         then "FAILED"
              else
                raise Exception.new("unknown enum value for 'StageStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StageStatus
      value = pull.read_string
      case value
      when "PENDING"         then ACF::StageStatus::Pending
      when "NOT_APPLICABLE"  then ACF::StageStatus::NotApplicable
      when "NOT_STARTED"     then ACF::StageStatus::NotStarted
      when "IN_PROGRESS"     then ACF::StageStatus::InProgress
      when "SUCCEEDED"       then ACF::StageStatus::Succeeded
      when "PARTIAL_SUCCESS" then ACF::StageStatus::PartialSuccess
      when "FAILED"          then ACF::StageStatus::Failed
      else
        raise Exception.new("unknown enum value for 'StageStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StageStatus::Pending        then "PENDING"
      when ACF::StageStatus::NotApplicable  then "NOT_APPLICABLE"
      when ACF::StageStatus::NotStarted     then "NOT_STARTED"
      when ACF::StageStatus::InProgress     then "IN_PROGRESS"
      when ACF::StageStatus::Succeeded      then "SUCCEEDED"
      when ACF::StageStatus::PartialSuccess then "PARTIAL_SUCCESS"
      when ACF::StageStatus::Failed         then "FAILED"
      else
        raise Exception.new("unknown enum value for 'StageStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StageStatus?
      case key
      when "PENDING"         then ACF::StageStatus::Pending
      when "NOT_APPLICABLE"  then ACF::StageStatus::NotApplicable
      when "NOT_STARTED"     then ACF::StageStatus::NotStarted
      when "IN_PROGRESS"     then ACF::StageStatus::InProgress
      when "SUCCEEDED"       then ACF::StageStatus::Succeeded
      when "PARTIAL_SUCCESS" then ACF::StageStatus::PartialSuccess
      when "FAILED"          then ACF::StageStatus::Failed
      else
        nil
      end
    end
  end
end
