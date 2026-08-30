private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum StackInstanceDetailedStatus
    Pending
    Running
    Succeeded
    Failed
    Cancelled
    Inoperable
    SkippedSuspendedAccount
    FailedImport

    def self.to_json(e : StackInstanceDetailedStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::StackInstanceDetailedStatus::Pending                 then "PENDING"
              when ACF::StackInstanceDetailedStatus::Running                 then "RUNNING"
              when ACF::StackInstanceDetailedStatus::Succeeded               then "SUCCEEDED"
              when ACF::StackInstanceDetailedStatus::Failed                  then "FAILED"
              when ACF::StackInstanceDetailedStatus::Cancelled               then "CANCELLED"
              when ACF::StackInstanceDetailedStatus::Inoperable              then "INOPERABLE"
              when ACF::StackInstanceDetailedStatus::SkippedSuspendedAccount then "SKIPPED_SUSPENDED_ACCOUNT"
              when ACF::StackInstanceDetailedStatus::FailedImport            then "FAILED_IMPORT"
              else
                raise Exception.new("unknown enum value for 'StackInstanceDetailedStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StackInstanceDetailedStatus
      value = pull.read_string
      case value
      when "PENDING"                   then ACF::StackInstanceDetailedStatus::Pending
      when "RUNNING"                   then ACF::StackInstanceDetailedStatus::Running
      when "SUCCEEDED"                 then ACF::StackInstanceDetailedStatus::Succeeded
      when "FAILED"                    then ACF::StackInstanceDetailedStatus::Failed
      when "CANCELLED"                 then ACF::StackInstanceDetailedStatus::Cancelled
      when "INOPERABLE"                then ACF::StackInstanceDetailedStatus::Inoperable
      when "SKIPPED_SUSPENDED_ACCOUNT" then ACF::StackInstanceDetailedStatus::SkippedSuspendedAccount
      when "FAILED_IMPORT"             then ACF::StackInstanceDetailedStatus::FailedImport
      else
        raise Exception.new("unknown enum value for 'StackInstanceDetailedStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StackInstanceDetailedStatus::Pending                 then "PENDING"
      when ACF::StackInstanceDetailedStatus::Running                 then "RUNNING"
      when ACF::StackInstanceDetailedStatus::Succeeded               then "SUCCEEDED"
      when ACF::StackInstanceDetailedStatus::Failed                  then "FAILED"
      when ACF::StackInstanceDetailedStatus::Cancelled               then "CANCELLED"
      when ACF::StackInstanceDetailedStatus::Inoperable              then "INOPERABLE"
      when ACF::StackInstanceDetailedStatus::SkippedSuspendedAccount then "SKIPPED_SUSPENDED_ACCOUNT"
      when ACF::StackInstanceDetailedStatus::FailedImport            then "FAILED_IMPORT"
      else
        raise Exception.new("unknown enum value for 'StackInstanceDetailedStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StackInstanceDetailedStatus?
      case key
      when "PENDING"                   then ACF::StackInstanceDetailedStatus::Pending
      when "RUNNING"                   then ACF::StackInstanceDetailedStatus::Running
      when "SUCCEEDED"                 then ACF::StackInstanceDetailedStatus::Succeeded
      when "FAILED"                    then ACF::StackInstanceDetailedStatus::Failed
      when "CANCELLED"                 then ACF::StackInstanceDetailedStatus::Cancelled
      when "INOPERABLE"                then ACF::StackInstanceDetailedStatus::Inoperable
      when "SKIPPED_SUSPENDED_ACCOUNT" then ACF::StackInstanceDetailedStatus::SkippedSuspendedAccount
      when "FAILED_IMPORT"             then ACF::StackInstanceDetailedStatus::FailedImport
      else
        nil
      end
    end
  end
end
