private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum GeneratedTemplateResourceStatus
    Pending
    InProgress
    Failed
    Complete

    def self.to_json(e : GeneratedTemplateResourceStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::GeneratedTemplateResourceStatus::Pending    then "PENDING"
              when ACF::GeneratedTemplateResourceStatus::InProgress then "IN_PROGRESS"
              when ACF::GeneratedTemplateResourceStatus::Failed     then "FAILED"
              when ACF::GeneratedTemplateResourceStatus::Complete   then "COMPLETE"
              else
                raise Exception.new("unknown enum value for 'GeneratedTemplateResourceStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::GeneratedTemplateResourceStatus
      value = pull.read_string
      case value
      when "PENDING"     then ACF::GeneratedTemplateResourceStatus::Pending
      when "IN_PROGRESS" then ACF::GeneratedTemplateResourceStatus::InProgress
      when "FAILED"      then ACF::GeneratedTemplateResourceStatus::Failed
      when "COMPLETE"    then ACF::GeneratedTemplateResourceStatus::Complete
      else
        raise Exception.new("unknown enum value for 'GeneratedTemplateResourceStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::GeneratedTemplateResourceStatus::Pending    then "PENDING"
      when ACF::GeneratedTemplateResourceStatus::InProgress then "IN_PROGRESS"
      when ACF::GeneratedTemplateResourceStatus::Failed     then "FAILED"
      when ACF::GeneratedTemplateResourceStatus::Complete   then "COMPLETE"
      else
        raise Exception.new("unknown enum value for 'GeneratedTemplateResourceStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::GeneratedTemplateResourceStatus?
      case key
      when "PENDING"     then ACF::GeneratedTemplateResourceStatus::Pending
      when "IN_PROGRESS" then ACF::GeneratedTemplateResourceStatus::InProgress
      when "FAILED"      then ACF::GeneratedTemplateResourceStatus::Failed
      when "COMPLETE"    then ACF::GeneratedTemplateResourceStatus::Complete
      else
        nil
      end
    end
  end
end
