private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  enum VpcLinkStatus
    Available
    Pending
    Deleting
    Failed

    def self.to_json(e : VpcLinkStatus, json : JSON::Builder) : Nil
      value = case e
              when AAG::VpcLinkStatus::Available then "AVAILABLE"
              when AAG::VpcLinkStatus::Pending   then "PENDING"
              when AAG::VpcLinkStatus::Deleting  then "DELETING"
              when AAG::VpcLinkStatus::Failed    then "FAILED"
              else
                raise Exception.new("unknown enum value for 'VpcLinkStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::VpcLinkStatus
      value = pull.read_string
      case value
      when "AVAILABLE" then AAG::VpcLinkStatus::Available
      when "PENDING"   then AAG::VpcLinkStatus::Pending
      when "DELETING"  then AAG::VpcLinkStatus::Deleting
      when "FAILED"    then AAG::VpcLinkStatus::Failed
      else
        raise Exception.new("unknown enum value for 'VpcLinkStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::VpcLinkStatus::Available then "AVAILABLE"
      when AAG::VpcLinkStatus::Pending   then "PENDING"
      when AAG::VpcLinkStatus::Deleting  then "DELETING"
      when AAG::VpcLinkStatus::Failed    then "FAILED"
      else
        raise Exception.new("unknown enum value for 'VpcLinkStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::VpcLinkStatus?
      case key
      when "AVAILABLE" then AAG::VpcLinkStatus::Available
      when "PENDING"   then AAG::VpcLinkStatus::Pending
      when "DELETING"  then AAG::VpcLinkStatus::Deleting
      when "FAILED"    then AAG::VpcLinkStatus::Failed
      else
        nil
      end
    end
  end
end
