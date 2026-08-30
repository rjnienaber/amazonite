private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum ResourceScanStatus
    InProgress
    Failed
    Complete
    Expired

    def self.to_json(e : ResourceScanStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::ResourceScanStatus::InProgress then "IN_PROGRESS"
              when ACF::ResourceScanStatus::Failed     then "FAILED"
              when ACF::ResourceScanStatus::Complete   then "COMPLETE"
              when ACF::ResourceScanStatus::Expired    then "EXPIRED"
              else
                raise Exception.new("unknown enum value for 'ResourceScanStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::ResourceScanStatus
      value = pull.read_string
      case value
      when "IN_PROGRESS" then ACF::ResourceScanStatus::InProgress
      when "FAILED"      then ACF::ResourceScanStatus::Failed
      when "COMPLETE"    then ACF::ResourceScanStatus::Complete
      when "EXPIRED"     then ACF::ResourceScanStatus::Expired
      else
        raise Exception.new("unknown enum value for 'ResourceScanStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::ResourceScanStatus::InProgress then "IN_PROGRESS"
      when ACF::ResourceScanStatus::Failed     then "FAILED"
      when ACF::ResourceScanStatus::Complete   then "COMPLETE"
      when ACF::ResourceScanStatus::Expired    then "EXPIRED"
      else
        raise Exception.new("unknown enum value for 'ResourceScanStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::ResourceScanStatus?
      case key
      when "IN_PROGRESS" then ACF::ResourceScanStatus::InProgress
      when "FAILED"      then ACF::ResourceScanStatus::Failed
      when "COMPLETE"    then ACF::ResourceScanStatus::Complete
      when "EXPIRED"     then ACF::ResourceScanStatus::Expired
      else
        nil
      end
    end
  end
end
