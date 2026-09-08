private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ImageState
    Pending
    Available
    Invalid
    Deregistered
    Transient
    Failed
    Error
    Disabled

    def self.to_json(e : ImageState, json : JSON::Builder) : Nil
      value = case e
              when AEC::ImageState::Pending      then "pending"
              when AEC::ImageState::Available    then "available"
              when AEC::ImageState::Invalid      then "invalid"
              when AEC::ImageState::Deregistered then "deregistered"
              when AEC::ImageState::Transient    then "transient"
              when AEC::ImageState::Failed       then "failed"
              when AEC::ImageState::Error        then "error"
              when AEC::ImageState::Disabled     then "disabled"
              else
                raise Exception.new("unknown enum value for 'ImageState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ImageState
      value = pull.read_string
      case value
      when "pending"      then AEC::ImageState::Pending
      when "available"    then AEC::ImageState::Available
      when "invalid"      then AEC::ImageState::Invalid
      when "deregistered" then AEC::ImageState::Deregistered
      when "transient"    then AEC::ImageState::Transient
      when "failed"       then AEC::ImageState::Failed
      when "error"        then AEC::ImageState::Error
      when "disabled"     then AEC::ImageState::Disabled
      else
        raise Exception.new("unknown enum value for 'ImageState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ImageState::Pending      then "pending"
      when AEC::ImageState::Available    then "available"
      when AEC::ImageState::Invalid      then "invalid"
      when AEC::ImageState::Deregistered then "deregistered"
      when AEC::ImageState::Transient    then "transient"
      when AEC::ImageState::Failed       then "failed"
      when AEC::ImageState::Error        then "error"
      when AEC::ImageState::Disabled     then "disabled"
      else
        raise Exception.new("unknown enum value for 'ImageState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ImageState?
      case key
      when "pending"      then AEC::ImageState::Pending
      when "available"    then AEC::ImageState::Available
      when "invalid"      then AEC::ImageState::Invalid
      when "deregistered" then AEC::ImageState::Deregistered
      when "transient"    then AEC::ImageState::Transient
      when "failed"       then AEC::ImageState::Failed
      when "error"        then AEC::ImageState::Error
      when "disabled"     then AEC::ImageState::Disabled
      else
        nil
      end
    end
  end
end
