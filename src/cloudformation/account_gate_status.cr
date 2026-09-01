private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum AccountGateStatus
    Succeeded
    Failed
    Skipped

    def self.to_json(e : AccountGateStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::AccountGateStatus::Succeeded then "SUCCEEDED"
              when ACF::AccountGateStatus::Failed    then "FAILED"
              when ACF::AccountGateStatus::Skipped   then "SKIPPED"
              else
                raise Exception.new("unknown enum value for 'AccountGateStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::AccountGateStatus
      value = pull.read_string
      case value
      when "SUCCEEDED" then ACF::AccountGateStatus::Succeeded
      when "FAILED"    then ACF::AccountGateStatus::Failed
      when "SKIPPED"   then ACF::AccountGateStatus::Skipped
      else
        raise Exception.new("unknown enum value for 'AccountGateStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::AccountGateStatus::Succeeded then "SUCCEEDED"
      when ACF::AccountGateStatus::Failed    then "FAILED"
      when ACF::AccountGateStatus::Skipped   then "SKIPPED"
      else
        raise Exception.new("unknown enum value for 'AccountGateStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::AccountGateStatus?
      case key
      when "SUCCEEDED" then ACF::AccountGateStatus::Succeeded
      when "FAILED"    then ACF::AccountGateStatus::Failed
      when "SKIPPED"   then ACF::AccountGateStatus::Skipped
      else
        nil
      end
    end
  end
end
