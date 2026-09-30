private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityManagerDataExportStatus
    Pending
    InProgress
    Delivered
    Failed

    def self.to_json(e : CapacityManagerDataExportStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityManagerDataExportStatus::Pending    then "pending"
              when AEC::CapacityManagerDataExportStatus::InProgress then "in-progress"
              when AEC::CapacityManagerDataExportStatus::Delivered  then "delivered"
              when AEC::CapacityManagerDataExportStatus::Failed     then "failed"
              else
                raise Exception.new("unknown enum value for 'CapacityManagerDataExportStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityManagerDataExportStatus
      value = pull.read_string
      case value
      when "pending"     then AEC::CapacityManagerDataExportStatus::Pending
      when "in-progress" then AEC::CapacityManagerDataExportStatus::InProgress
      when "delivered"   then AEC::CapacityManagerDataExportStatus::Delivered
      when "failed"      then AEC::CapacityManagerDataExportStatus::Failed
      else
        raise Exception.new("unknown enum value for 'CapacityManagerDataExportStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityManagerDataExportStatus::Pending    then "pending"
      when AEC::CapacityManagerDataExportStatus::InProgress then "in-progress"
      when AEC::CapacityManagerDataExportStatus::Delivered  then "delivered"
      when AEC::CapacityManagerDataExportStatus::Failed     then "failed"
      else
        raise Exception.new("unknown enum value for 'CapacityManagerDataExportStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityManagerDataExportStatus?
      case key
      when "pending"     then AEC::CapacityManagerDataExportStatus::Pending
      when "in-progress" then AEC::CapacityManagerDataExportStatus::InProgress
      when "delivered"   then AEC::CapacityManagerDataExportStatus::Delivered
      when "failed"      then AEC::CapacityManagerDataExportStatus::Failed
      else
        nil
      end
    end
  end
end
