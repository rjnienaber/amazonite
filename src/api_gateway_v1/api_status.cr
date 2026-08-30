private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  enum ApiStatus
    Updating
    Available
    Pending
    Failed

    def self.to_json(e : ApiStatus, json : JSON::Builder) : Nil
      value = case e
              when AAG::ApiStatus::Updating  then "UPDATING"
              when AAG::ApiStatus::Available then "AVAILABLE"
              when AAG::ApiStatus::Pending   then "PENDING"
              when AAG::ApiStatus::Failed    then "FAILED"
              else
                raise Exception.new("unknown enum value for 'ApiStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::ApiStatus
      value = pull.read_string
      case value
      when "UPDATING"  then AAG::ApiStatus::Updating
      when "AVAILABLE" then AAG::ApiStatus::Available
      when "PENDING"   then AAG::ApiStatus::Pending
      when "FAILED"    then AAG::ApiStatus::Failed
      else
        raise Exception.new("unknown enum value for 'ApiStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::ApiStatus::Updating  then "UPDATING"
      when AAG::ApiStatus::Available then "AVAILABLE"
      when AAG::ApiStatus::Pending   then "PENDING"
      when AAG::ApiStatus::Failed    then "FAILED"
      else
        raise Exception.new("unknown enum value for 'ApiStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::ApiStatus?
      case key
      when "UPDATING"  then AAG::ApiStatus::Updating
      when "AVAILABLE" then AAG::ApiStatus::Available
      when "PENDING"   then AAG::ApiStatus::Pending
      when "FAILED"    then AAG::ApiStatus::Failed
      else
        nil
      end
    end
  end
end
